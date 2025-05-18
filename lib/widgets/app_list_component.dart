import 'package:flutter/material.dart';
import 'package:ssg_app/pages/nav_screens/home_screen.dart';
import 'package:ssg_app/pages/nav_screens/my_screen.dart';
import 'package:ssg_app/pages/nav_screens/news_screen.dart';
import 'package:ssg_app/pages/nav_screens/quran_menu_screen.dart';
import 'package:ssg_app/pages/nav_screens/setting_screen.dart';
import 'package:ssg_app/pages/quran/bookmark_page.dart';
import 'package:ssg_app/pages/quran/list_quran_page.dart';
import 'package:ssg_app/pages/quran/list_surat_page.dart';
import 'package:ssg_app/utils/app_colors.dart';

class AppListComponent {
  static List<Widget> page = [
    HomeScreen(),
    QuranMenuScreen(),
    MyScreen(),
    NewScreen(),
    SettingScreen(),
  ];

  static List<String> appBarTitle = [
    "Beranda",
    "Al Qur'an",
    "Mutaba'ah Yaumiyah",
    "Berita",
    "Menu",
  ];

  static Widget ListMenu(
    String title,
    String? subtitle,
    void Function() ontap,
    Icon? leadIcon,
    Icon? trail,
    Widget? avatarIcon, [
    bool isTitleBold = false,
    Color titleColor = AppColors.darkColor,
    Color subtitleColor = AppColors.darkColor,
    double titleSize = 16.5,
    double subtitleSize = 14,
  ]) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontWeight: isTitleBold ? FontWeight.bold : FontWeight.normal,
          fontSize: titleSize,
          color: titleColor,
        ),
      ),
      subtitle:
          subtitle != null
              ? Text(
                subtitle,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: subtitleSize, color: subtitleColor),
              )
              : null,
      leading: leadIcon ?? avatarIcon,
      trailing: trail ?? null,
      onTap: ontap,
      textColor: AppColors.darkColor,
    );
  }

  static List<Widget> quranMenu = [
    ListQuranPage(),
    ListSuratPage(),
    BookmarkPage(),
  ];

  static List<String> daysName = [
    "Senin",
    "Selasa",
    "Rabu",
    "Kamis",
    "Jum'at",
    "Sabtu",
    "Ahad",
  ];

  static List<String> monthName = ['Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'];
}
