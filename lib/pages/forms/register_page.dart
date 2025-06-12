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

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}
class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _namaLengkapController = TextEditingController();
  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _tempatLahirController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _rtController = TextEditingController();
  final TextEditingController _rwController = TextEditingController();
  final TextEditingController _kodePosController = TextEditingController();
  final TextEditingController _kelurahanDesaController = TextEditingController();
  final TextEditingController _kecamatanController = TextEditingController();
  final TextEditingController _kabupatenKotaController = TextEditingController();
  final TextEditingController _provinsiController = TextEditingController();
  
  // Domisili Controllers
  final TextEditingController _domisiliKelurahanDesaController = TextEditingController();
  final TextEditingController _domisiliKecamatanController = TextEditingController();
  final TextEditingController _domisiliKabupatenKotaController = TextEditingController();
  final TextEditingController _domisiliProvinsiController = TextEditingController();
  final TextEditingController _domisiliAlamatController = TextEditingController();
  final TextEditingController _domisiliRtController = TextEditingController();
  final TextEditingController _domisiliRwController = TextEditingController();
  final TextEditingController _domisiliKodePosController = TextEditingController();
  
  // Contact Controllers
  final TextEditingController _nomorHpController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  // Form Data
  String? selectedJenisKelamin;
  String? selectedGolonganDarah;
  DateTime? selectedTanggalLahir;
  bool isTermsAccepted = false;

  @override
  void dispose() {
    // Dispose all controllers
    _namaLengkapController.dispose();
    _nikController.dispose();
    _tempatLahirController.dispose();
    _alamatController.dispose();
    _rtController.dispose();
    _rwController.dispose();
    _kodePosController.dispose();
    _kelurahanDesaController.dispose();
    _kecamatanController.dispose();
    _kabupatenKotaController.dispose();
    _provinsiController.dispose();
    _domisiliKelurahanDesaController.dispose();
    _domisiliKecamatanController.dispose();
    _domisiliKabupatenKotaController.dispose();
    _domisiliProvinsiController.dispose();
    _domisiliAlamatController.dispose();
    _domisiliRtController.dispose();
    _domisiliRwController.dispose();
    _domisiliKodePosController.dispose();
    _nomorHpController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  UserModel _createUserModel() {
    return UserModel(
      namaLengkap: _namaLengkapController.text,
      nik: _nikController.text,
      jenisKelamin: selectedJenisKelamin == '1' ? true : false,
      tempatLahir: _tempatLahirController.text,
      tanggalLahir: selectedTanggalLahir,
      alamat: _alamatController.text,
      rt: _rtController.text,
      rw: _rwController.text,
      kodePos: _kodePosController.text,
      kelurahanDesa: _kelurahanDesaController.text,
      kecamatan: _kecamatanController.text,
      kabupatenKota: _kabupatenKotaController.text,
      provinsi: _provinsiController.text,
      domisiliKelurahanDesa: _domisiliKelurahanDesaController.text,
      domisiliKecamatan: _domisiliKecamatanController.text,
      domisiliKabupatenKota: _domisiliKabupatenKotaController.text,
      domisiliProvinsi: _domisiliProvinsiController.text,
      domisiliAlamat: _domisiliAlamatController.text,
      domisiliRt: _domisiliRtController.text,
      domisiliRw: _domisiliRwController.text,
      domisiliKodePos: _domisiliKodePosController.text,
      nomorHp: _nomorHpController.text,
      email: _emailController.text,
      golonganDarah: selectedGolonganDarah,
      password: _passwordController.text,
      agama: "Islam", // Add agama field if needed
    );
  }

  bool _validateForm() {
    // Basic validation
    if (_namaLengkapController.text.isEmpty ||
        _nikController.text.isEmpty ||
        selectedJenisKelamin == null ||
        _tempatLahirController.text.isEmpty ||
        selectedTanggalLahir == null ||
        _alamatController.text.isEmpty ||
        _rtController.text.isEmpty ||
        _rwController.text.isEmpty ||
        _kodePosController.text.isEmpty ||
        _kelurahanDesaController.text.isEmpty ||
        _kecamatanController.text.isEmpty ||
        _kabupatenKotaController.text.isEmpty ||
        _provinsiController.text.isEmpty ||
        selectedGolonganDarah == null ||
        _nomorHpController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _emailController.text.isEmpty) {
      AppAlert.snakBarShow(context, "Mohon lengkapi semua field yang wajib diisi", AppColors.secondaryColor, AppColors.darkColor);
      return false;
    }

    if (isTermsAccepted) {
      print("is Term : ${isTermsAccepted}");
      AppAlert.snakBarShow(context, "Anda harus menyetujui syarat dan ketentuan", AppColors.secondaryColor, AppColors.darkColor);
      return false;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      AppAlert.snakBarShow(context, "Password tidak sama", AppColors.secondaryColor, AppColors.darkColor);
      return false;
    }

    return true;
  }

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
                        AppColors.dangerColor,
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
                                            const SizedBox(width: 0.5),
                                            AppButton(
                                              text: "Lanjutkan",
                                              fnSize: 15,
                                              onPressedButton: currentStep.count != 0
                                                  ? () {
                                                      if (_validateForm()) {
                                                        final user = _createUserModel();
                                                        context.read<RegisterBloc>().add(
                                                          Submit(user),
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
                                                controller: _namaLengkapController,
                                                textInputFormatter: UpperCaseTextFormatter()
                                              ).input(),
                                              AppInput(
                                                label: "NIK",
                                                hint: "Nomor NIK",
                                                required: true,
                                                keyboardType:
                                                    TextInputType.number,
                                                yPadding: 5.5,
                                                onChange: (value) {
                                                  
                                                },
                                                controller: _nikController
                                              ).input(),
                                              BlocBuilder<
                                                CalendarCubit,
                                                CalendarState
                                              >(
                                                builder: (context, state) {
                                                  selectedTanggalLahir =
                                                      state.tanggal;
                                                  return AppInput(
                                                    yPadding: 5.5,
                                                    label:
                                                        "TEMPAT, TANGGAL LAHIR",
                                                    hint: "Tempat",
                                                    required: true,
                                                    secondHint: "dd/mm/yyyy",
                                                    controller:
                                                        _tempatLahirController,
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
                                                      
                                                    },
                                                    onChangeSecond: (value) {
                                                      
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
                                                                  selectedJenisKelamin =
                                                                      state.value;
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
                                                                  selectedJenisKelamin =
                                                                      state.value;
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
                                                                      selectedGolonganDarah =
                                                                          state.value;
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
                                                                      selectedGolonganDarah =
                                                                          state.value;
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
                                                                      selectedGolonganDarah =
                                                                          state.value;
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
                                                                      selectedGolonganDarah =
                                                                          state.value;
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
                                                 
                                                },
                                                controller: _alamatController,
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
                                                  
                                                },
                                                controller: _rtController,
                                                secondController: _rwController,
                                                onChangeSecond: (value) {
                                                  
                                                },
                                              ).dualInput(),
                                              AppInput(
                                                label: "KODE POS",
                                                hint: "Kode Pos",
                                                onChange: (value) {
                                                  
                                                },
                                                controller: _kodePosController,
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
                                                  
                                                },
                                                controller: _kelurahanDesaController,
                                                secondController: _kecamatanController,
                                                onChangeSecond: (value) {
                                                  
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
                                                  
                                                },
                                                controller: _kabupatenKotaController,
                                                secondController: _provinsiController,
                                                onChangeSecond: (value) {
                                                  
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
                                                  
                                                },
                                                controller: _domisiliKelurahanDesaController,
                                                secondController: _domisiliKecamatanController,
                                                onChangeSecond: (value) {
                                                  
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
                                                  
                                                },
                                                controller: _domisiliKabupatenKotaController,
                                                secondController: _domisiliProvinsiController,
                                                onChangeSecond: (value) {
                                                  
                                                },
                                                yPadding: 5.5,
                                              ).dualInput(),
                                              AppInput(
                                                label: "ALAMAT (DOMISILI)",
                                                hint:
                                                    "Alamat Domisili Sekarang",
                                                required: true,
                                                onChange: (value) {
                                                  
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
                                                  
                                                },
                                                controller: _nomorHpController
                                              ).input(),
                                              AppInput(
                                                label: "EMAIL",
                                                hint: "Alamat Email",
                                                required: true,
                                                controller: _emailController,
                                                keyboardType: TextInputType.emailAddress
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
                                                      controller: _passwordController,
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
                                                      controller: _confirmPasswordController,
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
                                                          Expanded(
                                                            child: GestureDetector(
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
                                                                      overflow: TextOverflow.ellipsis,
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

