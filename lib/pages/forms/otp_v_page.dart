import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:ssg_app/blocs/otp_time/otp_timer_bloc.dart';
import 'package:ssg_app/data/repositories/user_repo.dart';
import 'package:ssg_app/pages/navigation_page.dart';
import 'package:ssg_app/utils/app_colors.dart';
import 'package:ssg_app/utils/app_helpers.dart';
import 'package:ssg_app/utils/app_text_style.dart';
import 'package:ssg_app/widgets/app_alert.dart';

class OtpVPage extends StatelessWidget {
  final int otpType;
  final int userId;
  final String phoneNumber;
  final String password;
  const OtpVPage({
    super.key,
    required this.userId,
    this.otpType = 0,
    required this.phoneNumber,
    required this.password,
  });

  static const List<String> listType = ["Forget", "Login"];
  @override
  Widget build(BuildContext context) {
    const Widget _appSpace = SizedBox(height: 20);
    return BlocProvider(
      create: (context) => OtpTimerBloc()..add(OtpTimerStarted()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.lightColor,
        ),
        body: Container(
          color: AppColors.primaryColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    shadowColor: AppColors.darkColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 30,
                      ),
                      child: Column(
                        children: [
                          Text("Kode Verifikasi", style: AppTextStyle.title2),
                          _appSpace,
                          Text(
                            "Masukan Kode OTP yang dikirimkan ke nomor Hp Anda ",
                            style: AppTextStyle.bodyText.copyWith(fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                          _appSpace,
                          Text(
                            "KODE OTP",
                            style: AppTextStyle.label.copyWith(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          OtpTextField(
                            numberOfFields: 6,
                            showFieldAsBox: true,
                            onCodeChanged: (String value) {},
                            borderRadius: BorderRadius.circular(10),
                            borderColor: AppColors.skyColor,
                            borderWidth: 1.5,
                            onSubmit: (value) async {
                              if (listType[otpType] == "Login") {
                                final response = await UserRepository()
                                    .loginAfterOtpVerify(
                                      phoneNumber,
                                      password,
                                      userId,
                                      value,
                                    );
                                if (response == true) {
                                  AppHelpers.goTo(
                                    context,
                                    NavigationPage(),
                                    true,
                                    false,
                                  );
                                } else {
                                  AppAlert.popUp(context, [
                                    Text(response ?? 'OTP verification failed'),
                                  ]);
                                }
                              }
                            },
                          ),
                          _appSpace,
                          BlocBuilder<OtpTimerBloc, OtpTimerState>(
                            builder: (context, state) {
                              final isButtonEnabled =
                                  state is OtpTimerRunComplete;
                              return GestureDetector(
                                onTap:
                                    isButtonEnabled
                                        ? () async {
                                          final resendResponse =
                                              await UserRepository().login(
                                                phoneNumber,
                                                password,
                                              );
                                          AppAlert.snakBarShow(
                                            context,
                                            resendResponse['message'] != null ? "OTP Baru berhasil dikirm silahkan cek whatsapp anda!" : "Gagal mengirim ulang OTP!",
                                          );
                                          context.read<OtpTimerBloc>().add(
                                            OtpTimerStarted(),
                                          );
                                        }
                                        : null,
                                child: Text(
                                  isButtonEnabled
                                      ? "Kirim ulang"
                                      : "Kirim ulang dalam ${state.duration}s",
                                  style: TextStyle(
                                    color:
                                        isButtonEnabled
                                            ? AppColors.primaryColor
                                            : Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
