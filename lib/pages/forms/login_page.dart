import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ssg_app/blocs/auth/auth_bloc.dart';
import 'package:ssg_app/blocs/check_box/check_box_bloc.dart';
import 'package:ssg_app/blocs/credential/user_bloc.dart';
import 'package:ssg_app/pages/forms/forget_page.dart';
import 'package:ssg_app/pages/forms/otp_v_page.dart';
import 'package:ssg_app/pages/navigation_page.dart';
import 'package:ssg_app/utils/app_helpers.dart';
import 'package:ssg_app/widgets/app_alert.dart';
import 'package:ssg_app/widgets/app_button.dart';
import 'package:ssg_app/utils/app_colors.dart';
import 'package:ssg_app/utils/app_text_style.dart';
import 'package:ssg_app/widgets/app_input.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.lightColor,
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: AppColors.primaryColor),
            child: Padding(
              padding: const EdgeInsets.only(left: 50.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Masuk',
                    style: AppTextStyle.title.copyWith(
                      color: AppColors.lightColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Selamat Datang',
                    style: AppTextStyle.caption.copyWith(
                      color: AppColors.lightColor.withOpacity(0.5),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Silahkan masukan data yang sesuai!!',
                    style: AppTextStyle.caption.copyWith(
                      color: AppColors.lightColor,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) async {
              if (state is AuthSuccess) {
                context.read<UserBloc>().add(LoadData());
                AppHelpers.goTo(context, NavigationPage(), true, false);
              }
              if (state is AuthPending) {
                AppHelpers.goTo(
                  context,
                  OtpVPage(userId: state.id, otpType: 1, phoneNumber: state.phoneNumber,password: state.password),
                  true,
                  true,
                );
              }
              if (state is AuthError) {
                AppAlert.snakBarShow(context, state.message);
              }
            },
            builder: (context, fmState) {
              return DraggableScrollableSheet(
                maxChildSize: 1.0,
                initialChildSize: 0.8,
                minChildSize: 0.8,
                builder: (context, controller) {
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColors.lightColor,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                    ),
                    child: SingleChildScrollView(
                      controller: controller,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          AppInput(
                            label: "NOMOR HP",
                            hint: "Nomor Hp",
                            keyboardType: TextInputType.number,
                            yPadding: 20.0,
                            xPadding: 30.0,
                            required: true,
                            onChange: (value) {
                              context.read<AuthBloc>().add(
                                InputChange(value, fmState.password),
                              );
                            },
                          ).input(),
                          BlocProvider(
                            create: (context) => CheckBoxBloc(isChecked: true),
                            child: BlocBuilder<CheckBoxBloc, CheckBoxState>(
                              builder: (context, state) {
                                return AppInput(
                                  label: "KATA SANDI",
                                  hint: "Kata Sandi",
                                  yPadding: 20.0,
                                  xPadding: 30.0,
                                  onChange: (value) {
                                    context.read<AuthBloc>().add(
                                      InputChange(fmState.phoneNumber, value),
                                    );
                                  },
                                  icon:
                                      state.value
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                  isPassword: state.value,
                                  onIconPressed: () {
                                    context.read<CheckBoxBloc>().add(
                                      ChangeValue(value: !state.value),
                                    );
                                  },
                                  required: true,
                                ).input();
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: BlocProvider(
                              create:
                                  (context) => CheckBoxBloc(isChecked: false),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      BlocBuilder<CheckBoxBloc, CheckBoxState>(
                                        builder: (context, state) {
                                          return Checkbox(
                                            value: state.value,
                                            onChanged: (value) {
                                              context.read<CheckBoxBloc>().add(
                                                ChangeValue(
                                                  value: !state.value,
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                      Text(
                                        "Ingat Saya",
                                        style: AppTextStyle.bodyText.copyWith(
                                          color: AppColors.darkColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      child: Text(
                                        "Lupa Kata Sandi?",
                                        style: AppTextStyle.bodyText.copyWith(
                                          color: AppColors.darkColor,
                                        ),
                                      ),
                                      onTap: () {
                                        AppHelpers.goTo(context, ForgetPage());
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child:
                                  AppButton(
                                    text: "Masuk",
                                    onPressedButton: () async {
                                      context.read<AuthBloc>().add(
                                        Submit(
                                          fmState.phoneNumber,
                                          fmState.password,
                                          context,
                                        ),
                                      );
                                    },
                                    fullWidth: true,
                                  ).build(),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: GestureDetector(
                                onTap: () {
                                  AppHelpers.launchUrlPath(dotenv.env['APP_REGISTRATION_URL'] ?? 'https://santri.siapguna.org/login/signup');
                                },
                                child: Text(
                                  "Belum punya akun?",
                                  style: AppTextStyle.bodyText.copyWith(
                                    color: AppColors.skyColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30.0,
                              ),
                              child:
                                  AppButton(
                                    text: "Google",
                                    onPressedButton: () {
                                      AppAlert.showAlertDialog(
                                        context,
                                        "Maaf!",
                                        "Fitur ini belum tersedia",
                                        "Ok",
                                        null,
                                        null,
                                        null,
                                        AppColors.lightColor,
                                        AppColors.primaryColor,
                                        null,
                                        null,
                                        MainAxisAlignment.center,
                                      );
                                    },
                                    bgColor: AppColors.lightColor,
                                    fgColor: AppColors.darkColor,
                                    sideColor: AppColors.darkColor,
                                    fullWidth: true,
                                    isIcon: FontAwesomeIcons.google,
                                    bordered: true,
                                  ).withIcon(),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child:
                                  AppButton(
                                    text: "Facebook",
                                    onPressedButton: () {
                                      AppAlert.showAlertDialog(
                                        context,
                                        "Maaf!",
                                        "Fitur ini belum tersedia",
                                        "Ok",
                                        null,
                                        null,
                                        null,
                                        AppColors.lightColor,
                                        AppColors.primaryColor,
                                        null,
                                        null,
                                        MainAxisAlignment.center,
                                      );
                                    },
                                    bgColor: AppColors.skyColor,
                                    fgColor: AppColors.lightColor,
                                    sideColor: AppColors.skyColor,
                                    fullWidth: true,
                                    isIcon: FontAwesomeIcons.facebookF,
                                  ).withIcon(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
