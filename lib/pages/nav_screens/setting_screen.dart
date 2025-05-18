import 'package:flutter/material.dart';
import 'package:ssg_app/data/repositories/user_repo.dart';
import 'package:ssg_app/main.dart';
import 'package:ssg_app/utils/app_colors.dart';
import 'package:ssg_app/utils/app_helpers.dart';
import 'package:ssg_app/widgets/app_alert.dart';
import 'package:ssg_app/widgets/app_list_component.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppListComponent.ListMenu(
              "Profil",
              "Edit profil, detail profil",
              () {},
              Icon(Icons.person),
              null,
              null,
            ),
            AppListComponent.ListMenu(
              "Bahasa",
              "Bahasa Indonesia",
              () {},
              Icon(Icons.language),
              null,
              null,
            ),
            AppListComponent.ListMenu(
              "Bantuan",
              "Pusat bantuan, hubungi kami, kebijakan privasi",
              () {},
              Icon(Icons.help),
              null,
              null,
            ),
            AppListComponent.ListMenu(
              "Keluar",
              "Akhiri sesi anda",
              () {
                AppAlert.showAlertDialog(
                  context,
                  "Keluar",
                  "Apakah anda yakin ingin keluar?",
                  "Ya",
                  "Tidak",
                  () {
                    AppAlert.snakBarShow(context, "Logout Berhasil");
                    UserRepository().logout(() {
                      AppHelpers.goTo(context, SplashScreen());
                    });
                  },
                  () {
                    AppHelpers.goBack(context);
                  },
                  AppColors.lightColor,
                  AppColors.dangerColor,
                  AppColors.lightColor,
                  AppColors.primaryColor,
                );
              },
              Icon(Icons.logout),
              null,
              null,
            ),
          ],
        ),
      ),
    );
  }
}
