class MutabaahYaumiyahModel {
  final String id;
  final String userId;
  final DateTime date;
  final int sholatWajib;
  final bool sholatTahajud;
  final int sholatDhuha;
  final int sholatRawatib;
  final int sholatSunnahLainnya;
  final bool tilawahQuran;
  final bool terjemahQuran;
  final bool shaumSunnah;
  final bool shodaqoh;
  final bool dzikirPagiPetang;
  final int istighfar1000x;
  final int sholawat100x;
  final bool menyimakMqPagi;
  final int? kajianAlhikam;
  final int? makrifatullah;

  const MutabaahYaumiyahModel({
    required this.id,
    required this.userId,
    required this.date,
    this.sholatWajib = 1,
    this.sholatTahajud = false,
    this.sholatDhuha = 0,
    this.sholatRawatib = 0,
    this.sholatSunnahLainnya = 0,
    this.tilawahQuran = false,
    this.terjemahQuran = false,
    this.shaumSunnah = false,
    this.shodaqoh = false,
    this.dzikirPagiPetang = false,
    this.istighfar1000x = 0,
    this.sholawat100x = 0,
    this.menyimakMqPagi = false,
    this.kajianAlhikam,
    this.makrifatullah,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'date': date.toIso8601String(),
      'sholat_wajib': sholatWajib,
      'sholat_tahajud': sholatTahajud ? 1 : 0,
      'sholat_dhuha': sholatDhuha,
      'sholat_rawatib': sholatRawatib,
      'sholat_sunnah_lainnya': sholatSunnahLainnya,
      'tilawah_quran': tilawahQuran ? 1 : 0,
      'terjemah_quran': terjemahQuran ? 1 : 0,
      'shaum_sunnah': shaumSunnah ? 1 : 0,
      'shodaqoh': shodaqoh ? 1 : 0,
      'dzikir_pagi_petang': dzikirPagiPetang ? 1 : 0,
      'istighfar_1000x': istighfar1000x,
      'sholawat_100x': sholawat100x,
      'menyimak_mq_pagi': menyimakMqPagi ? 1 : 0,
      if (kajianAlhikam != null) 'kajian_alhikam': kajianAlhikam,
      if (makrifatullah != null) 'makrifatullah': makrifatullah,
    };
  }

  factory MutabaahYaumiyahModel.fromJson(Map<String, dynamic> json) {
    return MutabaahYaumiyahModel(
      id: json['id'],
      userId: json['user_id'],
      date: DateTime.parse(json['date']),
      sholatWajib: json['sholat_wajib'] ?? 1,
      sholatTahajud: (json['sholat_tahajud'] ?? 0) == 1,
      sholatDhuha: json['sholat_dhuha'] ?? 0,
      sholatRawatib: json['sholat_rawatib'] ?? 0,
      sholatSunnahLainnya: json['sholat_sunnah_lainnya'] ?? 0,
      tilawahQuran: (json['tilawah_quran'] ?? 0) == 1,
      terjemahQuran: (json['terjemah_quran'] ?? 0) == 1,
      shaumSunnah: (json['shaum_sunnah'] ?? 0) == 1,
      shodaqoh: (json['shodaqoh'] ?? 0) == 1,
      dzikirPagiPetang: (json['dzikir_pagi_petang'] ?? 0) == 1,
      istighfar1000x: json['istighfar_1000x'] ?? 0,
      sholawat100x: json['sholawat_100x'] ?? 0,
      menyimakMqPagi: (json['menyimak_mq_pagi'] ?? 0) == 1,
      kajianAlhikam: json['kajian_alhikam'] != null
          ? int.parse(json['kajian_alhikam'].toString())
          : null,
      makrifatullah: json['makrifatullah'] != null
          ? int.parse(json['makrifatullah'].toString())
          : null,
    );
  }
}
