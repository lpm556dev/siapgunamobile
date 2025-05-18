import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:ssg_app/blocs/attention/attention_bloc.dart';
import 'package:ssg_app/blocs/bookmark/bookmark_bloc.dart';
import 'package:ssg_app/blocs/card/card_bloc.dart';
import 'package:ssg_app/blocs/credential/user_bloc.dart';
import 'package:ssg_app/pages/card_page.dart';
import 'package:ssg_app/pages/quran/quran_page.dart';
import 'package:ssg_app/utils/app_colors.dart';
import 'package:ssg_app/utils/app_helpers.dart';
import 'package:ssg_app/utils/app_text_style.dart';
import 'package:ssg_app/widgets/app_button.dart';
import 'package:ssg_app/widgets/app_card.dart';
import 'package:ssg_app/widgets/app_list_component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<UserBloc>().add(LoadData());
    context.read<BookmarkBloc>().add(GetLastBookmark());
    final double progress = 70.0;
    final int finished = 40;
    final int totalTask = 50;
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserCredentialisLoaded) {
                    return AppCard.bordered(
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.secondaryColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  minVerticalPadding: 20,
                                  leading: CircleAvatar(
                                    child: Text(state.username[0]),
                                  ),
                                  title: Text(
                                    "Assalamu'alaikum, ${AppHelpers.toCapitalize(state.username)}",
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    child: Text(
                                      state.role == '1a' ? 'Peserta' : 'Umum',
                                    ),
                                  ),
                                  subtitleTextStyle: AppTextStyle.subtitle
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                  titleTextStyle: AppTextStyle.title2.copyWith(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 10,
                              top: 10,
                              bottom: 25,
                              right: 10,
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text("Progres MY"),
                                  titleTextStyle: AppTextStyle.label.copyWith(
                                    color: AppColors.darkColor,
                                  ),
                                  subtitleTextStyle: AppTextStyle.bodyText
                                      .copyWith(color: AppColors.darkColor),
                                  subtitle: Text(
                                    "Diselesaikan : $finished/$totalTask",
                                  ),
                                  trailing: Text("${progress.toInt()} %"),
                                ),
                                LinearPercentIndicator(
                                  lineHeight: 8,
                                  backgroundColor: Color(0xFFAFCFF1),
                                  progressColor: AppColors.secondaryColor,
                                  percent: progress / 100,
                                  barRadius: Radius.circular(25),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  Future.delayed(Duration(seconds: 1), () {
                    context.read<UserBloc>().add(LoadData());
                  });
                  return AppCard.bordered(
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                minVerticalPadding: 20,
                                leading: CircleAvatar(
                                  child: CircularProgressIndicator(),
                                ),
                                title: Text("Assalamu'alaikum, ---"),
                                subtitle: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  child: Text('Umum'),
                                ),
                                subtitleTextStyle: AppTextStyle.subtitle
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                titleTextStyle: AppTextStyle.title2.copyWith(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            top: 10,
                            bottom: 25,
                            right: 10,
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text("Progres MY"),
                                titleTextStyle: AppTextStyle.label.copyWith(
                                  color: AppColors.darkColor,
                                ),
                                subtitleTextStyle: AppTextStyle.bodyText
                                    .copyWith(color: AppColors.darkColor),
                                subtitle: Text(
                                  "Diselesaikan : $finished/$totalTask",
                                ),
                                trailing: Text("${progress.toInt()} %"),
                              ),
                              LinearPercentIndicator(
                                lineHeight: 8,
                                backgroundColor: Color(0xFFAFCFF1),
                                progressColor: AppColors.secondaryColor,
                                percent: progress / 100,
                                barRadius: Radius.circular(25),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              AppCard.bordered(
                Column(
                  children: [
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Jadwal Hari ini :",
                          style: AppTextStyle.subtitle.copyWith(
                            color: AppColors.lightColor,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                    vertical: 10.0,
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        "${AppListComponent.daysName[DateTime.now().weekday - 1]},",
                                        style: AppTextStyle.subtitle.copyWith(
                                          color: AppColors.lightColor,
                                        ),
                                      ),
                                      Text(
                                        "${DateTime.now().day} ${AppListComponent.monthName[DateTime.now().month - 1]} ${DateTime.now().year}",
                                        style: AppTextStyle.label.copyWith(
                                          color: AppColors.lightColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.accentColor,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            height: 150,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Tugas",
                                        style: AppTextStyle.subtitle.copyWith(
                                          color: AppColors.lightColor,
                                        ),
                                      ),
                                      ElevatedButton.icon(
                                        onPressed: () {},
                                        label: Text("Lihat detail"),
                                        icon: Icon(Icons.today),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Scrollbar(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          ListTile(
                                            leading: Text("1. "),
                                            title: Text("Agama"),
                                            subtitle: Text("Sholat Lima Waktu"),
                                            subtitleTextStyle: AppTextStyle
                                                .bodyText
                                                .copyWith(
                                                  fontStyle: FontStyle.italic,
                                                  color: AppColors.lightColor,
                                                ),
                                            titleTextStyle: AppTextStyle.label,
                                            textColor: AppColors.lightColor,
                                          ),
                                          ListTile(
                                            leading: Text("2. "),
                                            title: Text("BTQ"),
                                            subtitle: Text(
                                              "Membaca Surah An-Naba'",
                                            ),
                                            subtitleTextStyle: AppTextStyle
                                                .bodyText
                                                .copyWith(
                                                  fontStyle: FontStyle.italic,
                                                  color: AppColors.lightColor,
                                                ),
                                            titleTextStyle: AppTextStyle.label,
                                            textColor: AppColors.lightColor,
                                          ),
                                          ListTile(
                                            leading: Text("3. "),
                                            title: Text("Tataboga"),
                                            subtitle: Text("Memasak Telur"),
                                            subtitleTextStyle: AppTextStyle
                                                .bodyText
                                                .copyWith(
                                                  fontStyle: FontStyle.italic,
                                                  color: AppColors.lightColor,
                                                ),
                                            titleTextStyle: AppTextStyle.label,
                                            textColor: AppColors.lightColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              AppCard.bordered(
                Container(
                  margin: EdgeInsets.all(8.0),
                  width: double.infinity,
                  height: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          "Pengumuman !!",
                          style: AppTextStyle.caption.copyWith(
                            color: AppColors.darkColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: BlocBuilder<AttentionBloc, AttentionState>(
                          builder: (context, state) {
                            if (state is AttentionLoaded) {
                              return Scrollbar(
                                child: ListView.builder(
                                  itemCount: state.data.length,
                                  itemBuilder: (context, index) {
                                    final attention = state.data[index];
                                    return Container(
                                      margin: EdgeInsets.symmetric(
                                        vertical: 1.2,
                                      ),
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(
                                              0.2,
                                            ),
                                            spreadRadius: 1,
                                            blurRadius: 2,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                        color: AppColors.butterColor,
                                        border: Border(
                                          left: BorderSide(
                                            width: 2.5,
                                            color: AppColors.picoColor,
                                          ),
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          12,
                                        ), // Border radius melengkung
                                      ),
                                      child: ListTile(
                                        tileColor: Colors.transparent,
                                        title: Text(
                                          attention.title,
                                          style: AppTextStyle.label.copyWith(
                                            color: AppColors.darkColor,
                                          ),
                                        ),
                                        subtitle: Text(attention.subtitle),
                                        trailing: Text(
                                          DateFormat(
                                            'dd-MM-yyyy',
                                          ).format(attention.tgl.toLocal()),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }
                            return Center(child: Text("Tidak Ada pengumuman"));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                AppColors.honeypotColor,
              ),
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  return AppCard.bordered(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Text(
                            "Akses Cepat",
                            style: AppTextStyle.subtitle.copyWith(
                              color: AppColors.darkColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AppButton(
                              text: "Rundown",
                              onPressedButton: () {},
                              isIcon: Icons.today,
                            ).menu(),
                            AppButton(
                              text: "Tugas",
                              onPressedButton: () {},
                              isIcon: Icons.assignment,
                            ).menu(),
                            AppButton(
                              text: "BAP/LPJ",
                              onPressedButton: () {},
                              isIcon: Icons.accessibility,
                            ).menu(),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (state is UserCredentialisLoaded &&
                                state.role == '1a')
                              AppButton(
                                text: "E-Card",
                                onPressedButton: () {
                                  AppHelpers.goTo(
                                    context,
                                    BlocProvider(
                                      create: (context) => CardBloc(),
                                      child: CardPage(),
                                    ),
                                    true,
                                  );
                                },
                                isIcon: FontAwesomeIcons.idCard,
                              ).menu(),
                            AppButton(
                              text: "Nilai",
                              onPressedButton: () {},
                              isIcon: Icons.star,
                            ).menu(),
                            AppButton(
                              text: "Presensi",
                              onPressedButton: () {},
                              isIcon: Icons.checklist,
                            ).menu(),
                          ],
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  );
                },
              ),
              BlocBuilder<BookmarkBloc, BookmarkState>(
                builder: (context, state) {
                  if (state is BookmarkInitial) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is BookmarkLastLoaded) {
                    return AppCard.bordered(
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: ListTile(
                              minLeadingWidth: 8,
                              leading: Text("Surat", style: AppTextStyle.label),
                              title: Text(
                                "${state.lastData.nmSurat} (Hal ${state.lastData.noHal})",
                                style: AppTextStyle.label,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 5.0,
                              ),
                              child:
                                  AppButton(
                                    text: "Lanjutkan Membaca",
                                    onPressedButton: () {
                                      AppHelpers.goTo(
                                        context,
                                        QuranPage(page: state.lastData.noHal),
                                        true,
                                      );
                                    },
                                    fnSize: 14,
                                    xPadding: 1,
                                    bgColor: AppColors.pastelColor,
                                    fgColor: AppColors.leafyColor,
                                  ).build(),
                            ),
                          ),
                        ],
                      ),
                      AppColors.reefColor,
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
