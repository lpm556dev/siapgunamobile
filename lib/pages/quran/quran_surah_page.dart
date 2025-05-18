import 'package:flutter/material.dart';
import 'package:ssg_app/utils/app_colors.dart';
import 'package:ssg_app/utils/app_text_style.dart';
import 'package:ssg_app/pages/quran/quran_surah_layout.dart';

class QuranSurahPage extends StatelessWidget {
  const QuranSurahPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.accentColor,
        foregroundColor: AppColors.lightColor,
        title: Text("Quran Persurah"),
        titleTextStyle: AppTextStyle.title2.copyWith(
          color: AppColors.lightColor,
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [HeaderSurah(), BodySurah()],
        ),
      ),
    );
  }
}
