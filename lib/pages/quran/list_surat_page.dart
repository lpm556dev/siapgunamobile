import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ssg_app/blocs/quran/quran_bloc.dart';
import 'package:ssg_app/blocs/quran_surat_list/qr_list_surat_bloc.dart';
import 'package:ssg_app/pages/quran/quran_surah_page.dart';
import 'package:ssg_app/utils/app_colors.dart';
import 'package:ssg_app/utils/app_helpers.dart';
import 'package:ssg_app/utils/app_text_style.dart';
import 'package:ssg_app/widgets/app_card.dart';
import 'package:ssg_app/widgets/app_list_component.dart';

class ListSuratPage extends StatelessWidget {
  const ListSuratPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<QrListSuratBloc, QrListSuratState>(
        builder: (listCtx, state) {
          if (state is QrListSuratError) {
            return Container(
              child: Center(
                child: Text(
                  state.message,
                  style: AppTextStyle.subtitle.copyWith(
                    color: AppColors.darkColor,
                  ),
                ),
              ),
            );
          } else if (state is SurahListLoaded) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.result.length,
              itemBuilder: (context, index) {
                final surat = state.result[index];
                return AppCard.fill(
                  AppListComponent.ListMenu(
                    "QS: ${surat.noSurat} - ${AppHelpers.toCapitalize(surat.nmSurat.toString())}",
                    "${surat.jmlAyat} Ayat, ${surat.artiSurat}",
                    () {
                      context.read<QuranBloc>().add(
                        GetSurah(noSurah: surat.noSurat!),
                      );
                      AppHelpers.goTo(context, QuranSurahPage());
                    },
                    Icon(FontAwesomeIcons.bookQuran),
                    Icon(Icons.chevron_right),
                    null,
                    true,
                  ),
                  AppColors.reefColor
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
