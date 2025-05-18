import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ssg_app/blocs/clock/clock_bloc.dart';
import 'package:ssg_app/utils/app_colors.dart';
import 'package:ssg_app/utils/app_helpers.dart';
import 'package:ssg_app/utils/app_text_style.dart';
import 'package:ssg_app/widgets/app_alert.dart';
import 'package:ssg_app/widgets/app_button.dart';
import 'package:ssg_app/widgets/app_card.dart';
import 'package:ssg_app/widgets/app_list_component.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ClockBloc>().add(StartClock());
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppCard.fill(
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  subtitle: BlocBuilder<ClockBloc, ClockState>(
                    builder: (context, state) {
                      return Text(
                        state.time,
                        style: GoogleFonts.spaceMono(
                          fontSize: 15,
                          color: AppColors.lightColor,
                        ),
                      );
                    },
                  ),
                  title: Text(
                    "${AppListComponent.daysName[DateTime.now().weekday]}, ${DateTime.now().day} ${AppListComponent.monthName[DateTime.now().month]} ${DateTime.now().year}",
                    style: GoogleFonts.poppins(color: AppColors.lightColor),
                  ),
                  trailing: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: AppColors.skyColor,
                      shape: BoxShape.rectangle,
                      border: Border.all(color: AppColors.lightColor, width: 1),
                    ),
                    child: Text(
                      "Tepat Waktu",
                      style: GoogleFonts.poppins(color: AppColors.lightColor),
                    ),
                  ),
                ),
              ),
              AppColors.primaryColor,
            ),
            AppCard.fill(
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Mutaba'ah Yaumiyah",
                          style: AppTextStyle.subtitle,
                        ),
                        Text(
                          "${AppListComponent.daysName[DateTime.now().weekday]}, ${DateTime.now().day} ${AppListComponent.monthName[DateTime.now().month]} ${DateTime.now().year}",
                          style: AppTextStyle.bodyText,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.lightColor,
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: AppColors.primaryColor,
                          width: 1,
                        ),
                      ),
                      child: DropdownButton(
                        isExpanded: true,
                        underline: SizedBox.shrink(),
                        borderRadius: BorderRadius.circular(10),
                        menuWidth: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        items: [
                          DropdownMenuItem(
                            value: 1,
                            child: Text(
                              "${DateTime.now().day} ${AppListComponent.monthName[DateTime.now().month]} ${DateTime.now().year}",
                            ),
                          ),
                          DropdownMenuItem(
                            value: 2,
                            child: Text(
                              "${DateTime.now().day - 1} ${AppListComponent.monthName[DateTime.now().month]} ${DateTime.now().year}",
                            ),
                          ),
                          DropdownMenuItem(
                            value: 3,
                            child: Text(
                              "${DateTime.now().day - 2} ${AppListComponent.monthName[DateTime.now().month]} ${DateTime.now().year}",
                            ),
                          ),
                          DropdownMenuItem(
                            value: 4,
                            child: Text(
                              "${DateTime.now().day - 3} ${AppListComponent.monthName[DateTime.now().month]} ${DateTime.now().year}",
                            ),
                          ),
                          DropdownMenuItem(
                            value: 5,
                            child: Text(
                              "${DateTime.now().day - 4} ${AppListComponent.monthName[DateTime.now().month]} ${DateTime.now().year}",
                            ),
                          ),
                          DropdownMenuItem(
                            value: 6,
                            child: Text(
                              "${DateTime.now().day - 5} ${AppListComponent.monthName[DateTime.now().month]} ${DateTime.now().year}",
                            ),
                          ),
                          DropdownMenuItem(
                            value: 7,
                            child: Text(
                              "${DateTime.now().day - 6} ${AppListComponent.monthName[DateTime.now().month]} ${DateTime.now().year}",
                            ),
                          ),
                        ],
                        value: 1,
                        onChanged: (value) {
                          value = value;
                        },
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            "1.1 Sholat Wajib dan Sunnah",
                            style: AppTextStyle.subtitle,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            height: 1,
                            width: double.infinity,
                            color: AppColors.darkColor,
                          ),
                          const SizedBox(height: 10),
                          ListTile(
                            title: Text("Sholat Fardhu"),
                            subtitle: Text("Sholat wajib 5 waktu"),
                            trailing: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: AppColors.lightColor,
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: AppColors.primaryColor,
                                  width: 1,
                                ),
                              ),
                              child: DropdownButton(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 5,
                                ),
                                items: [
                                  DropdownMenuItem(value: 1, child: Text("1")),
                                  DropdownMenuItem(value: 2, child: Text("2")),
                                  DropdownMenuItem(value: 3, child: Text("3")),
                                  DropdownMenuItem(value: 4, child: Text("4")),
                                  DropdownMenuItem(value: 5, child: Text("5")),
                                ],
                                onChanged: (value) {},
                                value: 1,
                                borderRadius: BorderRadius.circular(10),
                                isDense: true,
                                underline: SizedBox.shrink(),
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text("Sholat Tahajud & atau Witir"),
                            subtitle: Text("3 rakaat/hari"),
                            trailing: Checkbox(
                              value: true,
                              onChanged: (value) {},
                            ),
                          ),
                          ListTile(
                            title: Text("Sholat Dhuha"),
                            subtitle: Text("4 rakaat"),
                            trailing: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: AppColors.lightColor,
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: AppColors.primaryColor,
                                  width: 1,
                                ),
                              ),
                              child: DropdownButton(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 5,
                                ),
                                items: [
                                  DropdownMenuItem(value: 0, child: Text("0")),
                                  DropdownMenuItem(value: 2, child: Text("2")),
                                  DropdownMenuItem(value: 4, child: Text("4")),
                                  DropdownMenuItem(value: 6, child: Text("6")),
                                  DropdownMenuItem(value: 8, child: Text("8")),
                                  DropdownMenuItem(
                                    value: 10,
                                    child: Text("10"),
                                  ),
                                  DropdownMenuItem(
                                    value: 12,
                                    child: Text("12"),
                                  ),
                                ],
                                onChanged: (value) {},
                                value: 0,
                                borderRadius: BorderRadius.circular(10),
                                isDense: true,
                                underline: SizedBox.shrink(),
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text("Sholat Rawatib"),
                            subtitle: Text("10 rakaat"),
                            trailing: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: AppColors.lightColor,
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: AppColors.primaryColor,
                                  width: 1,
                                ),
                              ),
                              child: DropdownButton(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 5,
                                ),
                                items: [
                                  DropdownMenuItem(value: 0, child: Text("0")),
                                  DropdownMenuItem(value: 2, child: Text("2")),
                                  DropdownMenuItem(value: 4, child: Text("4")),
                                  DropdownMenuItem(value: 6, child: Text("6")),
                                  DropdownMenuItem(value: 8, child: Text("8")),
                                  DropdownMenuItem(
                                    value: 10,
                                    child: Text("10"),
                                  ),
                                  DropdownMenuItem(
                                    value: 12,
                                    child: Text("12"),
                                  ),
                                ],
                                onChanged: (value) {},
                                value: 0,
                                borderRadius: BorderRadius.circular(10),
                                isDense: true,
                                underline: SizedBox.shrink(),
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text("Sholat Sunnah"),
                            subtitle: Text("Lainnya 6 rakaat"),
                            trailing: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: AppColors.lightColor,
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: AppColors.primaryColor,
                                  width: 1,
                                ),
                              ),
                              child: DropdownButton(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 5,
                                ),
                                items: [
                                  DropdownMenuItem(value: 0, child: Text("0")),
                                  DropdownMenuItem(value: 2, child: Text("2")),
                                  DropdownMenuItem(value: 4, child: Text("4")),
                                  DropdownMenuItem(value: 6, child: Text("6")),
                                  DropdownMenuItem(value: 8, child: Text("8")),
                                  DropdownMenuItem(
                                    value: 10,
                                    child: Text("10"),
                                  ),
                                  DropdownMenuItem(
                                    value: 12,
                                    child: Text("12"),
                                  ),
                                ],
                                onChanged: (value) {},
                                value: 0,
                                borderRadius: BorderRadius.circular(10),
                                isDense: true,
                                underline: SizedBox.shrink(),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "1.2 Aktivitas Qur'an",
                            style: AppTextStyle.subtitle,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            height: 1,
                            width: double.infinity,
                            color: AppColors.darkColor,
                          ),
                          ListTile(
                            title: Text("Tilawah"),
                            subtitle: Text("1 Halaman"),
                            trailing: Checkbox(
                              value: true,
                              onChanged: (value) {},
                            ),
                          ),
                          ListTile(
                            title: Text("Tarjamah"),
                            subtitle: Text("1 Halaman"),
                            trailing: Checkbox(
                              value: true,
                              onChanged: (value) {},
                            ),
                          ),

                          SizedBox(height: 10),
                          Text(
                            "1.3 Aktivitas Sunnah",
                            style: AppTextStyle.subtitle,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            height: 1,
                            width: double.infinity,
                            color: AppColors.darkColor,
                          ),
                          ListTile(
                            title: Text("Shaum Sunnah"),
                            subtitle: Text("(3x/bulan)"),
                            trailing: Checkbox(
                              value: true,
                              onChanged: (value) {},
                            ),
                          ),
                          ListTile(
                            title: Text("Shodaqoh Maal"),
                            trailing: Checkbox(
                              value: true,
                              onChanged: (value) {},
                            ),
                          ),
                          ListTile(
                            title: Text("Dzikir"),
                            subtitle: Text("Pagi / Petang"),
                            trailing: Checkbox(
                              value: true,
                              onChanged: (value) {},
                            ),
                          ),
                          ListTile(
                            title: Text("Istoghfar"),
                            subtitle: Text("x 1000"),
                            trailing: Container(
                              height: 40,
                              width: 40,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: BorderSide(
                                      color: AppColors.primaryColor,
                                      width: 1,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text("Sholawat"),
                            subtitle: Text("x 100"),
                            trailing: Container(
                              height: 40,
                              width: 40,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: BorderSide(
                                      color: AppColors.primaryColor,
                                      width: 1,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "2.1 Menyimak Kajian",
                            style: AppTextStyle.subtitle,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            height: 1,
                            width: double.infinity,
                            color: AppColors.darkColor,
                          ),
                          ListTile(
                            title: Text("Menyimak MQ"),
                            subtitle: Text("Pagi"),
                            trailing: Checkbox(
                              value: true,
                              onChanged: (value) {},
                            ),
                          ),

                          if (DateTime.now().weekday == 4)
                            ListTile(
                              title: Text("Menyimak Kajian"),
                              subtitle: Text("Al-Hikam"),
                              trailing: Checkbox(
                                value: true,
                                onChanged: (value) {},
                              ),
                            ),
                          if (DateTime.now().weekday == 4)
                            ListTile(
                              title: Text("Menyimak Kajian"),
                              subtitle: Text("Ma'rifatullah"),
                              trailing: Checkbox(
                                value: true,
                                onChanged: (value) {},
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 10,
                      ),
                      child: BlocBuilder<ClockBloc, ClockState>(
                        builder: (context, state) {
                          return AppButton(
                            text: "SIMPAN",
                            onPressedButton: () {
                              if (DateTime.now().hour > 8) {
                                AppAlert.showAlertDialog(
                                  context,
                                  "Perhatian!",
                                  "Yakin ingin menyimpan data ini? pastikan aktivitas yang diisi sudah benar",
                                  "BATAL",
                                  "OK",
                                  null,
                                  () {
                                    AppAlert.snakBarShow(
                                      context,
                                      "Data berhasil disimpan",
                                    );
                                    AppHelpers.goBack(context);
                                  },
                                  AppColors.lightColor,
                                  AppColors.primaryColor,
                                  AppColors.lightColor,
                                  AppColors.accentColor,
                                );
                              }
                            },
                            fullWidth: true,
                            bgColor: DateTime.now().hour < 8 ? Colors.grey[600] : AppColors.primaryColor,
                          ).build();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              AppColors.milkFrothColor,
            ),
          ],
        ),
      ),
    );
  }
}
