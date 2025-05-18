import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ssg_app/blocs/bookmark/bookmark_bloc.dart';
import 'package:ssg_app/blocs/counter_cubit/counter_cubit.dart';
import 'package:ssg_app/blocs/quran/quran_bloc.dart';
import 'package:ssg_app/utils/app_colors.dart';
import 'package:ssg_app/utils/app_text_style.dart';
import 'package:ssg_app/pages/quran/quran_page_layout.dart';

class QuranPage extends StatelessWidget {
  final int? page;
  const QuranPage({super.key, this.page});

  @override
  Widget build(BuildContext context) {
    context.read<QuranBloc>().add(GetPage(noPage: this.page ?? 1));
    context.read<BookmarkBloc>().add(GetBookmark(page: this.page ?? 1));
    context.read<CounterCubit>().change(page ?? 1);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.accentColor,
        foregroundColor: AppColors.lightColor,
        title: Text("Quran Perhalaman"),
        titleTextStyle: AppTextStyle.title2.copyWith(
          color: AppColors.lightColor,
        ),
      ),
      body: Container(
        clipBehavior: Clip.none,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [HeaderPage(), BodyPage()],
        ),
      ),
    );
  }
}
