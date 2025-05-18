import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ssg_app/blocs/calendar/calendar_cubit.dart';
import 'package:ssg_app/blocs/calendar/calendar_state.dart';
import 'package:ssg_app/blocs/check_box/check_box_bloc.dart';
import 'package:ssg_app/blocs/counter_cubit/counter_cubit.dart';
import 'package:ssg_app/blocs/radio/radio_button_bloc.dart';
import 'package:ssg_app/blocs/register/register_bloc.dart';
import 'package:ssg_app/data/repositories/user_repo.dart';
import 'package:ssg_app/models/User.dart';
import 'package:ssg_app/pages/forms/login_page.dart';
import 'package:ssg_app/utils/app_colors.dart';
import 'package:ssg_app/utils/app_helpers.dart';
import 'package:ssg_app/utils/app_text_style.dart';
import 'package:ssg_app/widgets/app_alert.dart';
import 'package:ssg_app/widgets/app_button.dart';
import 'package:ssg_app/widgets/app_input.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.lightColor,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CounterCubit(limit: 1, countInit: 0)),
          BlocProvider(create: (context) => CalendarCubit()),
          BlocProvider(create: (context) => RegisterBloc(userRepository: UserRepository()),)
        ],
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(color: AppColors.primaryColor),
              child: Padding(
                padding: const EdgeInsets.only(left: 30.5),
                child: BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'DAFTAR - ',
                              style: AppTextStyle.title.copyWith(
                                color: AppColors.lightColor,
                                fontSize: 24,
                              ),
                            ),
                            state.count == 0
                                ? Text(
                                  'DAFTAR PERSONAL',
                                  style: AppTextStyle.title.copyWith(
                                    color: AppColors.lightColor,
                                    fontSize: 24,
                                  ),
                                )
                                : Text(
                                  'DAFTAR ALAMAT',
                                  style: AppTextStyle.title.copyWith(
                                    color: AppColors.lightColor,
                                    fontSize: 24,
                                  ),
                                ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              state.count == 0
                                  ? Text(
                                    'Pastikan Data yang anda masukan sesuai dengan KTP dan memudahkan proses verifikasi.',
                                    style: AppTextStyle.caption.copyWith(
                                      color: AppColors.lightColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                  : Text(
                                    'Masukan alamat sesuai domisili sekarang.',
                                    style: AppTextStyle.caption.copyWith(
                                      color: AppColors.lightColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            DraggableScrollableSheet(
              maxChildSize: 1.0,
              initialChildSize: 0.8,
              minChildSize: 0.8,
              builder: (context, controller) {
                return BlocConsumer<RegisterBloc, RegisterState>(
                  listener: (context, state) {
                    if (state is RegisterSuccess) {
                      AppAlert.snakBarShow(
                        context,
                        "Daftar berhasil",
                      );
                      AppHelpers.goTo(
                        context,
                        LoginPage(),
                      );
                    }

                    if (state is RegisterError) {
                      AppAlert.snakBarShow(
                        context,
                        state.message,
                      );
                    }
                  },
                  builder: (context, fmState) {
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightColor,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(50),
                        ),
                      ),
                      child: SingleChildScrollView(
                        controller: controller,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: BlocBuilder<CounterCubit, CounterState>(
                                builder: (context, currentStep) {
                                  return Container(
                                    height:
                                        MediaQuery.of(context).size.height *
                                        0.7,
                                    decoration: BoxDecoration(
                                      color: AppColors.lightColor,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Stepper(
                                      currentStep: currentStep.count,
                                      onStepContinue: () {
                                        context
                                            .read<CounterCubit>()
                                            .increment();
                                      },
                                      onStepCancel: () {
                                        context
                                            .read<CounterCubit>()
                                            .decrement();
                                      },
                                      onStepTapped: (step) {
                                        context.read<CounterCubit>().change(
                                          step,
                                        );
                                      },
                                      type: StepperType.vertical,
                                      controlsBuilder: (context, details) {
                                        return Row(
                                          mainAxisAlignment:
                                              currentStep.count != 0
                                                  ? MainAxisAlignment
                                                      .spaceBetween
                                                  : MainAxisAlignment.center,
                                          children: [
                                            if (currentStep.count != 0)
                                              AppButton(
                                                text: "Kembali",
                                                onPressedButton:
                                                    details.onStepCancel,
                                                xPadding: 20.0,
                                                bgColor: AppColors.lightColor,
                                                fgColor: AppColors.primaryColor,
                                                sideColor:
                                                    AppColors.primaryColor,
                                                bordered: true,
                                              ).build(),
                                            const SizedBox(width: 5.5),
                                            AppButton(
                                              text: "Lanjutkan",
                                              onPressedButton:
                                                  currentStep.count != 0
                                                      ? () {
                                                        if (fmState is RegisterInitial) {
                                                          context.read<RegisterBloc>().add(
                                                            Submit(fmState.user,
                                                            ),
                                                          );
                                                        }
                                                      }
                                                      : details.onStepContinue,
                                              xPadding:
                                                  currentStep.count != 0
                                                      ? 30.0
                                                      : 20.0,
                                            ).build(),
                                          ],
                                        );
                                      },
                                      steps: [
                                        Step(
                                          title: const SizedBox.shrink(),
                                          content: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AppInput(
                                                label: "NAMA LENGKAP",
                                                hint: "Nama Sesuai KTP",
                                                required: true,
                                                onChange: (value) {
                                                  if (fmState is RegisterInitial) {
                                                    context.read<RegisterBloc>().add(
                                                      InputChange(
                                                        UserModel(
                                                          namaLengkap: value,
                                                          nik: fmState.user!.nik,
                                                          jenisKelamin: fmState.user!.jenisKelamin ?? true,
                                                          tempatLahir: fmState.user!.tempatLahir ?? "",
                                                          tanggalLahir: fmState.user!.tanggalLahir ?? DateTime.now(),
                                                          golonganDarah: fmState.user!.golonganDarah ?? "",
                                                          alamat: fmState.user!.alamat ?? "",
                                                          rt: fmState.user!.rt ?? "",
                                                          rw: fmState.user!.rw ?? "",
                                                          kodePos: fmState.user!.kodePos ?? "",
                                                          kelurahanDesa: fmState.user!.kelurahanDesa ?? "",
                                                          kecamatan: fmState.user!.kecamatan ?? "",
                                                          kabupatenKota: fmState.user!.kabupatenKota ?? "",
                                                          provinsi: fmState.user!.provinsi ?? "",
                                                          domisiliKodePos: fmState.user!.domisiliKodePos ?? "",
                                                          domisiliKelurahanDesa: fmState.user!.domisiliKelurahanDesa ?? "",
                                                          domisiliKecamatan: fmState.user!.domisiliKecamatan ?? "",
                                                          domisiliKabupatenKota: fmState.user!.domisiliKabupatenKota ?? "",
                                                          domisiliProvinsi: fmState.user!.domisiliProvinsi ?? "",
                                                          nomorHp: fmState.user!.nomorHp ?? "",
                                                          email: fmState.user!.email ?? "",
                                                          agama: "islam",
                                                          password: fmState.user!.password,
                                                          domisiliAlamat: fmState.user!.domisiliAlamat ?? "",
                                                          domisiliRt: fmState.user!.rt ?? "",
                                                          domisiliRw: fmState.user!.rw ?? "",
                                                        ),
                                                      ),
                                                    );
                                                    
                                                  }else{
                                                    context
                                                    .read<RegisterBloc>()
                                                    .add(
                                                      InputChange(
                                                        UserModel(
                                                          namaLengkap: value,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                              ).input(),
                                              AppInput(
                                                label: "NIK",
                                                hint: "Nomor NIK",
                                                required: true,
                                                keyboardType:
                                                    TextInputType.number,
                                                yPadding: 5.5,
                                                onChange: (value) {
                                                  if (fmState is RegisterInitial) {
                                                    context.read<RegisterBloc>().add(
                                                      InputChange(
                                                        UserModel(
                                                          namaLengkap: fmState.user!.namaLengkap,
                                                          nik: value,
                                                          jenisKelamin: fmState.user!.jenisKelamin ?? true,
                                                          tempatLahir: fmState.user!.tempatLahir ?? "",
                                                          tanggalLahir: fmState.user!.tanggalLahir ?? DateTime.now(),
                                                          golonganDarah: fmState.user!.golonganDarah ?? "",
                                                          alamat: fmState.user!.alamat ?? "",
                                                          rt: fmState.user!.rt ?? "",
                                                          rw: fmState.user!.rw ?? "",
                                                          kodePos: fmState.user!.kodePos ?? "",
                                                          kelurahanDesa: fmState.user!.kelurahanDesa ?? "",
                                                          kecamatan: fmState.user!.kecamatan ?? "",
                                                          kabupatenKota: fmState.user!.kabupatenKota ?? "",
                                                          provinsi: fmState.user!.provinsi ?? "",
                                                          domisiliKodePos: fmState.user!.domisiliKodePos ?? "",
                                                          domisiliKelurahanDesa: fmState.user!.domisiliKelurahanDesa ?? "",
                                                          domisiliKecamatan: fmState.user!.domisiliKecamatan ?? "",
                                                          domisiliKabupatenKota: fmState.user!.domisiliKabupatenKota ?? "",
                                                          domisiliProvinsi: fmState.user!.domisiliProvinsi ?? "",
                                                          nomorHp: fmState.user!.nomorHp ?? "",
                                                          email: fmState.user!.email ?? "",
                                                          agama: "islam",
                                                          password: fmState.user!.password,
                                                          domisiliAlamat: fmState.user!.domisiliAlamat ?? "",
                                                          domisiliRt: fmState.user!.rt ?? "",
                                                          domisiliRw: fmState.user!.rw ?? "",
                                                        ),
                                                      ),
                                                    );
                                                    
                                                  }else{
                                                    context
                                                    .read<RegisterBloc>()
                                                    .add(
                                                      InputChange(
                                                        UserModel(
                                                          nik: value,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                              ).input(),
                                              BlocBuilder<
                                                CalendarCubit,
                                                CalendarState
                                              >(
                                                builder: (context, state) {
                                                  return AppInput(
                                                    yPadding: 5.5,
                                                    label:
                                                        "TEMPAT, TANGGAL LAHIR",
                                                    hint: "Tempat",
                                                    required: true,
                                                    secondHint: "dd/mm/yyyy",
                                                    icon: Icons.calendar_today,
                                                    onIconPressed: () async {
                                                      DateTime? picked =
                                                          await AppHelpers.datePicker(
                                                            context,
                                                            DateTime.now(),
                                                          );
                                                      if (picked != null) {
                                                        context
                                                            .read<
                                                              CalendarCubit
                                                            >()
                                                            .updateTanggal(
                                                              picked,
                                                            );
                                                      }
                                                    },
                                                    onChange: (value) {
                                                      if (fmState is RegisterInitial) {
                                                    context.read<RegisterBloc>().add(
                                                      InputChange(
                                                        UserModel(
                                                          namaLengkap: fmState.user!.namaLengkap,
                                                          nik: fmState.user!.nik,
                                                          jenisKelamin: fmState.user!.jenisKelamin ?? true,
                                                          tempatLahir: value,
                                                          tanggalLahir: fmState.user!.tanggalLahir ?? DateTime.now(),
                                                          golonganDarah: fmState.user!.golonganDarah ?? "",
                                                          alamat: fmState.user!.alamat ?? "",
                                                          rt: fmState.user!.rt ?? "",
                                                          rw: fmState.user!.rw ?? "",
                                                          kodePos: fmState.user!.kodePos ?? "",
                                                          kelurahanDesa: fmState.user!.kelurahanDesa ?? "",
                                                          kecamatan: fmState.user!.kecamatan ?? "",
                                                          kabupatenKota: fmState.user!.kabupatenKota ?? "",
                                                          provinsi: fmState.user!.provinsi ?? "",
                                                          domisiliKodePos: fmState.user!.domisiliKodePos ?? "",
                                                          domisiliKelurahanDesa: fmState.user!.domisiliKelurahanDesa ?? "",
                                                          domisiliKecamatan: fmState.user!.domisiliKecamatan ?? "",
                                                          domisiliKabupatenKota: fmState.user!.domisiliKabupatenKota ?? "",
                                                          domisiliProvinsi: fmState.user!.domisiliProvinsi ?? "",
                                                          nomorHp: fmState.user!.nomorHp ?? "",
                                                          email: fmState.user!.email ?? "",
                                                          agama: "islam",
                                                          password: fmState.user!.password,
                                                          domisiliAlamat: fmState.user!.domisiliAlamat ?? "",
                                                          domisiliRt: fmState.user!.rt ?? "",
                                                          domisiliRw: fmState.user!.rw ?? "",
                                                        ),
                                                      ),
                                                    );
                                                    
                                                  }else{
                                                    context
                                                    .read<RegisterBloc>()
                                                    .add(
                                                      InputChange(
                                                        UserModel(
                                                          tempatLahir: value,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                    },
                                                    onChangeSecond: (value) {
                                                      if (fmState is RegisterInitial) {
                                                    context.read<RegisterBloc>().add(
                                                      InputChange(
                                                        UserModel(
                                                          namaLengkap: fmState.user!.namaLengkap,
                                                          nik: fmState.user!.nik,
                                                          jenisKelamin: fmState.user!.jenisKelamin ?? true,
                                                          tempatLahir: fmState.user!.tempatLahir ?? "",
                                                          tanggalLahir: value,
                                                          golonganDarah: fmState.user!.golonganDarah ?? "",
                                                          alamat: fmState.user!.alamat ?? "",
                                                          rt: fmState.user!.rt ?? "",
                                                          rw: fmState.user!.rw ?? "",
                                                          kodePos: fmState.user!.kodePos ?? "",
                                                          kelurahanDesa: fmState.user!.kelurahanDesa ?? "",
                                                          kecamatan: fmState.user!.kecamatan ?? "",
                                                          kabupatenKota: fmState.user!.kabupatenKota ?? "",
                                                          provinsi: fmState.user!.provinsi ?? "",
                                                          domisiliKodePos: fmState.user!.domisiliKodePos ?? "",
                                                          domisiliKelurahanDesa: fmState.user!.domisiliKelurahanDesa ?? "",
                                                          domisiliKecamatan: fmState.user!.domisiliKecamatan ?? "",
                                                          domisiliKabupatenKota: fmState.user!.domisiliKabupatenKota ?? "",
                                                          domisiliProvinsi: fmState.user!.domisiliProvinsi ?? "",
                                                          nomorHp: fmState.user!.nomorHp ?? "",
                                                          email: fmState.user!.email ?? "",
                                                          agama: "islam",
                                                          password: fmState.user!.password,
                                                          domisiliAlamat: fmState.user!.domisiliAlamat ?? "",
                                                          domisiliRt: fmState.user!.rt ?? "",
                                                          domisiliRw: fmState.user!.rw ?? "",
                                                        ),
                                                      ),
                                                    );
                                                    
                                                  }else{
                                                    context
                                                    .read<RegisterBloc>()
                                                    .add(
                                                      InputChange(
                                                        UserModel(
                                                          tanggalLahir: value,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                    },
                                                    secondController:
                                                        TextEditingController(
                                                          text:
                                                              state.tanggal !=
                                                                      null
                                                                  ? "${state.tanggal!.day}/${state.tanggal!.month}/${state.tanggal!.year}"
                                                                  : "",
                                                        ),
                                                  ).dualInput(true);
                                                },
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(
                                                  8.0,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    BlocProvider(
                                                      create:
                                                          (context) =>
                                                              RadioButtonBloc(),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "JENIS KELAMIN",
                                                                style:
                                                                    AppTextStyle
                                                                        .label,
                                                              ),
                                                              Text(
                                                                "*",
                                                                style: AppTextStyle
                                                                    .label
                                                                    .copyWith(
                                                                      color:
                                                                          AppColors
                                                                              .dangerColor,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              BlocBuilder<
                                                                RadioButtonBloc,
                                                                RadioButtonState
                                                              >(
                                                                builder: (
                                                                  context,
                                                                  state,
                                                                ) {
                                                                  return Checkbox(
                                                                    materialTapTargetSize:
                                                                        MaterialTapTargetSize
                                                                            .values
                                                                            .last,
                                                                    value:
                                                                        state.value ==
                                                                                '1'
                                                                            ? true
                                                                            : false,
                                                                    onChanged: (
                                                                      value,
                                                                    ) {
                                                                      context
                                                                          .read<
                                                                            RadioButtonBloc
                                                                          >()
                                                                          .add(
                                                                            RadioButtonChanged(
                                                                              isValue:
                                                                                  '1',
                                                                            ),
                                                                          );
                                                                      if (fmState is RegisterInitial) {
                                                                        context.read<RegisterBloc>().add(
                                                                          InputChange(
                                                                            UserModel(
                                                                              namaLengkap: fmState.user!.namaLengkap,
                                                                              nik: fmState.user!.nik,
                                                                              jenisKelamin: true,
                                                                              tempatLahir: fmState.user!.tempatLahir ?? "",
                                                                              tanggalLahir: fmState.user!.tanggalLahir ?? DateTime.now(),
                                                                              golonganDarah: fmState.user!.golonganDarah ?? "",
                                                                              alamat: fmState.user!.alamat ?? "",
                                                                              rt: fmState.user!.rt ?? "",
                                                                              rw: fmState.user!.rw ?? "",
                                                                              kodePos: fmState.user!.kodePos ?? "",
                                                                              kelurahanDesa: fmState.user!.kelurahanDesa ?? "",
                                                                              kecamatan: fmState.user!.kecamatan ?? "",
                                                                              kabupatenKota: fmState.user!.kabupatenKota ?? "",
                                                                              provinsi: fmState.user!.provinsi ?? "",
                                                                              domisiliKodePos: fmState.user!.domisiliKodePos ?? "",
                                                                              domisiliKelurahanDesa: fmState.user!.domisiliKelurahanDesa ?? "",
                                                                              domisiliKecamatan: fmState.user!.domisiliKecamatan ?? "",
                                                                              domisiliKabupatenKota: fmState.user!.domisiliKabupatenKota ?? "",
                                                                              domisiliProvinsi: fmState.user!.domisiliProvinsi ?? "",
                                                                              nomorHp: fmState.user!.nomorHp ?? "",
                                                                              email: fmState.user!.email ?? "",
                                                                              agama: "islam",
                                                                              password: fmState.user!.password,
                                                                              domisiliAlamat: fmState.user!.domisiliAlamat ?? "",
                                                                              domisiliRt: fmState.user!.rt ?? "",
                                                                              domisiliRw: fmState.user!.rw ?? "",
                                                                            ),
                                                                          ),
                                                                        );
                                                                        
                                                                      }else{
                                                                        context
                                                                        .read<RegisterBloc>()
                                                                        .add(
                                                                          InputChange(
                                                                            UserModel(
                                                                              jenisKelamin: true,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                              Text(
                                                                "Laki-laki",
                                                                style: AppTextStyle
                                                                    .bodyText
                                                                    .copyWith(
                                                                      color:
                                                                          AppColors
                                                                              .darkColor,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              BlocBuilder<
                                                                RadioButtonBloc,
                                                                RadioButtonState
                                                              >(
                                                                builder: (
                                                                  context,
                                                                  state,
                                                                ) {
                                                                  return Checkbox(
                                                                    materialTapTargetSize:
                                                                        MaterialTapTargetSize
                                                                            .values
                                                                            .last,
                                                                    value:
                                                                        state.value ==
                                                                                '0'
                                                                            ? true
                                                                            : false,
                                                                    onChanged: (
                                                                      value,
                                                                    ) {
                                                                      context
                                                                          .read<
                                                                            RadioButtonBloc
                                                                          >()
                                                                          .add(
                                                                            RadioButtonChanged(
                                                                              isValue:
                                                                                  '0',
                                                                            ),
                                                                          );
                                                                      if (fmState is RegisterInitial) {
                                                                        context.read<RegisterBloc>().add(
                                                                          InputChange(
                                                                            UserModel(
                                                                              namaLengkap: fmState.user!.namaLengkap,
                                                                              nik: fmState.user!.nik,
                                                                              jenisKelamin: false,
                                                                              tempatLahir: fmState.user!.tempatLahir ?? "",
                                                                              tanggalLahir: fmState.user!.tanggalLahir ?? DateTime.now(),
                                                                              golonganDarah: fmState.user!.golonganDarah ?? "",
                                                                              alamat: fmState.user!.alamat ?? "",
                                                                              rt: fmState.user!.rt ?? "",
                                                                              rw: fmState.user!.rw ?? "",
                                                                              kodePos: fmState.user!.kodePos ?? "",
                                                                              kelurahanDesa: fmState.user!.kelurahanDesa ?? "",
                                                                              kecamatan: fmState.user!.kecamatan ?? "",
                                                                              kabupatenKota: fmState.user!.kabupatenKota ?? "",
                                                                              provinsi: fmState.user!.provinsi ?? "",
                                                                              domisiliKodePos: fmState.user!.domisiliKodePos ?? "",
                                                                              domisiliKelurahanDesa: fmState.user!.domisiliKelurahanDesa ?? "",
                                                                              domisiliKecamatan: fmState.user!.domisiliKecamatan ?? "",
                                                                              domisiliKabupatenKota: fmState.user!.domisiliKabupatenKota ?? "",
                                                                              domisiliProvinsi: fmState.user!.domisiliProvinsi ?? "",
                                                                              nomorHp: fmState.user!.nomorHp ?? "",
                                                                              email: fmState.user!.email ?? "",
                                                                              agama: "islam",
                                                                              password: fmState.user!.password,
                                                                              domisiliAlamat: fmState.user!.domisiliAlamat ?? "",
                                                                              domisiliRt: fmState.user!.rt ?? "",
                                                                              domisiliRw: fmState.user!.rw ?? "",
                                                                            ),
                                                                          ),
                                                                        );
                                                                        
                                                                      }else{
                                                                        context
                                                                        .read<RegisterBloc>()
                                                                        .add(
                                                                          InputChange(
                                                                            UserModel(
                                                                              jenisKelamin: false,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                              Text(
                                                                "Perempuan",
                                                                style: AppTextStyle
                                                                    .bodyText
                                                                    .copyWith(
                                                                      color:
                                                                          AppColors
                                                                              .darkColor,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    BlocProvider(
                                                      create:
                                                          (context) =>
                                                              RadioButtonBloc(),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "GOLONGAN DARAH",
                                                                style:
                                                                    AppTextStyle
                                                                        .label,
                                                              ),
                                                              Text(
                                                                "*",
                                                                style: AppTextStyle
                                                                    .label
                                                                    .copyWith(
                                                                      color:
                                                                          AppColors
                                                                              .dangerColor,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  BlocBuilder<
                                                                    RadioButtonBloc,
                                                                    RadioButtonState
                                                                  >(
                                                                    builder: (
                                                                      context,
                                                                      state,
                                                                    ) {
                                                                      return Checkbox(
                                                                        materialTapTargetSize:
                                                                            MaterialTapTargetSize.values.last,
                                                                        value:
                                                                            state.value ==
                                                                                    'A'
                                                                                ? true
                                                                                : false,
                                                                        onChanged: (
                                                                          value,
                                                                        ) {
                                                                          context
                                                                              .read<
                                                                                RadioButtonBloc
                                                                              >()
                                                                              .add(
                                                                                RadioButtonChanged(
                                                                                  isValue:
                                                                                      'A',
                                                                                ),
                                                                              );
                                                                          if (fmState is RegisterInitial) {
                                                                            context.read<RegisterBloc>().add(
                                                                              InputChange(
                                                                                UserModel(
                                                                                  namaLengkap: fmState.user!.namaLengkap,
                                                                                  nik: fmState.user!.nik,
                                                                                  jenisKelamin: fmState.user!.jenisKelamin ?? true,
                                                                                  tempatLahir: fmState.user!.tempatLahir ?? "",
                                                                                  tanggalLahir: fmState.user!.tanggalLahir ?? DateTime.now(),
                                                                                  golonganDarah: 'A',
                                                                                  alamat: fmState.user!.alamat ?? "",
                                                                                  rt: fmState.user!.rt ?? "",
                                                                                  rw: fmState.user!.rw ?? "",
                                                                                  kodePos: fmState.user!.kodePos ?? "",
                                                                                  kelurahanDesa: fmState.user!.kelurahanDesa ?? "",
                                                                                  kecamatan: fmState.user!.kecamatan ?? "",
                                                                                  kabupatenKota: fmState.user!.kabupatenKota ?? "",
                                                                                  provinsi: fmState.user!.provinsi ?? "",
                                                                                  domisiliKodePos: fmState.user!.domisiliKodePos ?? "",
                                                                                  domisiliKelurahanDesa: fmState.user!.domisiliKelurahanDesa ?? "",
                                                                                  domisiliKecamatan: fmState.user!.domisiliKecamatan ?? "",
                                                                                  domisiliKabupatenKota: fmState.user!.domisiliKabupatenKota ?? "",
                                                                                  domisiliProvinsi: fmState.user!.domisiliProvinsi ?? "",
                                                                                  nomorHp: fmState.user!.nomorHp ?? "",
                                                                                  email: fmState.user!.email ?? "",
                                                                                  agama: "islam",
                                                                                  password: fmState.user!.password,
                                                                                  domisiliAlamat: fmState.user!.domisiliAlamat ?? "",
                                                                                  domisiliRt: fmState.user!.rt ?? "",
                                                                                  domisiliRw: fmState.user!.rw ?? "",
                                                                                ),
                                                                              ),
                                                                            );
                                                                            
                                                                          }else{
                                                                            context
                                                                            .read<RegisterBloc>()
                                                                            .add(
                                                                              InputChange(
                                                                                UserModel(
                                                                                  golonganDarah: "A",
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }
                                                                        },
                                                                      );
                                                                    },
                                                                  ),
                                                                  Text(
                                                                    "A",
                                                                    style: AppTextStyle
                                                                        .bodyText
                                                                        .copyWith(
                                                                          color:
                                                                              AppColors.darkColor,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  BlocBuilder<
                                                                    RadioButtonBloc,
                                                                    RadioButtonState
                                                                  >(
                                                                    builder: (
                                                                      context,
                                                                      state,
                                                                    ) {
                                                                      return Checkbox(
                                                                        materialTapTargetSize:
                                                                            MaterialTapTargetSize.values.last,
                                                                        value:
                                                                            state.value ==
                                                                                    'AB'
                                                                                ? true
                                                                                : false,
                                                                        onChanged: (
                                                                          value,
                                                                        ) {
                                                                          context
                                                                              .read<
                                                                                RadioButtonBloc
                                                                              >()
                                                                              .add(
                                                                                RadioButtonChanged(
                                                                                  isValue:
                                                                                      'AB',
                                                                                ),
                                                                              );
                                                                          if (fmState is RegisterInitial) {
                                                                            context.read<RegisterBloc>().add(
                                                                              InputChange(
                                                                                UserModel(
                                                                                  namaLengkap: fmState.user!.namaLengkap,
                                                                                  nik: fmState.user!.nik,
                                                                                  jenisKelamin: fmState.user!.jenisKelamin ?? true,
                                                                                  tempatLahir: fmState.user!.tempatLahir ?? "",
                                                                                  tanggalLahir: fmState.user!.tanggalLahir ?? DateTime.now(),
                                                                                  golonganDarah: 'AB',
                                                                                  alamat: fmState.user!.alamat ?? "",
                                                                                  rt: fmState.user!.rt ?? "",
                                                                                  rw: fmState.user!.rw ?? "",
                                                                                  kodePos: fmState.user!.kodePos ?? "",
                                                                                  kelurahanDesa: fmState.user!.kelurahanDesa ?? "",
                                                                                  kecamatan: fmState.user!.kecamatan ?? "",
                                                                                  kabupatenKota: fmState.user!.kabupatenKota ?? "",
                                                                                  provinsi: fmState.user!.provinsi ?? "",
                                                                                  domisiliKodePos: fmState.user!.domisiliKodePos ?? "",
                                                                                  domisiliKelurahanDesa: fmState.user!.domisiliKelurahanDesa ?? "",
                                                                                  domisiliKecamatan: fmState.user!.domisiliKecamatan ?? "",
                                                                                  domisiliKabupatenKota: fmState.user!.domisiliKabupatenKota ?? "",
                                                                                  domisiliProvinsi: fmState.user!.domisiliProvinsi ?? "",
                                                                                  nomorHp: fmState.user!.nomorHp ?? "",
                                                                                  email: fmState.user!.email ?? "",
                                                                                  agama: "islam",
                                                                                  password: fmState.user!.password,
                                                                                  domisiliAlamat: fmState.user!.domisiliAlamat ?? "",
                                                                                  domisiliRt: fmState.user!.rt ?? "",
                                                                                  domisiliRw: fmState.user!.rw ?? "",
                                                                                ),
                                                                              ),
                                                                            );
                                                                            
                                                                          }else{
                                                                            context
                                                                            .read<RegisterBloc>()
                                                                            .add(
                                                                              InputChange(
                                                                                UserModel(
                                                                                  golonganDarah: "AB",
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }
                                                                        },
                                                                      );
                                                                    },
                                                                  ),
                                                                  Text(
                                                                    "AB",
                                                                    style: AppTextStyle
                                                                        .bodyText
                                                                        .copyWith(
                                                                          color:
                                                                              AppColors.darkColor,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  BlocBuilder<
                                                                    RadioButtonBloc,
                                                                    RadioButtonState
                                                                  >(
                                                                    builder: (
                                                                      context,
                                                                      state,
                                                                    ) {
                                                                      return Checkbox(
                                                                        materialTapTargetSize:
                                                                            MaterialTapTargetSize.values.last,
                                                                        value:
                                                                            state.value ==
                                                                                    'B'
                                                                                ? true
                                                                                : false,
                                                                        onChanged: (
                                                                          value,
                                                                        ) {
                                                                          context
                                                                              .read<
                                                                                RadioButtonBloc
                                                                              >()
                                                                              .add(
                                                                                RadioButtonChanged(
                                                                                  isValue:
                                                                                      'B',
                                                                                ),
                                                                              );
                                                                          if (fmState is RegisterInitial) {
                                                                            context.read<RegisterBloc>().add(
                                                                              InputChange(
                                                                                UserModel(
                                                                                  namaLengkap: fmState.user!.namaLengkap,
                                                                                  nik: fmState.user!.nik,
                                                                                  jenisKelamin: fmState.user!.jenisKelamin ?? true,
                                                                                  tempatLahir: fmState.user!.tempatLahir ?? "",
                                                                                  tanggalLahir: fmState.user!.tanggalLahir ?? DateTime.now(),
                                                                                  golonganDarah: 'B',
                                                                                  alamat: fmState.user!.alamat ?? "",
                                                                                  rt: fmState.user!.rt ?? "",
                                                                                  rw: fmState.user!.rw ?? "",
                                                                                  kodePos: fmState.user!.kodePos ?? "",
                                                                                  kelurahanDesa: fmState.user!.kelurahanDesa ?? "",
                                                                                  kecamatan: fmState.user!.kecamatan ?? "",
                                                                                  kabupatenKota: fmState.user!.kabupatenKota ?? "",
                                                                                  provinsi: fmState.user!.provinsi ?? "",
                                                                                  domisiliKodePos: fmState.user!.domisiliKodePos ?? "",
                                                                                  domisiliKelurahanDesa: fmState.user!.domisiliKelurahanDesa ?? "",
                                                                                  domisiliKecamatan: fmState.user!.domisiliKecamatan ?? "",
                                                                                  domisiliKabupatenKota: fmState.user!.domisiliKabupatenKota ?? "",
                                                                                  domisiliProvinsi: fmState.user!.domisiliProvinsi ?? "",
                                                                                  nomorHp: fmState.user!.nomorHp ?? "",
                                                                                  email: fmState.user!.email ?? "",
                                                                                  agama: "islam",
                                                                                  password: fmState.user!.password,
                                                                                  domisiliAlamat: fmState.user!.domisiliAlamat ?? "",
                                                                                  domisiliRt: fmState.user!.rt ?? "",
                                                                                  domisiliRw: fmState.user!.rw ?? "",
                                                                                ),
                                                                              ),
                                                                            );
                                                                            
                                                                          }else{
                                                                            context
                                                                            .read<RegisterBloc>()
                                                                            .add(
                                                                              InputChange(
                                                                                UserModel(
                                                                                  golonganDarah: "B",
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }
                                                                        },
                                                                      );
                                                                    },
                                                                  ),
                                                                  Text(
                                                                    "B",
                                                                    style: AppTextStyle
                                                                        .bodyText
                                                                        .copyWith(
                                                                          color:
                                                                              AppColors.darkColor,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  BlocBuilder<
                                                                    RadioButtonBloc,
                                                                    RadioButtonState
                                                                  >(
                                                                    builder: (
                                                                      context,
                                                                      state,
                                                                    ) {
                                                                      return Checkbox(
                                                                        materialTapTargetSize:
                                                                            MaterialTapTargetSize.values.last,
                                                                        value:
                                                                            state.value ==
                                                                                    'O'
                                                                                ? true
                                                                                : false,
                                                                        onChanged: (
                                                                          value,
                                                                        ) {
                                                                          context
                                                                              .read<
                                                                                RadioButtonBloc
                                                                              >()
                                                                              .add(
                                                                                RadioButtonChanged(
                                                                                  isValue:
                                                                                      'O',
                                                                                ),
                                                                              );
                                                                          if (fmState is RegisterInitial) {
                                                                            context.read<RegisterBloc>().add(
                                                                              InputChange(
                                                                                UserModel(
                                                                                  namaLengkap: fmState.user!.namaLengkap,
                                                                                  nik: fmState.user!.nik,
                                                                                  jenisKelamin: fmState.user!.jenisKelamin ?? true,
                                                                                  tempatLahir: fmState.user!.tempatLahir ?? "",
                                                                                  tanggalLahir: fmState.user!.tanggalLahir ?? DateTime.now(),
                                                                                  golonganDarah: 'O',
                                                                                  alamat: fmState.user!.alamat ?? "",
                                                                                  rt: fmState.user!.rt ?? "",
                                                                                  rw: fmState.user!.rw ?? "",
                                                                                  kodePos: fmState.user!.kodePos ?? "",
                                                                                  kelurahanDesa: fmState.user!.kelurahanDesa ?? "",
                                                                                  kecamatan: fmState.user!.kecamatan ?? "",
                                                                                  kabupatenKota: fmState.user!.kabupatenKota ?? "",
                                                                                  provinsi: fmState.user!.provinsi ?? "",
                                                                                  domisiliKodePos: fmState.user!.domisiliKodePos ?? "",
                                                                                  domisiliKelurahanDesa: fmState.user!.domisiliKelurahanDesa ?? "",
                                                                                  domisiliKecamatan: fmState.user!.domisiliKecamatan ?? "",
                                                                                  domisiliKabupatenKota: fmState.user!.domisiliKabupatenKota ?? "",
                                                                                  domisiliProvinsi: fmState.user!.domisiliProvinsi ?? "",
                                                                                  nomorHp: fmState.user!.nomorHp ?? "",
                                                                                  email: fmState.user!.email ?? "",
                                                                                  agama: "islam",
                                                                                  password: fmState.user!.password,
                                                                                  domisiliAlamat: fmState.user!.domisiliAlamat ?? "",
                                                                                  domisiliRt: fmState.user!.rt ?? "",
                                                                                  domisiliRw: fmState.user!.rw ?? "",
                                                                                ),
                                                                              ),
                                                                            );
                                                                            
                                                                          }else{
                                                                            context
                                                                            .read<RegisterBloc>()
                                                                            .add(
                                                                              InputChange(
                                                                                UserModel(
                                                                                  golonganDarah: "O",
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }
                                                                        },
                                                                      );
                                                                    },
                                                                  ),
                                                                  Text(
                                                                    "O",
                                                                    style: AppTextStyle
                                                                        .bodyText
                                                                        .copyWith(
                                                                          color:
                                                                              AppColors.darkColor,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              AppInput(
                                                label: "ALAMAT (SESUAI KTP",
                                                hint: "Alamat Sesuai KTP",
                                                required: true,
                                                onChange: (value) {
                                                  if (fmState is RegisterInitial) {
                                                    context.read<RegisterBloc>().add(
                                                      InputChange(
                                                        UserModel(
                                                          namaLengkap: fmState.user!.namaLengkap,
                                                          nik: fmState.user!.nik,
                                                          jenisKelamin: fmState.user!.jenisKelamin ?? true,
                                                          tempatLahir: fmState.user!.tempatLahir ?? "",
                                                          tanggalLahir: fmState.user!.tanggalLahir ?? DateTime.now(),
                                                          golonganDarah: fmState.user!.golonganDarah ?? "",
                                                          alamat: value,
                                                          rt: fmState.user!.rt ?? "",
                                                          rw: fmState.user!.rw ?? "",
                                                          kodePos: fmState.user!.kodePos ?? "",
                                                          kelurahanDesa: fmState.user!.kelurahanDesa ?? "",
                                                          kecamatan: fmState.user!.kecamatan ?? "",
                                                          kabupatenKota: fmState.user!.kabupatenKota ?? "",
                                                          provinsi: fmState.user!.provinsi ?? "",
                                                          domisiliKodePos: fmState.user!.domisiliKodePos ?? "",
                                                          domisiliKelurahanDesa: fmState.user!.domisiliKelurahanDesa ?? "",
                                                          domisiliKecamatan: fmState.user!.domisiliKecamatan ?? "",
                                                          domisiliKabupatenKota: fmState.user!.domisiliKabupatenKota ?? "",
                                                          domisiliProvinsi: fmState.user!.domisiliProvinsi ?? "",
                                                          nomorHp: fmState.user!.nomorHp ?? "",
                                                          email: fmState.user!.email ?? "",
                                                          agama: "islam",
                                                          password: fmState.user!.password,
                                                          domisiliAlamat: fmState.user!.domisiliAlamat ?? "",
                                                          domisiliRt: fmState.user!.rt ?? "",
                                                          domisiliRw: fmState.user!.rw ?? "",
                                                        ),
                                                      ),
                                                    );
                                                  }else{
                                                    context
                                                    .read<RegisterBloc>()
                                                    .add(
                                                      InputChange(
                                                        UserModel(
                                                          alamat: value,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                              ).input(),
                                              AppInput(
                                                label: "RT",
                                                hint: "RT",
                                                keyboardType:
                                                    TextInputType.number,
                                                secondKeyboardType: TextInputType.number,
                                                secondLabel: "RW",
                                                secondHint: "RW",
                                                required: true,
                                                onChange: (value) {
                                                  if (fmState is RegisterInitial) {
                                                    context.read<RegisterBloc>().add(
                                                      InputChange(
                                                        UserModel(
                                                          namaLengkap: fmState.user!.namaLengkap,
                                                          nik: fmState.user!.nik,
                                                          jenisKelamin: fmState.user!.jenisKelamin ?? true,
                                                          tempatLahir: fmState.user!.tempatLahir ?? "",
                                                          tanggalLahir: fmState.user!.tanggalLahir ?? DateTime.now(),
                                                          golonganDarah: fmState.user!.golonganDarah ?? "",
                                                          alamat: fmState.user!.alamat ?? "",
                                                          rt: value,
                                                          rw: fmState.user!.rw ?? "",
                                                          kodePos: fmState.user!.kodePos ?? "",
                                                          kelurahanDesa: fmState.user!.kelurahanDesa ?? "",
                                                          kecamatan: fmState.user!.kecamatan ?? "",
                                                          kabupatenKota: fmState.user!.kabupatenKota ?? "",
                                                          provinsi: fmState.user!.provinsi ?? "",
                                                          domisiliKodePos: fmState.user!.domisiliKodePos ?? "",
                                                          domisiliKelurahanDesa: fmState.user!.domisiliKelurahanDesa ?? "",
                                                          domisiliKecamatan: fmState.user!.domisiliKecamatan ?? "",
                                                          domisiliKabupatenKota: fmState.user!.domisiliKabupatenKota ?? "",
                                                          domisiliProvinsi: fmState.user!.domisiliProvinsi ?? "",
                                                          nomorHp: fmState.user!.nomorHp ?? "",
                                                          email: fmState.user!.email ?? "",
                                                          agama: "islam",
                                                          password: fmState.user!.password,
                                                          domisiliAlamat: fmState.user!.domisiliAlamat ?? "",
                                                          domisiliRt: fmState.user!.rt ?? "",
                                                          domisiliRw: fmState.user!.rw ?? "",
                                                        ),
                                                      ),
                                                    );
                                                  }else{
                                                    context
                                                    .read<RegisterBloc>()
                                                    .add(
                                                      InputChange(
                                                        UserModel(
                                                          rt: value,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                                onChangeSecond: (value) {
                                                  if (fmState is RegisterInitial) {
                                                    context.read<RegisterBloc>().add(
                                                      InputChange(
                                                        UserModel(
                                                          namaLengkap: fmState.user!.namaLengkap,
                                                          nik: fmState.user!.nik,
                                                          jenisKelamin: fmState.user!.jenisKelamin ?? true,
                                                          tempatLahir: fmState.user!.tempatLahir ?? "",
                                                          tanggalLahir: fmState.user!.tanggalLahir ?? DateTime.now(),
                                                          golonganDarah: fmState.user!.golonganDarah ?? "",
                                                          alamat: fmState.user!.alamat ?? "",
                                                          rt: fmState.user!.rt ?? "",
                                                          rw: value,
                                                          kodePos: fmState.user!.kodePos ?? "",
                                                          kelurahanDesa: fmState.user!.kelurahanDesa ?? "",
                                                          kecamatan: fmState.user!.kecamatan ?? "",
                                                          kabupatenKota: fmState.user!.kabupatenKota ?? "",
                                                          provinsi: fmState.user!.provinsi ?? "",
                                                          domisiliKodePos: fmState.user!.domisiliKodePos ?? "",
                                                          domisiliKelurahanDesa: fmState.user!.domisiliKelurahanDesa ?? "",
                                                          domisiliKecamatan: fmState.user!.domisiliKecamatan ?? "",
                                                          domisiliKabupatenKota: fmState.user!.domisiliKabupatenKota ?? "",
                                                          domisiliProvinsi: fmState.user!.domisiliProvinsi ?? "",
                                                          nomorHp: fmState.user!.nomorHp ?? "",
                                                          email: fmState.user!.email ?? "",
                                                          agama: "islam",
                                                          password: fmState.user!.password,
                                                          domisiliAlamat: fmState.user!.domisiliAlamat ?? "",
                                                          domisiliRt: fmState.user!.rt ?? "",
                                                          domisiliRw: fmState.user!.rw ?? "",
                                                        ),
                                                      ),
                                                    );
                                                  }else{
                                                    context
                                                    .read<RegisterBloc>()
                                                    .add(
                                                      InputChange(
                                                        UserModel(
                                                          rw: value,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                              ).dualInput(),
                                              AppInput(
                                                label: "KODE POS",
                                                hint: "Kode Pos",
                                                onChange: (value) {
                                                  if (fmState is RegisterInitial) {
                                                    context.read<RegisterBloc>().add(
                                                      InputChange(
                                                        UserModel(
                                                          namaLengkap: fmState.user!.namaLengkap,
                                                          nik: fmState.user!.nik,
                                                          jenisKelamin: fmState.user!.jenisKelamin ?? true,
                                                          tempatLahir: fmState.user!.tempatLahir ?? "",
                                                          tanggalLahir: fmState.user!.tanggalLahir ?? DateTime.now(),
                                                          golonganDarah: fmState.user!.golonganDarah ?? "",
                                                          alamat: fmState.user!.alamat ?? "",
                                                          rt: fmState.user!.rt ?? "",
                                                          rw: fmState.user!.rw ?? "",
                                                          kodePos: value,
                                                          kelurahanDesa: fmState.user!.kelurahanDesa ?? "",
                                                          kecamatan: fmState.user!.kecamatan ?? "",
                                                          kabupatenKota: fmState.user!.kabupatenKota ?? "",
                                                          provinsi: fmState.user!.provinsi ?? "",
                                                          domisiliKodePos: fmState.user!.domisiliKodePos ?? "",
                                                          domisiliKelurahanDesa: fmState.user!.domisiliKelurahanDesa ?? "",
                                                          domisiliKecamatan: fmState.user!.domisiliKecamatan ?? "",
                                                          domisiliKabupatenKota: fmState.user!.domisiliKabupatenKota ?? "",
                                                          domisiliProvinsi: fmState.user!.domisiliProvinsi ?? "",
                                                          nomorHp: fmState.user!.nomorHp ?? "",
                                                          email: fmState.user!.email ?? "",
                                                          agama: "islam",
                                                          password: fmState.user!.password,
                                                          domisiliAlamat: fmState.user!.domisiliAlamat ?? "",
                                                          domisiliRt: fmState.user!.rt ?? "",
                                                          domisiliRw: fmState.user!.rw ?? "",
                                                        ),
                                                      ),
                                                    );
                                                  }else{
                                                    context
                                                    .read<RegisterBloc>()
                                                    .add(
                                                      InputChange(
                                                        UserModel(
                                                          kodePos: value,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                                required: true,
                                                keyboardType:
                                                    TextInputType.number,
                                              ).input(),
                                              AppInput(
                                                label: "KELURAHAN/DESA",
                                                hint: "Kelurahan/Desa",
                                                required: true,
                                                secondLabel: "KECAMATAN",
                                                secondHint: "Kecamatan",
                                                yPadding: 5.5,
                                                onChange: (value) {
                                                  if (fmState is RegisterInitial) {
                                                    context.read<RegisterBloc>().add(
                                                      InputChange(
                                                        UserModel(
                                                          namaLengkap: fmState.user!.namaLengkap,
                                                          nik: fmState.user!.nik,
                                                          jenisKelamin: fmState.user!.jenisKelamin ?? true,
                                                          tempatLahir: fmState.user!.tempatLahir ?? "",
                                                          tanggalLahir: fmState.user!.tanggalLahir ?? DateTime.now(),
                                                          golonganDarah: fmState.user!.golonganDarah ?? "",
                                                          alamat: fmState.user!.alamat ?? "",
                                                          rt: fmState.user!.rt ?? "",
                                                          rw: fmState.user!.rw ?? "",
                                                          kodePos: fmState.user!.kodePos ?? "",
                                                          kelurahanDesa: value,
                                                          kecamatan: fmState.user!.kecamatan ?? "",
                                                          kabupatenKota: fmState.user!.kabupatenKota ?? "",
                                                          provinsi: fmState.user!.provinsi ?? "",
                                                          domisiliKodePos: fmState.user!.domisiliKodePos ?? "",
                                                          domisiliKelurahanDesa: fmState.user!.domisiliKelurahanDesa ?? "",
                                                          domisiliKecamatan: fmState.user!.domisiliKecamatan ?? "",
                                                          domisiliKabupatenKota: fmState.user!.domisiliKabupatenKota ?? "",
                                                          domisiliProvinsi: fmState.user!.domisiliProvinsi ?? "",
                                                          nomorHp: fmState.user!.nomorHp ?? "",
                                                          email: fmState.user!.email ?? "",
                                                          agama: "islam",
                                                          password: fmState.user!.password,
                                                          domisiliAlamat: fmState.user!.domisiliAlamat ?? "",
                                                          domisiliRt: fmState.user!.rt ?? "",
                                                          domisiliRw: fmState.user!.rw ?? "",
                                                        ),
                                                      ),
                                                    );
                                                  }else{
                                                    context
                                                    .read<RegisterBloc>()
                                                    .add(
                                                      InputChange(
                                                        UserModel(
                                                          kelurahanDesa: value,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                                onChangeSecond: (value) {
                                                  if (fmState is RegisterInitial) {
                                                    context.read<RegisterBloc>().add(
                                                      InputChange(
                                                        UserModel(
                                                          namaLengkap: fmState.user!.namaLengkap,
                                                          nik: fmState.user!.nik,
                                                          jenisKelamin: fmState.user!.jenisKelamin ?? true,
                                                          tempatLahir: fmState.user!.tempatLahir ?? "",
                                                          tanggalLahir: fmState.user!.tanggalLahir ?? DateTime.now(),
                                                          golonganDarah: fmState.user!.golonganDarah ?? "",
                                                          alamat: fmState.user!.alamat ?? "",
                                                          rt: fmState.user!.rt ?? "",
                                                          rw: fmState.user!.rw ?? "",
                                                          kodePos: fmState.user!.kodePos ?? "",
                                                          kelurahanDesa: fmState.user!.kelurahanDesa ?? "",
                                                          kecamatan: value,
                                                          kabupatenKota: fmState.user!.kabupatenKota ?? "",
                                                          provinsi: fmState.user!.provinsi ?? "",
                                                          domisiliKodePos: fmState.user!.domisiliKodePos ?? "",
                                                          domisiliKelurahanDesa: fmState.user!.domisiliKelurahanDesa ?? "",
                                                          domisiliKecamatan: fmState.user!.domisiliKecamatan ?? "",
                                                          domisiliKabupatenKota: fmState.user!.domisiliKabupatenKota ?? "",
                                                          domisiliProvinsi: fmState.user!.domisiliProvinsi ?? "",
                                                          nomorHp: fmState.user!.nomorHp ?? "",
                                                          email: fmState.user!.email ?? "",
                                                          agama: "islam",
                                                          password: fmState.user!.password,
                                                          domisiliAlamat: fmState.user!.domisiliAlamat ?? "",
                                                          domisiliRt: fmState.user!.rt ?? "",
                                                          domisiliRw: fmState.user!.rw ?? "",
                                                        ),
                                                      ),
                                                    );
                                                  }else{
                                                    context
                                                    .read<RegisterBloc>()
                                                    .add(
                                                      InputChange(
                                                        UserModel(
                                                          kecamatan: value,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                              ).dualInput(),
                                              AppInput(
                                                label: "KABUPATEN/KOTA",
                                                hint: "Kabupaten/Kota",
                                                required: true,
                                                secondLabel: "PROVINSI",
                                                secondHint: "Provinsi",
                                                yPadding: 5.5,
                                                onChange: (value) {
                                                  if (fmState is RegisterInitial) {
                                                    context.read<RegisterBloc>().add(
                                                      InputChange(
                                                        UserModel(
                                                          namaLengkap: fmState.user!.namaLengkap,
                                                          nik: fmState.user!.nik,
                                                          jenisKelamin: fmState.user!.jenisKelamin ?? true,
                                                          tempatLahir: fmState.user!.tempatLahir ?? "",
                                                          tanggalLahir: fmState.user!.tanggalLahir ?? DateTime.now(),
                                                          golonganDarah: fmState.user!.golonganDarah ?? "",
                                                          alamat: fmState.user!.alamat ?? "",
                                                          rt: fmState.user!.rt ?? "",
                                                          rw: fmState.user!.rw ?? "",
                                                          kodePos: fmState.user!.kodePos ?? "",
                                                          kelurahanDesa: fmState.user!.kelurahanDesa ?? "",
                                                          kecamatan: fmState.user!.kecamatan ?? "",
                                                          kabupatenKota: value,
                                                          provinsi: fmState.user!.provinsi ?? "",
                                                          domisiliKodePos: fmState.user!.domisiliKodePos ?? "",
                                                          domisiliKelurahanDesa: fmState.user!.domisiliKelurahanDesa ?? "",
                                                          domisiliKecamatan: fmState.user!.domisiliKecamatan ?? "",
                                                          domisiliKabupatenKota: fmState.user!.domisiliKabupatenKota ?? "",
                                                          domisiliProvinsi: fmState.user!.domisiliProvinsi ?? "",
                                                          nomorHp: fmState.user!.nomorHp ?? "",
                                                          email: fmState.user!.email ?? "",
                                                          agama: "islam",
                                                          password: fmState.user!.password,
                                                          domisiliAlamat: fmState.user!.domisiliAlamat ?? "",
                                                          domisiliRt: fmState.user!.rt ?? "",
                                                          domisiliRw: fmState.user!.rw ?? "",
                                                        ),
                                                      ),
                                                    );
                                                  }else{
                                                    context
                                                    .read<RegisterBloc>()
                                                    .add(
                                                      InputChange(
                                                        UserModel(
                                                          kabupatenKota: value
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                                onChangeSecond: (value) {
                                                  if (fmState is RegisterInitial) {
                                                    context.read<RegisterBloc>().add(
                                                      InputChange(
                                                        UserModel(
                                                          namaLengkap: fmState.user!.namaLengkap,
                                                          nik: fmState.user!.nik,
                                                          jenisKelamin: fmState.user!.jenisKelamin ?? true,
                                                          tempatLahir: fmState.user!.tempatLahir ?? "",
                                                          tanggalLahir: fmState.user!.tanggalLahir ?? DateTime.now(),
                                                          golonganDarah: fmState.user!.golonganDarah ?? "",
                                                          alamat: fmState.user!.alamat ?? "",
                                                          rt: fmState.user!.rt ?? "",
                                                          rw: fmState.user!.rw ?? "",
                                                          kodePos: fmState.user!.kodePos ?? "",
                                                          kelurahanDesa: fmState.user!.kelurahanDesa ?? "",
                                                          kecamatan: fmState.user!.kecamatan ?? "",
                                                          kabupatenKota: fmState.user!.kabupatenKota ?? "",
                                                          provinsi: value,
                                                          domisiliKodePos: fmState.user!.domisiliKodePos ?? "",
                                                          domisiliKelurahanDesa: fmState.user!.domisiliKelurahanDesa ?? "",
                                                          domisiliKecamatan: fmState.user!.domisiliKecamatan ?? "",
                                                          domisiliKabupatenKota: fmState.user!.domisiliKabupatenKota ?? "",
                                                          domisiliProvinsi: fmState.user!.domisiliProvinsi ?? "",
                                                          nomorHp: fmState.user!.nomorHp ?? "",
                                                          email: fmState.user!.email ?? "",
                                                          agama: "islam",
                                                          password: fmState.user!.password,
                                                          domisiliAlamat: fmState.user!.domisiliAlamat ?? "",
                                                          domisiliRt: fmState.user!.rt ?? "",
                                                          domisiliRw: fmState.user!.rw ?? "",
                                                        ),
                                                      ),
                                                    );
                                                  }else{
                                                    context
                                                    .read<RegisterBloc>()
                                                    .add(
                                                      InputChange(
                                                        UserModel(
                                                          provinsi: value,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                              ).dualInput(),
                                              SizedBox(height: 20.0),
                                            ],
                                          ),
                                          isActive: true,
                                        ),
                                        Step(
                                          title: const SizedBox.shrink(),
                                          content: Column(
                                            children: [
                                              AppInput(
                                                label: "KELURAHAN/DESA",
                                                hint: "Kelurahan/Desa",
                                                required: true,
                                                secondLabel: "KECAMATAN",
                                                secondHint: "Kecamatan",
                                                onChange: (value) {
                                                  if (fmState is RegisterInitial) {
                                                    context.read<RegisterBloc>().add(
                                                      InputChange(
                                                        UserModel(
                                                          namaLengkap: fmState.user!.namaLengkap,
                                                          nik: fmState.user!.nik,
                                                          jenisKelamin: fmState.user!.jenisKelamin ?? true,
                                                          tempatLahir: fmState.user!.tempatLahir ?? "",
                                                          tanggalLahir: fmState.user!.tanggalLahir ?? DateTime.now(),
                                                          golonganDarah: fmState.user!.golonganDarah ?? "",
                                                          alamat: fmState.user!.alamat ?? "",
                                                          rt: fmState.user!.rt ?? "",
                                                          rw: fmState.user!.rw ?? "",
                                                          kodePos: fmState.user!.kodePos ?? "",
                                                          kelurahanDesa: fmState.user!.kelurahanDesa ?? "",
                                                          kecamatan: fmState.user!.kecamatan ?? "",
                                                          kabupatenKota: fmState.user!.kabupatenKota ?? "",
                                                          provinsi: fmState.user!.provinsi ?? "",
                                                          domisiliKodePos: fmState.user!.domisiliKodePos ?? "",
                                                          domisiliKelurahanDesa: value,
                                                          domisiliKecamatan: fmState.user!.domisiliKecamatan ?? "",
                                                          domisiliKabupatenKota: fmState.user!.domisiliKabupatenKota ?? "",
                                                          domisiliProvinsi: fmState.user!.domisiliProvinsi ?? "",
                                                          nomorHp: fmState.user!.nomorHp ?? "",
                                                          email: fmState.user!.email ?? "",
                                                          agama: "islam",
                                                          password: fmState.user!.password,
                                                          domisiliAlamat: fmState.user!.domisiliAlamat ?? "",
                                                          domisiliRt: fmState.user!.rt ?? "",
                                                          domisiliRw: fmState.user!.rw ?? "",
                                                        ),
                                                      ),
                                                    );
                                                  }else{
                                                    context
                                                    .read<RegisterBloc>()
                                                    .add(
                                                      InputChange(
                                                        UserModel(
                                                          domisiliKelurahanDesa: value,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                                onChangeSecond: (value) {
                                                  if (fmState is RegisterInitial) {
                                                    context.read<RegisterBloc>().add(
                                                      InputChange(
                                                        UserModel(
                                                          namaLengkap: fmState.user!.namaLengkap,
                                                          nik: fmState.user!.nik,
                                                          jenisKelamin: fmState.user!.jenisKelamin ?? true,
                                                          tempatLahir: fmState.user!.tempatLahir ?? "",
                                                          tanggalLahir: fmState.user!.tanggalLahir ?? DateTime.now(),
                                                          golonganDarah: fmState.user!.golonganDarah ?? "",
                                                          alamat: fmState.user!.alamat ?? "",
                                                          rt: fmState.user!.rt ?? "",
                                                          rw: fmState.user!.rw ?? "",
                                                          kodePos: fmState.user!.kodePos ?? "",
                                                          kelurahanDesa: fmState.user!.kelurahanDesa ?? "",
                                                          kecamatan: fmState.user!.kecamatan ?? "",
                                                          kabupatenKota: fmState.user!.kabupatenKota ?? "",
                                                          provinsi: fmState.user!.provinsi ?? "",
                                                          domisiliKodePos: fmState.user!.domisiliKodePos ?? "",
                                                          domisiliKelurahanDesa: fmState.user!.domisiliKelurahanDesa ?? "",
                                                          domisiliKecamatan: value,
                                                          domisiliKabupatenKota: fmState.user!.domisiliKabupatenKota ?? "",
                                                          domisiliProvinsi: fmState.user!.domisiliProvinsi ?? "",
                                                          nomorHp: fmState.user!.nomorHp ?? "",
                                                          email: fmState.user!.email ?? "",
                                                          agama: "islam",
                                                          password: fmState.user!.password,
                                                          domisiliAlamat: fmState.user!.domisiliAlamat ?? "",
                                                          domisiliRt: fmState.user!.rt ?? "",
                                                          domisiliRw: fmState.user!.rw ?? "",
                                                        ),
                                                      ),
                                                    );
                                                  }else{
                                                    context
                                                    .read<RegisterBloc>()
                                                    .add(
                                                      InputChange(
                                                        UserModel(
                                                          domisiliKecamatan: value,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                                yPadding: 5.5,
                                              ).dualInput(),
                                              AppInput(
                                                label: "KABUPATEN/KOTA",
                                                hint: "Kabupaten/Kota",
                                                required: true,
                                                secondLabel: "PROVINSI",
                                                secondHint: "Provinsi",
                                                onChange: (value) {
                                                  if (fmState is RegisterInitial) {
                                                    context.read<RegisterBloc>().add(
                                                      InputChange(
                                                        UserModel(
                                                          namaLengkap: fmState.user!.namaLengkap,
                                                          nik: fmState.user!.nik,
                                                          jenisKelamin: fmState.user!.jenisKelamin ?? true,
                                                          tempatLahir: fmState.user!.tempatLahir ?? "",
                                                          tanggalLahir: fmState.user!.tanggalLahir ?? DateTime.now(),
                                                          golonganDarah: fmState.user!.golonganDarah ?? "",
                                                          alamat: fmState.user!.alamat ?? "",
                                                          rt: fmState.user!.rt ?? "",
                                                          rw: fmState.user!.rw ?? "",
                                                          kodePos: fmState.user!.kodePos ?? "",
                                                          kelurahanDesa: fmState.user!.kelurahanDesa ?? "",
                                                          kecamatan: fmState.user!.kecamatan ?? "",
                                                          kabupatenKota: fmState.user!.kabupatenKota ?? "",
                                                          provinsi: fmState.user!.provinsi ?? "",
                                                          domisiliKodePos: fmState.user!.domisiliKodePos ?? "",
                                                          domisiliKelurahanDesa: fmState.user!.domisiliKelurahanDesa ?? "",
                                                          domisiliKecamatan: fmState.user!.domisiliKecamatan ?? "",
                                                          domisiliKabupatenKota: value,
                                                          domisiliProvinsi: fmState.user!.domisiliProvinsi ?? "",
                                                          nomorHp: fmState.user!.nomorHp ?? "",
                                                          email: fmState.user!.email ?? "",
                                                          agama: "islam",
                                                          password: fmState.user!.password,
                                                          domisiliAlamat: fmState.user!.domisiliAlamat ?? "",
                                                          domisiliRt: fmState.user!.rt ?? "",
                                                          domisiliRw: fmState.user!.rw ?? "",
                                                        ),
                                                      ),
                                                    );
                                                  }else{
                                                    context
                                                    .read<RegisterBloc>()
                                                    .add(
                                                      InputChange(
                                                        UserModel(
                                                          domisiliKabupatenKota: value,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                                onChangeSecond: (value) {
                                                  if (fmState is RegisterInitial) {
                                                    context.read<RegisterBloc>().add(
                                                      InputChange(
                                                        UserModel(
                                                          namaLengkap: fmState.user!.namaLengkap,
                                                          nik: fmState.user!.nik,
                                                          jenisKelamin: fmState.user!.jenisKelamin ?? true,
                                                          tempatLahir: fmState.user!.tempatLahir ?? "",
                                                          tanggalLahir: fmState.user!.tanggalLahir ?? DateTime.now(),
                                                          golonganDarah: fmState.user!.golonganDarah ?? "",
                                                          alamat: fmState.user!.alamat ?? "",
                                                          rt: fmState.user!.rt ?? "",
                                                          rw: fmState.user!.rw ?? "",
                                                          kodePos: fmState.user!.kodePos ?? "",
                                                          kelurahanDesa: fmState.user!.kelurahanDesa ?? "",
                                                          kecamatan: fmState.user!.kecamatan ?? "",
                                                          kabupatenKota: fmState.user!.kabupatenKota ?? "",
                                                          provinsi: fmState.user!.provinsi ?? "",
                                                          domisiliKodePos: fmState.user!.domisiliKodePos ?? "",
                                                          domisiliKelurahanDesa: fmState.user!.domisiliKelurahanDesa ?? "",
                                                          domisiliKecamatan: fmState.user!.domisiliKecamatan ?? "",
                                                          domisiliKabupatenKota: fmState.user!.domisiliKabupatenKota ?? "",
                                                          domisiliProvinsi: value,
                                                          nomorHp: fmState.user!.nomorHp ?? "",
                                                          email: fmState.user!.email ?? "",
                                                          agama: "islam",
                                                          password: fmState.user!.password,
                                                          domisiliAlamat: fmState.user!.domisiliAlamat ?? "",
                                                          domisiliRt: fmState.user!.rt ?? "",
                                                          domisiliRw: fmState.user!.rw ?? "",
                                                        ),
                                                      ),
                                                    );
                                                  }else{
                                                    context
                                                    .read<RegisterBloc>()
                                                    .add(
                                                      InputChange(
                                                        UserModel(
                                                          domisiliProvinsi: value,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                                yPadding: 5.5,
                                              ).dualInput(),
                                              AppInput(
                                                label: "ALAMAT (DOMISILI)",
                                                hint:
                                                    "Alamat Domisili Sekarang",
                                                required: true,
                                                onChange: (value) {
                                                  if (fmState is RegisterInitial) {
                                                    context.read<RegisterBloc>().add(
                                                      InputChange(
                                                        UserModel(
                                                          namaLengkap: fmState.user!.namaLengkap,
                                                          nik: fmState.user!.nik,
                                                          jenisKelamin: fmState.user!.jenisKelamin ?? true,
                                                          tempatLahir: fmState.user!.tempatLahir ?? "",
                                                          tanggalLahir: fmState.user!.tanggalLahir ?? DateTime.now(),
                                                          golonganDarah: fmState.user!.golonganDarah ?? "",
                                                          alamat: fmState.user!.alamat ?? "",
                                                          rt: fmState.user!.rt ?? "",
                                                          rw: fmState.user!.rw ?? "",
                                                          kodePos: fmState.user!.kodePos ?? "",
                                                          kelurahanDesa: fmState.user!.kelurahanDesa ?? "",
                                                          kecamatan: fmState.user!.kecamatan ?? "",
                                                          kabupatenKota: fmState.user!.kabupatenKota ?? "",
                                                          provinsi: fmState.user!.provinsi ?? "",
                                                          domisiliKodePos: fmState.user!.domisiliKodePos ?? "",
                                                          domisiliKelurahanDesa: fmState.user!.domisiliKelurahanDesa ?? "",
                                                          domisiliKecamatan: fmState.user!.domisiliKecamatan ?? "",
                                                          domisiliKabupatenKota: fmState.user!.domisiliKabupatenKota ?? "",
                                                          domisiliProvinsi: fmState.user!.domisiliProvinsi ?? "",
                                                          nomorHp: fmState.user!.nomorHp ?? "",
                                                          email: fmState.user!.email ?? "",
                                                          agama: "islam",
                                                          password: fmState.user!.password,
                                                          domisiliAlamat: value,
                                                          domisiliRt: fmState.user!.rt ?? "",
                                                          domisiliRw: fmState.user!.rw ?? "",
                                                        ),
                                                      ),
                                                    );
                                                  }else{
                                                    context
                                                    .read<RegisterBloc>()
                                                    .add(
                                                      InputChange(
                                                        UserModel(
                                                          domisiliAlamat: value,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                              ).input(),
                                              SizedBox(height: 20.0),
                                              Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: AppColors.primaryColor,
                                                  border: Border.all(
                                                    color:
                                                        AppColors.primaryColor,
                                                    width: 0.5,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(
                                                  8.0,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "Data Kontak",
                                                      style: AppTextStyle.label
                                                          .copyWith(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              AppInput(
                                                label: "NOMOR HP",
                                                hint: "Nomor Hp",
                                                required: true,
                                                keyboardType:
                                                    TextInputType.phone,
                                                onChange: (value) {
                                                  if (fmState is RegisterInitial) {
                                                    context.read<RegisterBloc>().add(
                                                      InputChange(
                                                        UserModel(
                                                          namaLengkap: fmState.user!.namaLengkap,
                                                          nik: fmState.user!.nik,
                                                          jenisKelamin: fmState.user!.jenisKelamin ?? true,
                                                          tempatLahir: fmState.user!.tempatLahir ?? "",
                                                          tanggalLahir: fmState.user!.tanggalLahir ?? DateTime.now(),
                                                          golonganDarah: fmState.user!.golonganDarah ?? "",
                                                          alamat: fmState.user!.alamat ?? "",
                                                          rt: fmState.user!.rt ?? "",
                                                          rw: fmState.user!.rw ?? "",
                                                          kodePos: fmState.user!.kodePos ?? "",
                                                          kelurahanDesa: fmState.user!.kelurahanDesa ?? "",
                                                          kecamatan: fmState.user!.kecamatan ?? "",
                                                          kabupatenKota: fmState.user!.kabupatenKota ?? "",
                                                          provinsi: fmState.user!.provinsi ?? "",
                                                          domisiliKodePos: fmState.user!.domisiliKodePos ?? "",
                                                          domisiliKelurahanDesa: fmState.user!.domisiliKelurahanDesa ?? "",
                                                          domisiliKecamatan: fmState.user!.domisiliKecamatan ?? "",
                                                          domisiliKabupatenKota: fmState.user!.domisiliKabupatenKota ?? "",
                                                          domisiliProvinsi: fmState.user!.domisiliProvinsi ?? "",
                                                          nomorHp: value,
                                                          email: fmState.user!.email ?? "",
                                                          agama: "islam",
                                                          password: fmState.user!.password,
                                                          domisiliAlamat: fmState.user!.domisiliAlamat ?? "",
                                                          domisiliRt: fmState.user!.rt ?? "",
                                                          domisiliRw: fmState.user!.rw ?? "",
                                                        ),
                                                      ),
                                                    );
                                                  }else{
                                                    context
                                                    .read<RegisterBloc>()
                                                    .add(
                                                      InputChange(
                                                        UserModel(
                                                          nomorHp: value,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                              ).input(),
                                              BlocProvider(
                                                create:
                                                    (context) => CheckBoxBloc(
                                                      isChecked: true,
                                                    ),
                                                child: BlocBuilder<
                                                  CheckBoxBloc,
                                                  CheckBoxState
                                                >(
                                                  builder: (context, state) {
                                                    return AppInput(
                                                      label: "KATA SANDI",
                                                      hint: "Kata Sandi",
                                                      required: true,
                                                      isPassword: state.value,
                                                      icon:
                                                          state.value
                                                              ? Icons.visibility
                                                              : Icons
                                                                  .visibility_off,
                                                      onIconPressed: () {
                                                        context
                                                            .read<
                                                              CheckBoxBloc
                                                            >()
                                                            .add(
                                                              ChangeValue(
                                                                value:
                                                                    !state
                                                                        .value,
                                                              ),
                                                            );
                                                      },
                                                      onChange: (value) {
                                                        if (fmState is RegisterInitial) {
                                                    context.read<RegisterBloc>().add(
                                                      InputChange(
                                                        UserModel(
                                                          namaLengkap: fmState.user!.namaLengkap,
                                                          nik: fmState.user!.nik,
                                                          jenisKelamin: fmState.user!.jenisKelamin ?? true,
                                                          tempatLahir: fmState.user!.tempatLahir ?? "",
                                                          tanggalLahir: fmState.user!.tanggalLahir ?? DateTime.now(),
                                                          golonganDarah: fmState.user!.golonganDarah ?? "",
                                                          alamat: fmState.user!.alamat ?? "",
                                                          rt: fmState.user!.rt ?? "",
                                                          rw: fmState.user!.rw ?? "",
                                                          kodePos: fmState.user!.kodePos ?? "",
                                                          kelurahanDesa: fmState.user!.kelurahanDesa ?? "",
                                                          kecamatan: fmState.user!.kecamatan ?? "",
                                                          kabupatenKota: fmState.user!.kabupatenKota ?? "",
                                                          provinsi: fmState.user!.provinsi ?? "",
                                                          domisiliKodePos: fmState.user!.domisiliKodePos ?? "",
                                                          domisiliKelurahanDesa: fmState.user!.domisiliKelurahanDesa ?? "",
                                                          domisiliKecamatan: fmState.user!.domisiliKecamatan ?? "",
                                                          domisiliKabupatenKota: fmState.user!.domisiliKabupatenKota ?? "",
                                                          domisiliProvinsi: fmState.user!.domisiliProvinsi ?? "",
                                                          nomorHp: fmState.user!.nomorHp ?? "",
                                                          email: fmState.user!.email ?? "",
                                                          agama: "islam",
                                                          password: value,
                                                          domisiliAlamat: fmState.user!.domisiliAlamat ?? "",
                                                          domisiliRt: fmState.user!.rt ?? "",
                                                          domisiliRw: fmState.user!.rw ?? "",
                                                        ),
                                                      ),
                                                    );
                                                  }else{
                                                    context
                                                    .read<RegisterBloc>()
                                                    .add(
                                                      InputChange(
                                                        UserModel(
                                                          password: value,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                      },
                                                    ).input();
                                                  },
                                                ),
                                              ),
                                              BlocProvider(
                                                create:
                                                    (context) => CheckBoxBloc(
                                                      isChecked: true,
                                                    ),
                                                child: BlocBuilder<
                                                  CheckBoxBloc,
                                                  CheckBoxState
                                                >(
                                                  builder: (context, state) {
                                                    return AppInput(
                                                      label:
                                                          "KONFIRMASI KATA SANDI",
                                                      hint:
                                                          "Konfirmasi Kata Sandi",
                                                      required: true,
                                                      isPassword: state.value,
                                                      icon:
                                                          state.value
                                                              ? Icons.visibility
                                                              : Icons
                                                                  .visibility_off,
                                                      onIconPressed: () {
                                                        context
                                                            .read<
                                                              CheckBoxBloc
                                                            >()
                                                            .add(
                                                              ChangeValue(
                                                                value:
                                                                    !state
                                                                        .value,
                                                              ),
                                                            );
                                                      },
                                                      onChange: (value) {
                                                        if (fmState
                                                                is RegisterInitial &&
                                                            fmState
                                                                    .user!
                                                                    .password !=
                                                                value) {
                                                          AppAlert.snakBarShow(
                                                            context,
                                                            "password tidak sama",
                                                          );
                                                        }
                                                      },
                                                    ).input();
                                                  },
                                                ),
                                              ),
                                              SizedBox(height: 15.0),
                                              BlocProvider(
                                                create:
                                                    (context) => CheckBoxBloc(
                                                      isChecked: false,
                                                    ),
                                                child: Row(
                                                  children: [
                                                    BlocBuilder<
                                                      CheckBoxBloc,
                                                      CheckBoxState
                                                    >(
                                                      builder: (
                                                        context,
                                                        state,
                                                      ) {
                                                        return Checkbox(
                                                          materialTapTargetSize:
                                                              MaterialTapTargetSize
                                                                  .values
                                                                  .last,
                                                          value: state.value,
                                                          onChanged: (value) {
                                                            context
                                                                .read<
                                                                  CheckBoxBloc
                                                                >()
                                                                .add(
                                                                  ChangeValue(
                                                                    value:
                                                                        !state
                                                                            .value,
                                                                  ),
                                                                );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                    Expanded(
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "Saya Menyetujui ",
                                                            style: AppTextStyle
                                                                .bodyText
                                                                .copyWith(
                                                                  color:
                                                                      AppColors
                                                                          .darkColor,
                                                                  fontSize: 8.8,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              debugPrint(
                                                                "S&K tap!",
                                                              );
                                                            },
                                                            child: Text(
                                                              "Syarat & Ketentuan",
                                                              style: AppTextStyle
                                                                  .bodyText
                                                                  .copyWith(
                                                                    color:
                                                                        AppColors
                                                                            .skyColor,
                                                                    fontSize:
                                                                        8.8,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800,
                                                                  ),
                                                            ),
                                                          ),
                                                          Text(
                                                            " serta ",
                                                            style: AppTextStyle
                                                                .bodyText
                                                                .copyWith(
                                                                  color:
                                                                      AppColors
                                                                          .darkColor,
                                                                  fontSize: 8.8,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              debugPrint(
                                                                "Policy tap!",
                                                              );
                                                            },
                                                            child: Text(
                                                              "Kebijakan Privasi",
                                                              style: AppTextStyle
                                                                  .bodyText
                                                                  .copyWith(
                                                                    color:
                                                                        AppColors
                                                                            .skyColor,
                                                                    fontSize:
                                                                        8.8,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 20.0),
                                            ],
                                          ),
                                          isActive: currentStep.count == 1,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

