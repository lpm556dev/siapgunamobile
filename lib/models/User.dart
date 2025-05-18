class UserModel {
  String? namaLengkap;
  String? nik;
  bool? jenisKelamin;
  String? tempatLahir;
  DateTime? tanggalLahir;
  String? alamat;
  String? rt;
  String? rw;
  String? kodePos;
  String? kelurahanDesa;
  String? kecamatan;
  String? kabupatenKota;
  String? provinsi;
  String? domisiliKodePos;
  String? domisiliKelurahanDesa;
  String? domisiliKecamatan;
  String? domisiliKabupatenKota;
  String? domisiliProvinsi;
  String? nomorHp;
  String? email;
  String? agama;
  String? golonganDarah;
  String? password;
  String? domisiliAlamat;
  String? domisiliRt;
  String? domisiliRw;

  UserModel({
    this.namaLengkap,
    this.nik,
    this.jenisKelamin,
    this.tempatLahir,
    this.tanggalLahir,
    this.alamat,
    this.rt,
    this.rw,
    this.kodePos,
    this.kelurahanDesa,
    this.kecamatan,
    this.kabupatenKota,
    this.provinsi,
    this.domisiliKodePos,
    this.domisiliKelurahanDesa,
    this.domisiliKecamatan,
    this.domisiliKabupatenKota,
    this.domisiliProvinsi,
    this.nomorHp,
    this.email,
    this.agama,
    this.golonganDarah,
    this.password,
    this.domisiliAlamat,
    this.domisiliRt,
    this.domisiliRw,
  });

  Map<String, dynamic> toJson() => {
        'nama_lengkap': namaLengkap,
        'nik': nik,
        'jenis_kelamin': jenisKelamin! ? "1" : "0",
        'tempat_lahir': tempatLahir,
        'tanggal_lahir': tanggalLahir?.toIso8601String(),
        'alamat': alamat,
        'rt': rt,
        'rw': rw,
        'kode_pos': kodePos,
        'kelurahan_desa': kelurahanDesa,
        'kecamatan': kecamatan,
        'kabupaten_kota': kabupatenKota,
        'provinsi': provinsi,
        'domisili_kode_pos': domisiliKodePos,
        'domisili_kelurahan_desa': domisiliKelurahanDesa,
        'domisili_kecamatan': domisiliKecamatan,
        'domisili_kabupaten_kota': domisiliKabupatenKota,
        'domisili_provinsi': domisiliProvinsi,
        'nomor_hp': nomorHp,
        'email': email,
        'agama': agama,
        'golongan_darah': golonganDarah,
        'password': password,
        'domisili_alamat': domisiliAlamat,
        'domisili_rt': domisiliRt,
        'domisili_rw': domisiliRw,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        namaLengkap: json['nama_lengkap'],
        nik: json['nik'],
        jenisKelamin: json['jenis_kelamin'],
        tempatLahir: json['tempat_lahir'],
        tanggalLahir: json['tanggal_lahir'] != null
            ? DateTime.parse(json['tanggal_lahir'])
            : null,
        alamat: json['alamat'],
        rt: json['rt'],
        rw: json['rw'],
        kodePos: json['kode_pos'],
        kelurahanDesa: json['kelurahan_desa'],
        kecamatan: json['kecamatan'],
        kabupatenKota: json['kabupaten_kota'],
        provinsi: json['provinsi'],
        domisiliKodePos: json['domisili_kode_pos'],
        domisiliKelurahanDesa: json['domisili_kelurahan_desa'],
        domisiliKecamatan: json['domisili_kecamatan'],
        domisiliKabupatenKota: json['domisili_kabupaten_kota'],
        domisiliProvinsi: json['domisili_provinsi'],
        nomorHp: json['nomor_hp'],
        email: json['email'],
        agama: json['agama'],
        golonganDarah: json['golongan_darah'],
        password: json['password'],
        domisiliAlamat: json['domisili_alamat'],
        domisiliRt: json['domisili_rt'],
        domisiliRw: json['domisili_rw'],
      );
}
