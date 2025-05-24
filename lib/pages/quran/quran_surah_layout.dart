import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ssg_app/blocs/font_size/font_size_bloc.dart';
import 'package:ssg_app/blocs/quran/quran_bloc.dart';
import 'package:ssg_app/utils/app_colors.dart';
import 'package:ssg_app/utils/app_helpers.dart';
import 'package:ssg_app/utils/app_text_style.dart';
import 'package:ssg_app/widgets/app_card.dart';

class HeaderSurah extends StatelessWidget {
  const HeaderSurah({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: AppCard.bordered(
                BlocBuilder<QuranBloc, QuranState>(
                      builder: (context, state) {
                        if (state is QuranAyatLoaded) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                state.ket[0].nmSurat.toString(),
                                style: AppTextStyle.subtitle.copyWith(fontSize: 15),
                              ),
                              Text(
                                state.ket[0].artiSurat.toString(),
                                style: AppTextStyle.label.copyWith(fontSize: 12),
                              ),
                              Text(
                                "Juz ${state.ayat[0].noJuz}/Hal ${state.ayat[0].noHal}",
                                style: AppTextStyle.label.copyWith(fontSize: 10),
                              ),
                            ],
                          );
                        }
                        if (state is QuranPageLoaded) {
                          context.read<QuranBloc>().add(GetSurah(noSurah: 1));
                          return Center(child: CircularProgressIndicator());
                        }
                        return Column(
                          children: [
                            Text("{{NAMA_SURAT}}", style: AppTextStyle.subtitle.copyWith(fontSize: 15)),
                            Text("{{ARTI}}", style: AppTextStyle.label.copyWith(fontSize: 12)),
                            Text("{{JUZ - Hal }}", style: AppTextStyle.label.copyWith(fontSize: 10)),
                          ],
                        );
                      },
                    ),
                    AppColors.tangledColor
              ),
            ),
            Expanded(
              child: BlocBuilder<FontSizeBloc, FontSizeState>(
                builder: (context, state) {
                  return AppCard.fill(
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton(
                        dropdownColor: AppColors.milkFrothColor,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.bottomCenter,
                        items: List.generate(state.listMode.length, (index) {
                          final mode = state.listMode[index];
                          return DropdownMenuItem(
                            enabled:
                                state.listMode[state.index] == mode
                                    ? false
                                    : true,
                            value: mode,
                            child: Text("Font ${mode}"),
                          );
                        }),
                        onChanged: (value) {
                          final currentIndex = state.listMode.indexOf(value!);
                          context.read<FontSizeBloc>().add(
                            ChangeSize(value, currentIndex),
                          );
                        },
                        isExpanded: true,
                        value: state.listMode[state.index],
                        icon: Icon(FontAwesomeIcons.font),
                      ),
                    ),
                    AppColors.tangledColor,
                    5,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BodySurah extends StatelessWidget {
  const BodySurah({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 9,
      child: BlocBuilder<FontSizeBloc, FontSizeState>(
        builder: (context, fzState) {
          return Column(
              children: [
                SizedBox(height: 8.0),
                BlocBuilder<QuranBloc, QuranState>(
                  builder: (context, state) {
                    if (state is QuranAyatLoaded) {
                      return Expanded(
                        child: AppCard.bordered(
                          Scrollbar(
                            child: ListView.builder(
                              itemCount: state.ayat.length,
                              itemBuilder: (context, index) {
                                final ayat = state.ayat[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8.0,
                                    horizontal: 16.0,
                                  ),
                                  child: Column(
                                    children: [
                                      if(index == 0) Container(margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10), child: Center(child: Text(AppHelpers.bismillah, style: AppTextStyle.quran.copyWith(fontSize: fzState.size,), textDirection: TextDirection.rtl,),)),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${index + 1}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            SizedBox(width: 12),
                                            Expanded(
                                              flex: 2,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          ayat.arab ?? '',
                                                          textAlign: TextAlign.right,
                                                          textDirection: TextDirection.rtl,
                                                          style: AppTextStyle.quran.copyWith(fontSize: fzState.size + 5),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          textAlign: TextAlign.left,
                                                          ayat.tafsir ?? '',
                                                          style: AppTextStyle.tarjamah.copyWith(fontSize: fzState.size),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          AppColors.milkFrothColor,
                        ),
                      );
                    }
                    return AppCard.fill(
                      Container(
                        height: MediaQuery.of(context).size.height - 350,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    );
                  },
                ),
              ],
            );
        },
      ),
    );
  }
}
