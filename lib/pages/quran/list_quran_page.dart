import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ssg_app/blocs/quran_page_list/qr_list_page_bloc.dart';
import 'package:ssg_app/pages/quran/quran_page.dart';
import 'package:ssg_app/utils/app_colors.dart';
import 'package:ssg_app/utils/app_helpers.dart';
import 'package:ssg_app/utils/app_text_style.dart';
import 'package:ssg_app/widgets/app_card.dart';
import 'package:ssg_app/widgets/app_list_component.dart';

class ListQuranPage extends StatelessWidget {
  const ListQuranPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<QrListPageBloc, QrListPageState>(
        builder: (listCtx, state) {
          if (state is QrListPageError) {
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
          } else if (state is PageListLoaded) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.result.length,
              itemBuilder: (context, index) {
                final hal = state.result[index];
                return AppCard.fill(
                  AppListComponent.ListMenu(
                    "Hal: ${hal.item2.noHal} - ${AppHelpers.toCapitalize(hal.item1.nmSurat.toString())}",
                    "Juz ${hal.item3.noJuz}, ${hal.item1.tmpTurun}",
                    () {
                      AppHelpers.goTo(context, QuranPage(page: hal.item2.noHal));
                    },
                    Icon(FontAwesomeIcons.bookQuran),
                    Icon(Icons.chevron_right),
                    null,
                    true
                  ),
                  AppColors.milkFrothColor
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator()
            );
        },
      ),
    );
  }
}
