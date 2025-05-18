import 'package:flutter/material.dart';
import 'package:ssg_app/pages/forms/login_page.dart';
import 'package:ssg_app/utils/app_helpers.dart';
import 'package:ssg_app/utils/app_colors.dart';
import 'package:ssg_app/utils/app_text_style.dart';
import 'package:ssg_app/widgets/app_button.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: AppColors.lightColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 150),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                    child: Image.asset('assets/images/splash-icon.png'),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          DraggableScrollableSheet(
            maxChildSize: 0.6,
            initialChildSize: 0.5,
            minChildSize: 0.5,
            builder: (context, controller) {
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: controller,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 25.0,
                              top: 50.0,
                            ),
                            child: Text(
                              "Assalamu'Alaikum",
                              style: AppTextStyle.title2.copyWith(
                                color: AppColors.lightColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Text(
                              "Selamat Datang di Aplikasi Pendidikan dan Pelatihan Santri Siap Guna.",
                              style: AppTextStyle.bodyText.copyWith(
                                color: AppColors.lightColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 25.0,
                          right: 25.0,
                          top: 50.0,
                          bottom: 40.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppButton(
                              text: "Masuk",
                              onPressedButton: () {
                                AppHelpers.goTo(
                                  context,
                                  LoginPage(),
                                  true,
                                  true,
                                );
                              },
                              roundedFull: true,
                              bgColor: AppColors.secondaryColor,
                              fgColor: AppColors.darkColor,
                            ).build(),
                            AppButton(
                              text: "Daftar",
                              onPressedButton: () {
                                AppHelpers.launchUrlPath();
                              },
                              bgColor: AppColors.accentColor,
                              fgColor: AppColors.darkColor,
                              roundedFull: true,
                            ).build(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
