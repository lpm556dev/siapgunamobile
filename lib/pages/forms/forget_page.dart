import 'package:flutter/material.dart';
import 'package:ssg_app/pages/forms/otp_v_page.dart';
import 'package:ssg_app/utils/app_helpers.dart';
import 'package:ssg_app/utils/app_colors.dart';
import 'package:ssg_app/utils/app_text_style.dart';
import 'package:ssg_app/widgets/app_button.dart';
import 'package:ssg_app/widgets/app_input.dart';

class ForgetPage extends StatelessWidget {
  const ForgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Widget _appSpace = SizedBox(height: 20);
    return Scaffold(
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
                      vertical: 35,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Lupa Kata Sandi", style: AppTextStyle.title2),
                        _appSpace,
                        Text(
                          "Masukan no hp yang terdafatar untuk reset kata sandi",
                          style: AppTextStyle.bodyText.copyWith(fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                        _appSpace,
                        AppInput(
                          label: "NOMOR HP",
                          hint: "Nomor Hp",
                          keyboardType: TextInputType.phone,
                        ).input(),
                        _appSpace,
                        AppButton(
                          text: "Kirim OTP",
                          onPressedButton: () {
                            AppHelpers.goTo(context, OtpVPage(userId: 0, phoneNumber: "", password: ""));
                          },
                          fullWidth: true,
                        ).build(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
