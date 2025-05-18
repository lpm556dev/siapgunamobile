// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_database.dart';

// ignore_for_file: type=lint
class MQuranT extends Table with TableInfo<MQuranT, MQuranTData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  MQuranT(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _noSuratMeta = const VerificationMeta(
    'noSurat',
  );
  late final GeneratedColumn<int> noSurat = GeneratedColumn<int>(
    'no_surat',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _nmSuratMeta = const VerificationMeta(
    'nmSurat',
  );
  late final GeneratedColumn<String> nmSurat = GeneratedColumn<String>(
    'nm_surat',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _nmSurat2Meta = const VerificationMeta(
    'nmSurat2',
  );
  late final GeneratedColumn<String> nmSurat2 = GeneratedColumn<String>(
    'nm_surat2',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _artiSuratMeta = const VerificationMeta(
    'artiSurat',
  );
  late final GeneratedColumn<String> artiSurat = GeneratedColumn<String>(
    'arti_surat',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _jmlAyatMeta = const VerificationMeta(
    'jmlAyat',
  );
  late final GeneratedColumn<int> jmlAyat = GeneratedColumn<int>(
    'jml_ayat',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _tmpTurunMeta = const VerificationMeta(
    'tmpTurun',
  );
  late final GeneratedColumn<String> tmpTurun = GeneratedColumn<String>(
    'tmp_turun',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _asbNuzulMeta = const VerificationMeta(
    'asbNuzul',
  );
  late final GeneratedColumn<String> asbNuzul = GeneratedColumn<String>(
    'asb_nuzul',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _finishMeta = const VerificationMeta('finish');
  late final GeneratedColumn<int> finish = GeneratedColumn<int>(
    'finish',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [
    noSurat,
    nmSurat,
    nmSurat2,
    artiSurat,
    jmlAyat,
    tmpTurun,
    asbNuzul,
    finish,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'm_quran_t';
  @override
  VerificationContext validateIntegrity(
    Insertable<MQuranTData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('no_surat')) {
      context.handle(
        _noSuratMeta,
        noSurat.isAcceptableOrUnknown(data['no_surat']!, _noSuratMeta),
      );
    }
    if (data.containsKey('nm_surat')) {
      context.handle(
        _nmSuratMeta,
        nmSurat.isAcceptableOrUnknown(data['nm_surat']!, _nmSuratMeta),
      );
    }
    if (data.containsKey('nm_surat2')) {
      context.handle(
        _nmSurat2Meta,
        nmSurat2.isAcceptableOrUnknown(data['nm_surat2']!, _nmSurat2Meta),
      );
    }
    if (data.containsKey('arti_surat')) {
      context.handle(
        _artiSuratMeta,
        artiSurat.isAcceptableOrUnknown(data['arti_surat']!, _artiSuratMeta),
      );
    }
    if (data.containsKey('jml_ayat')) {
      context.handle(
        _jmlAyatMeta,
        jmlAyat.isAcceptableOrUnknown(data['jml_ayat']!, _jmlAyatMeta),
      );
    }
    if (data.containsKey('tmp_turun')) {
      context.handle(
        _tmpTurunMeta,
        tmpTurun.isAcceptableOrUnknown(data['tmp_turun']!, _tmpTurunMeta),
      );
    }
    if (data.containsKey('asb_nuzul')) {
      context.handle(
        _asbNuzulMeta,
        asbNuzul.isAcceptableOrUnknown(data['asb_nuzul']!, _asbNuzulMeta),
      );
    }
    if (data.containsKey('finish')) {
      context.handle(
        _finishMeta,
        finish.isAcceptableOrUnknown(data['finish']!, _finishMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  MQuranTData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MQuranTData(
      noSurat: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}no_surat'],
      ),
      nmSurat: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nm_surat'],
      ),
      nmSurat2: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nm_surat2'],
      ),
      artiSurat: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}arti_surat'],
      ),
      jmlAyat: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}jml_ayat'],
      ),
      tmpTurun: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tmp_turun'],
      ),
      asbNuzul: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}asb_nuzul'],
      ),
      finish: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}finish'],
      ),
    );
  }

  @override
  MQuranT createAlias(String alias) {
    return MQuranT(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class MQuranTData extends DataClass implements Insertable<MQuranTData> {
  final int? noSurat;
  final String? nmSurat;
  final String? nmSurat2;
  final String? artiSurat;
  final int? jmlAyat;
  final String? tmpTurun;
  final String? asbNuzul;
  final int? finish;
  const MQuranTData({
    this.noSurat,
    this.nmSurat,
    this.nmSurat2,
    this.artiSurat,
    this.jmlAyat,
    this.tmpTurun,
    this.asbNuzul,
    this.finish,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || noSurat != null) {
      map['no_surat'] = Variable<int>(noSurat);
    }
    if (!nullToAbsent || nmSurat != null) {
      map['nm_surat'] = Variable<String>(nmSurat);
    }
    if (!nullToAbsent || nmSurat2 != null) {
      map['nm_surat2'] = Variable<String>(nmSurat2);
    }
    if (!nullToAbsent || artiSurat != null) {
      map['arti_surat'] = Variable<String>(artiSurat);
    }
    if (!nullToAbsent || jmlAyat != null) {
      map['jml_ayat'] = Variable<int>(jmlAyat);
    }
    if (!nullToAbsent || tmpTurun != null) {
      map['tmp_turun'] = Variable<String>(tmpTurun);
    }
    if (!nullToAbsent || asbNuzul != null) {
      map['asb_nuzul'] = Variable<String>(asbNuzul);
    }
    if (!nullToAbsent || finish != null) {
      map['finish'] = Variable<int>(finish);
    }
    return map;
  }

  MQuranTCompanion toCompanion(bool nullToAbsent) {
    return MQuranTCompanion(
      noSurat:
          noSurat == null && nullToAbsent
              ? const Value.absent()
              : Value(noSurat),
      nmSurat:
          nmSurat == null && nullToAbsent
              ? const Value.absent()
              : Value(nmSurat),
      nmSurat2:
          nmSurat2 == null && nullToAbsent
              ? const Value.absent()
              : Value(nmSurat2),
      artiSurat:
          artiSurat == null && nullToAbsent
              ? const Value.absent()
              : Value(artiSurat),
      jmlAyat:
          jmlAyat == null && nullToAbsent
              ? const Value.absent()
              : Value(jmlAyat),
      tmpTurun:
          tmpTurun == null && nullToAbsent
              ? const Value.absent()
              : Value(tmpTurun),
      asbNuzul:
          asbNuzul == null && nullToAbsent
              ? const Value.absent()
              : Value(asbNuzul),
      finish:
          finish == null && nullToAbsent ? const Value.absent() : Value(finish),
    );
  }

  factory MQuranTData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MQuranTData(
      noSurat: serializer.fromJson<int?>(json['no_surat']),
      nmSurat: serializer.fromJson<String?>(json['nm_surat']),
      nmSurat2: serializer.fromJson<String?>(json['nm_surat2']),
      artiSurat: serializer.fromJson<String?>(json['arti_surat']),
      jmlAyat: serializer.fromJson<int?>(json['jml_ayat']),
      tmpTurun: serializer.fromJson<String?>(json['tmp_turun']),
      asbNuzul: serializer.fromJson<String?>(json['asb_nuzul']),
      finish: serializer.fromJson<int?>(json['finish']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'no_surat': serializer.toJson<int?>(noSurat),
      'nm_surat': serializer.toJson<String?>(nmSurat),
      'nm_surat2': serializer.toJson<String?>(nmSurat2),
      'arti_surat': serializer.toJson<String?>(artiSurat),
      'jml_ayat': serializer.toJson<int?>(jmlAyat),
      'tmp_turun': serializer.toJson<String?>(tmpTurun),
      'asb_nuzul': serializer.toJson<String?>(asbNuzul),
      'finish': serializer.toJson<int?>(finish),
    };
  }

  MQuranTData copyWith({
    Value<int?> noSurat = const Value.absent(),
    Value<String?> nmSurat = const Value.absent(),
    Value<String?> nmSurat2 = const Value.absent(),
    Value<String?> artiSurat = const Value.absent(),
    Value<int?> jmlAyat = const Value.absent(),
    Value<String?> tmpTurun = const Value.absent(),
    Value<String?> asbNuzul = const Value.absent(),
    Value<int?> finish = const Value.absent(),
  }) => MQuranTData(
    noSurat: noSurat.present ? noSurat.value : this.noSurat,
    nmSurat: nmSurat.present ? nmSurat.value : this.nmSurat,
    nmSurat2: nmSurat2.present ? nmSurat2.value : this.nmSurat2,
    artiSurat: artiSurat.present ? artiSurat.value : this.artiSurat,
    jmlAyat: jmlAyat.present ? jmlAyat.value : this.jmlAyat,
    tmpTurun: tmpTurun.present ? tmpTurun.value : this.tmpTurun,
    asbNuzul: asbNuzul.present ? asbNuzul.value : this.asbNuzul,
    finish: finish.present ? finish.value : this.finish,
  );
  MQuranTData copyWithCompanion(MQuranTCompanion data) {
    return MQuranTData(
      noSurat: data.noSurat.present ? data.noSurat.value : this.noSurat,
      nmSurat: data.nmSurat.present ? data.nmSurat.value : this.nmSurat,
      nmSurat2: data.nmSurat2.present ? data.nmSurat2.value : this.nmSurat2,
      artiSurat: data.artiSurat.present ? data.artiSurat.value : this.artiSurat,
      jmlAyat: data.jmlAyat.present ? data.jmlAyat.value : this.jmlAyat,
      tmpTurun: data.tmpTurun.present ? data.tmpTurun.value : this.tmpTurun,
      asbNuzul: data.asbNuzul.present ? data.asbNuzul.value : this.asbNuzul,
      finish: data.finish.present ? data.finish.value : this.finish,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MQuranTData(')
          ..write('noSurat: $noSurat, ')
          ..write('nmSurat: $nmSurat, ')
          ..write('nmSurat2: $nmSurat2, ')
          ..write('artiSurat: $artiSurat, ')
          ..write('jmlAyat: $jmlAyat, ')
          ..write('tmpTurun: $tmpTurun, ')
          ..write('asbNuzul: $asbNuzul, ')
          ..write('finish: $finish')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    noSurat,
    nmSurat,
    nmSurat2,
    artiSurat,
    jmlAyat,
    tmpTurun,
    asbNuzul,
    finish,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MQuranTData &&
          other.noSurat == this.noSurat &&
          other.nmSurat == this.nmSurat &&
          other.nmSurat2 == this.nmSurat2 &&
          other.artiSurat == this.artiSurat &&
          other.jmlAyat == this.jmlAyat &&
          other.tmpTurun == this.tmpTurun &&
          other.asbNuzul == this.asbNuzul &&
          other.finish == this.finish);
}

class MQuranTCompanion extends UpdateCompanion<MQuranTData> {
  final Value<int?> noSurat;
  final Value<String?> nmSurat;
  final Value<String?> nmSurat2;
  final Value<String?> artiSurat;
  final Value<int?> jmlAyat;
  final Value<String?> tmpTurun;
  final Value<String?> asbNuzul;
  final Value<int?> finish;
  final Value<int> rowid;
  const MQuranTCompanion({
    this.noSurat = const Value.absent(),
    this.nmSurat = const Value.absent(),
    this.nmSurat2 = const Value.absent(),
    this.artiSurat = const Value.absent(),
    this.jmlAyat = const Value.absent(),
    this.tmpTurun = const Value.absent(),
    this.asbNuzul = const Value.absent(),
    this.finish = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MQuranTCompanion.insert({
    this.noSurat = const Value.absent(),
    this.nmSurat = const Value.absent(),
    this.nmSurat2 = const Value.absent(),
    this.artiSurat = const Value.absent(),
    this.jmlAyat = const Value.absent(),
    this.tmpTurun = const Value.absent(),
    this.asbNuzul = const Value.absent(),
    this.finish = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<MQuranTData> custom({
    Expression<int>? noSurat,
    Expression<String>? nmSurat,
    Expression<String>? nmSurat2,
    Expression<String>? artiSurat,
    Expression<int>? jmlAyat,
    Expression<String>? tmpTurun,
    Expression<String>? asbNuzul,
    Expression<int>? finish,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (noSurat != null) 'no_surat': noSurat,
      if (nmSurat != null) 'nm_surat': nmSurat,
      if (nmSurat2 != null) 'nm_surat2': nmSurat2,
      if (artiSurat != null) 'arti_surat': artiSurat,
      if (jmlAyat != null) 'jml_ayat': jmlAyat,
      if (tmpTurun != null) 'tmp_turun': tmpTurun,
      if (asbNuzul != null) 'asb_nuzul': asbNuzul,
      if (finish != null) 'finish': finish,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MQuranTCompanion copyWith({
    Value<int?>? noSurat,
    Value<String?>? nmSurat,
    Value<String?>? nmSurat2,
    Value<String?>? artiSurat,
    Value<int?>? jmlAyat,
    Value<String?>? tmpTurun,
    Value<String?>? asbNuzul,
    Value<int?>? finish,
    Value<int>? rowid,
  }) {
    return MQuranTCompanion(
      noSurat: noSurat ?? this.noSurat,
      nmSurat: nmSurat ?? this.nmSurat,
      nmSurat2: nmSurat2 ?? this.nmSurat2,
      artiSurat: artiSurat ?? this.artiSurat,
      jmlAyat: jmlAyat ?? this.jmlAyat,
      tmpTurun: tmpTurun ?? this.tmpTurun,
      asbNuzul: asbNuzul ?? this.asbNuzul,
      finish: finish ?? this.finish,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (noSurat.present) {
      map['no_surat'] = Variable<int>(noSurat.value);
    }
    if (nmSurat.present) {
      map['nm_surat'] = Variable<String>(nmSurat.value);
    }
    if (nmSurat2.present) {
      map['nm_surat2'] = Variable<String>(nmSurat2.value);
    }
    if (artiSurat.present) {
      map['arti_surat'] = Variable<String>(artiSurat.value);
    }
    if (jmlAyat.present) {
      map['jml_ayat'] = Variable<int>(jmlAyat.value);
    }
    if (tmpTurun.present) {
      map['tmp_turun'] = Variable<String>(tmpTurun.value);
    }
    if (asbNuzul.present) {
      map['asb_nuzul'] = Variable<String>(asbNuzul.value);
    }
    if (finish.present) {
      map['finish'] = Variable<int>(finish.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MQuranTCompanion(')
          ..write('noSurat: $noSurat, ')
          ..write('nmSurat: $nmSurat, ')
          ..write('nmSurat2: $nmSurat2, ')
          ..write('artiSurat: $artiSurat, ')
          ..write('jmlAyat: $jmlAyat, ')
          ..write('tmpTurun: $tmpTurun, ')
          ..write('asbNuzul: $asbNuzul, ')
          ..write('finish: $finish, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class DFooterT extends Table with TableInfo<DFooterT, DFooterTData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  DFooterT(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _noSuratMeta = const VerificationMeta(
    'noSurat',
  );
  late final GeneratedColumn<int> noSurat = GeneratedColumn<int>(
    'no_surat',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _noAyatMeta = const VerificationMeta('noAyat');
  late final GeneratedColumn<int> noAyat = GeneratedColumn<int>(
    'no_ayat',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _noFootMeta = const VerificationMeta('noFoot');
  late final GeneratedColumn<int> noFoot = GeneratedColumn<int>(
    'no_foot',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _tFootMeta = const VerificationMeta('tFoot');
  late final GeneratedColumn<int> tFoot = GeneratedColumn<int>(
    't_foot',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _catatanMeta = const VerificationMeta(
    'catatan',
  );
  late final GeneratedColumn<int> catatan = GeneratedColumn<int>(
    'catatan',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [
    noSurat,
    noAyat,
    noFoot,
    tFoot,
    catatan,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'd_footer_t';
  @override
  VerificationContext validateIntegrity(
    Insertable<DFooterTData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('no_surat')) {
      context.handle(
        _noSuratMeta,
        noSurat.isAcceptableOrUnknown(data['no_surat']!, _noSuratMeta),
      );
    }
    if (data.containsKey('no_ayat')) {
      context.handle(
        _noAyatMeta,
        noAyat.isAcceptableOrUnknown(data['no_ayat']!, _noAyatMeta),
      );
    }
    if (data.containsKey('no_foot')) {
      context.handle(
        _noFootMeta,
        noFoot.isAcceptableOrUnknown(data['no_foot']!, _noFootMeta),
      );
    }
    if (data.containsKey('t_foot')) {
      context.handle(
        _tFootMeta,
        tFoot.isAcceptableOrUnknown(data['t_foot']!, _tFootMeta),
      );
    }
    if (data.containsKey('catatan')) {
      context.handle(
        _catatanMeta,
        catatan.isAcceptableOrUnknown(data['catatan']!, _catatanMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  DFooterTData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DFooterTData(
      noSurat: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}no_surat'],
      ),
      noAyat: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}no_ayat'],
      ),
      noFoot: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}no_foot'],
      ),
      tFoot: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}t_foot'],
      ),
      catatan: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}catatan'],
      ),
    );
  }

  @override
  DFooterT createAlias(String alias) {
    return DFooterT(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class DFooterTData extends DataClass implements Insertable<DFooterTData> {
  final int? noSurat;
  final int? noAyat;
  final int? noFoot;
  final int? tFoot;
  final int? catatan;
  const DFooterTData({
    this.noSurat,
    this.noAyat,
    this.noFoot,
    this.tFoot,
    this.catatan,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || noSurat != null) {
      map['no_surat'] = Variable<int>(noSurat);
    }
    if (!nullToAbsent || noAyat != null) {
      map['no_ayat'] = Variable<int>(noAyat);
    }
    if (!nullToAbsent || noFoot != null) {
      map['no_foot'] = Variable<int>(noFoot);
    }
    if (!nullToAbsent || tFoot != null) {
      map['t_foot'] = Variable<int>(tFoot);
    }
    if (!nullToAbsent || catatan != null) {
      map['catatan'] = Variable<int>(catatan);
    }
    return map;
  }

  DFooterTCompanion toCompanion(bool nullToAbsent) {
    return DFooterTCompanion(
      noSurat:
          noSurat == null && nullToAbsent
              ? const Value.absent()
              : Value(noSurat),
      noAyat:
          noAyat == null && nullToAbsent ? const Value.absent() : Value(noAyat),
      noFoot:
          noFoot == null && nullToAbsent ? const Value.absent() : Value(noFoot),
      tFoot:
          tFoot == null && nullToAbsent ? const Value.absent() : Value(tFoot),
      catatan:
          catatan == null && nullToAbsent
              ? const Value.absent()
              : Value(catatan),
    );
  }

  factory DFooterTData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DFooterTData(
      noSurat: serializer.fromJson<int?>(json['no_surat']),
      noAyat: serializer.fromJson<int?>(json['no_ayat']),
      noFoot: serializer.fromJson<int?>(json['no_foot']),
      tFoot: serializer.fromJson<int?>(json['t_foot']),
      catatan: serializer.fromJson<int?>(json['catatan']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'no_surat': serializer.toJson<int?>(noSurat),
      'no_ayat': serializer.toJson<int?>(noAyat),
      'no_foot': serializer.toJson<int?>(noFoot),
      't_foot': serializer.toJson<int?>(tFoot),
      'catatan': serializer.toJson<int?>(catatan),
    };
  }

  DFooterTData copyWith({
    Value<int?> noSurat = const Value.absent(),
    Value<int?> noAyat = const Value.absent(),
    Value<int?> noFoot = const Value.absent(),
    Value<int?> tFoot = const Value.absent(),
    Value<int?> catatan = const Value.absent(),
  }) => DFooterTData(
    noSurat: noSurat.present ? noSurat.value : this.noSurat,
    noAyat: noAyat.present ? noAyat.value : this.noAyat,
    noFoot: noFoot.present ? noFoot.value : this.noFoot,
    tFoot: tFoot.present ? tFoot.value : this.tFoot,
    catatan: catatan.present ? catatan.value : this.catatan,
  );
  DFooterTData copyWithCompanion(DFooterTCompanion data) {
    return DFooterTData(
      noSurat: data.noSurat.present ? data.noSurat.value : this.noSurat,
      noAyat: data.noAyat.present ? data.noAyat.value : this.noAyat,
      noFoot: data.noFoot.present ? data.noFoot.value : this.noFoot,
      tFoot: data.tFoot.present ? data.tFoot.value : this.tFoot,
      catatan: data.catatan.present ? data.catatan.value : this.catatan,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DFooterTData(')
          ..write('noSurat: $noSurat, ')
          ..write('noAyat: $noAyat, ')
          ..write('noFoot: $noFoot, ')
          ..write('tFoot: $tFoot, ')
          ..write('catatan: $catatan')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(noSurat, noAyat, noFoot, tFoot, catatan);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DFooterTData &&
          other.noSurat == this.noSurat &&
          other.noAyat == this.noAyat &&
          other.noFoot == this.noFoot &&
          other.tFoot == this.tFoot &&
          other.catatan == this.catatan);
}

class DFooterTCompanion extends UpdateCompanion<DFooterTData> {
  final Value<int?> noSurat;
  final Value<int?> noAyat;
  final Value<int?> noFoot;
  final Value<int?> tFoot;
  final Value<int?> catatan;
  final Value<int> rowid;
  const DFooterTCompanion({
    this.noSurat = const Value.absent(),
    this.noAyat = const Value.absent(),
    this.noFoot = const Value.absent(),
    this.tFoot = const Value.absent(),
    this.catatan = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DFooterTCompanion.insert({
    this.noSurat = const Value.absent(),
    this.noAyat = const Value.absent(),
    this.noFoot = const Value.absent(),
    this.tFoot = const Value.absent(),
    this.catatan = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<DFooterTData> custom({
    Expression<int>? noSurat,
    Expression<int>? noAyat,
    Expression<int>? noFoot,
    Expression<int>? tFoot,
    Expression<int>? catatan,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (noSurat != null) 'no_surat': noSurat,
      if (noAyat != null) 'no_ayat': noAyat,
      if (noFoot != null) 'no_foot': noFoot,
      if (tFoot != null) 't_foot': tFoot,
      if (catatan != null) 'catatan': catatan,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DFooterTCompanion copyWith({
    Value<int?>? noSurat,
    Value<int?>? noAyat,
    Value<int?>? noFoot,
    Value<int?>? tFoot,
    Value<int?>? catatan,
    Value<int>? rowid,
  }) {
    return DFooterTCompanion(
      noSurat: noSurat ?? this.noSurat,
      noAyat: noAyat ?? this.noAyat,
      noFoot: noFoot ?? this.noFoot,
      tFoot: tFoot ?? this.tFoot,
      catatan: catatan ?? this.catatan,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (noSurat.present) {
      map['no_surat'] = Variable<int>(noSurat.value);
    }
    if (noAyat.present) {
      map['no_ayat'] = Variable<int>(noAyat.value);
    }
    if (noFoot.present) {
      map['no_foot'] = Variable<int>(noFoot.value);
    }
    if (tFoot.present) {
      map['t_foot'] = Variable<int>(tFoot.value);
    }
    if (catatan.present) {
      map['catatan'] = Variable<int>(catatan.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DFooterTCompanion(')
          ..write('noSurat: $noSurat, ')
          ..write('noAyat: $noAyat, ')
          ..write('noFoot: $noFoot, ')
          ..write('tFoot: $tFoot, ')
          ..write('catatan: $catatan, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class DPilihanT extends Table with TableInfo<DPilihanT, DPilihanTData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  DPilihanT(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _noSuratMeta = const VerificationMeta(
    'noSurat',
  );
  late final GeneratedColumn<int> noSurat = GeneratedColumn<int>(
    'no_surat',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _noAyatMeta = const VerificationMeta('noAyat');
  late final GeneratedColumn<int> noAyat = GeneratedColumn<int>(
    'no_ayat',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _kontenMeta = const VerificationMeta('konten');
  late final GeneratedColumn<int> konten = GeneratedColumn<int>(
    'konten',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [noSurat, noAyat, konten];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'd_pilihan_t';
  @override
  VerificationContext validateIntegrity(
    Insertable<DPilihanTData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('no_surat')) {
      context.handle(
        _noSuratMeta,
        noSurat.isAcceptableOrUnknown(data['no_surat']!, _noSuratMeta),
      );
    }
    if (data.containsKey('no_ayat')) {
      context.handle(
        _noAyatMeta,
        noAyat.isAcceptableOrUnknown(data['no_ayat']!, _noAyatMeta),
      );
    }
    if (data.containsKey('konten')) {
      context.handle(
        _kontenMeta,
        konten.isAcceptableOrUnknown(data['konten']!, _kontenMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  DPilihanTData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DPilihanTData(
      noSurat: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}no_surat'],
      ),
      noAyat: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}no_ayat'],
      ),
      konten: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}konten'],
      ),
    );
  }

  @override
  DPilihanT createAlias(String alias) {
    return DPilihanT(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class DPilihanTData extends DataClass implements Insertable<DPilihanTData> {
  final int? noSurat;
  final int? noAyat;
  final int? konten;
  const DPilihanTData({this.noSurat, this.noAyat, this.konten});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || noSurat != null) {
      map['no_surat'] = Variable<int>(noSurat);
    }
    if (!nullToAbsent || noAyat != null) {
      map['no_ayat'] = Variable<int>(noAyat);
    }
    if (!nullToAbsent || konten != null) {
      map['konten'] = Variable<int>(konten);
    }
    return map;
  }

  DPilihanTCompanion toCompanion(bool nullToAbsent) {
    return DPilihanTCompanion(
      noSurat:
          noSurat == null && nullToAbsent
              ? const Value.absent()
              : Value(noSurat),
      noAyat:
          noAyat == null && nullToAbsent ? const Value.absent() : Value(noAyat),
      konten:
          konten == null && nullToAbsent ? const Value.absent() : Value(konten),
    );
  }

  factory DPilihanTData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DPilihanTData(
      noSurat: serializer.fromJson<int?>(json['no_surat']),
      noAyat: serializer.fromJson<int?>(json['no_ayat']),
      konten: serializer.fromJson<int?>(json['konten']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'no_surat': serializer.toJson<int?>(noSurat),
      'no_ayat': serializer.toJson<int?>(noAyat),
      'konten': serializer.toJson<int?>(konten),
    };
  }

  DPilihanTData copyWith({
    Value<int?> noSurat = const Value.absent(),
    Value<int?> noAyat = const Value.absent(),
    Value<int?> konten = const Value.absent(),
  }) => DPilihanTData(
    noSurat: noSurat.present ? noSurat.value : this.noSurat,
    noAyat: noAyat.present ? noAyat.value : this.noAyat,
    konten: konten.present ? konten.value : this.konten,
  );
  DPilihanTData copyWithCompanion(DPilihanTCompanion data) {
    return DPilihanTData(
      noSurat: data.noSurat.present ? data.noSurat.value : this.noSurat,
      noAyat: data.noAyat.present ? data.noAyat.value : this.noAyat,
      konten: data.konten.present ? data.konten.value : this.konten,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DPilihanTData(')
          ..write('noSurat: $noSurat, ')
          ..write('noAyat: $noAyat, ')
          ..write('konten: $konten')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(noSurat, noAyat, konten);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DPilihanTData &&
          other.noSurat == this.noSurat &&
          other.noAyat == this.noAyat &&
          other.konten == this.konten);
}

class DPilihanTCompanion extends UpdateCompanion<DPilihanTData> {
  final Value<int?> noSurat;
  final Value<int?> noAyat;
  final Value<int?> konten;
  final Value<int> rowid;
  const DPilihanTCompanion({
    this.noSurat = const Value.absent(),
    this.noAyat = const Value.absent(),
    this.konten = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DPilihanTCompanion.insert({
    this.noSurat = const Value.absent(),
    this.noAyat = const Value.absent(),
    this.konten = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<DPilihanTData> custom({
    Expression<int>? noSurat,
    Expression<int>? noAyat,
    Expression<int>? konten,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (noSurat != null) 'no_surat': noSurat,
      if (noAyat != null) 'no_ayat': noAyat,
      if (konten != null) 'konten': konten,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DPilihanTCompanion copyWith({
    Value<int?>? noSurat,
    Value<int?>? noAyat,
    Value<int?>? konten,
    Value<int>? rowid,
  }) {
    return DPilihanTCompanion(
      noSurat: noSurat ?? this.noSurat,
      noAyat: noAyat ?? this.noAyat,
      konten: konten ?? this.konten,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (noSurat.present) {
      map['no_surat'] = Variable<int>(noSurat.value);
    }
    if (noAyat.present) {
      map['no_ayat'] = Variable<int>(noAyat.value);
    }
    if (konten.present) {
      map['konten'] = Variable<int>(konten.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DPilihanTCompanion(')
          ..write('noSurat: $noSurat, ')
          ..write('noAyat: $noAyat, ')
          ..write('konten: $konten, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class MPilihanT extends Table with TableInfo<MPilihanT, MPilihanTData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  MPilihanT(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _noPilMeta = const VerificationMeta('noPil');
  late final GeneratedColumn<int> noPil = GeneratedColumn<int>(
    'no_pil',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _kontenMeta = const VerificationMeta('konten');
  late final GeneratedColumn<String> konten = GeneratedColumn<String>(
    'konten',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [noPil, konten];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'm_pilihan_t';
  @override
  VerificationContext validateIntegrity(
    Insertable<MPilihanTData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('no_pil')) {
      context.handle(
        _noPilMeta,
        noPil.isAcceptableOrUnknown(data['no_pil']!, _noPilMeta),
      );
    }
    if (data.containsKey('konten')) {
      context.handle(
        _kontenMeta,
        konten.isAcceptableOrUnknown(data['konten']!, _kontenMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  MPilihanTData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MPilihanTData(
      noPil: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}no_pil'],
      ),
      konten: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}konten'],
      ),
    );
  }

  @override
  MPilihanT createAlias(String alias) {
    return MPilihanT(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class MPilihanTData extends DataClass implements Insertable<MPilihanTData> {
  final int? noPil;
  final String? konten;
  const MPilihanTData({this.noPil, this.konten});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || noPil != null) {
      map['no_pil'] = Variable<int>(noPil);
    }
    if (!nullToAbsent || konten != null) {
      map['konten'] = Variable<String>(konten);
    }
    return map;
  }

  MPilihanTCompanion toCompanion(bool nullToAbsent) {
    return MPilihanTCompanion(
      noPil:
          noPil == null && nullToAbsent ? const Value.absent() : Value(noPil),
      konten:
          konten == null && nullToAbsent ? const Value.absent() : Value(konten),
    );
  }

  factory MPilihanTData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MPilihanTData(
      noPil: serializer.fromJson<int?>(json['no_pil']),
      konten: serializer.fromJson<String?>(json['konten']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'no_pil': serializer.toJson<int?>(noPil),
      'konten': serializer.toJson<String?>(konten),
    };
  }

  MPilihanTData copyWith({
    Value<int?> noPil = const Value.absent(),
    Value<String?> konten = const Value.absent(),
  }) => MPilihanTData(
    noPil: noPil.present ? noPil.value : this.noPil,
    konten: konten.present ? konten.value : this.konten,
  );
  MPilihanTData copyWithCompanion(MPilihanTCompanion data) {
    return MPilihanTData(
      noPil: data.noPil.present ? data.noPil.value : this.noPil,
      konten: data.konten.present ? data.konten.value : this.konten,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MPilihanTData(')
          ..write('noPil: $noPil, ')
          ..write('konten: $konten')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(noPil, konten);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MPilihanTData &&
          other.noPil == this.noPil &&
          other.konten == this.konten);
}

class MPilihanTCompanion extends UpdateCompanion<MPilihanTData> {
  final Value<int?> noPil;
  final Value<String?> konten;
  final Value<int> rowid;
  const MPilihanTCompanion({
    this.noPil = const Value.absent(),
    this.konten = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MPilihanTCompanion.insert({
    this.noPil = const Value.absent(),
    this.konten = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<MPilihanTData> custom({
    Expression<int>? noPil,
    Expression<String>? konten,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (noPil != null) 'no_pil': noPil,
      if (konten != null) 'konten': konten,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MPilihanTCompanion copyWith({
    Value<int?>? noPil,
    Value<String?>? konten,
    Value<int>? rowid,
  }) {
    return MPilihanTCompanion(
      noPil: noPil ?? this.noPil,
      konten: konten ?? this.konten,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (noPil.present) {
      map['no_pil'] = Variable<int>(noPil.value);
    }
    if (konten.present) {
      map['konten'] = Variable<String>(konten.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MPilihanTCompanion(')
          ..write('noPil: $noPil, ')
          ..write('konten: $konten, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class MHalT extends Table with TableInfo<MHalT, MHalTData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  MHalT(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _noHalMeta = const VerificationMeta('noHal');
  late final GeneratedColumn<int> noHal = GeneratedColumn<int>(
    'no_hal',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _noSurat1Meta = const VerificationMeta(
    'noSurat1',
  );
  late final GeneratedColumn<int> noSurat1 = GeneratedColumn<int>(
    'no_surat1',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _noAwalMeta = const VerificationMeta('noAwal');
  late final GeneratedColumn<int> noAwal = GeneratedColumn<int>(
    'no_awal',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _noSurat2Meta = const VerificationMeta(
    'noSurat2',
  );
  late final GeneratedColumn<int> noSurat2 = GeneratedColumn<int>(
    'no_surat2',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _noAkhirMeta = const VerificationMeta(
    'noAkhir',
  );
  late final GeneratedColumn<int> noAkhir = GeneratedColumn<int>(
    'no_akhir',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [
    noHal,
    noSurat1,
    noAwal,
    noSurat2,
    noAkhir,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'm_hal_t';
  @override
  VerificationContext validateIntegrity(
    Insertable<MHalTData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('no_hal')) {
      context.handle(
        _noHalMeta,
        noHal.isAcceptableOrUnknown(data['no_hal']!, _noHalMeta),
      );
    }
    if (data.containsKey('no_surat1')) {
      context.handle(
        _noSurat1Meta,
        noSurat1.isAcceptableOrUnknown(data['no_surat1']!, _noSurat1Meta),
      );
    }
    if (data.containsKey('no_awal')) {
      context.handle(
        _noAwalMeta,
        noAwal.isAcceptableOrUnknown(data['no_awal']!, _noAwalMeta),
      );
    }
    if (data.containsKey('no_surat2')) {
      context.handle(
        _noSurat2Meta,
        noSurat2.isAcceptableOrUnknown(data['no_surat2']!, _noSurat2Meta),
      );
    }
    if (data.containsKey('no_akhir')) {
      context.handle(
        _noAkhirMeta,
        noAkhir.isAcceptableOrUnknown(data['no_akhir']!, _noAkhirMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  MHalTData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MHalTData(
      noHal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}no_hal'],
      ),
      noSurat1: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}no_surat1'],
      ),
      noAwal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}no_awal'],
      ),
      noSurat2: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}no_surat2'],
      ),
      noAkhir: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}no_akhir'],
      ),
    );
  }

  @override
  MHalT createAlias(String alias) {
    return MHalT(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class MHalTData extends DataClass implements Insertable<MHalTData> {
  final int? noHal;
  final int? noSurat1;
  final int? noAwal;
  final int? noSurat2;
  final int? noAkhir;
  const MHalTData({
    this.noHal,
    this.noSurat1,
    this.noAwal,
    this.noSurat2,
    this.noAkhir,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || noHal != null) {
      map['no_hal'] = Variable<int>(noHal);
    }
    if (!nullToAbsent || noSurat1 != null) {
      map['no_surat1'] = Variable<int>(noSurat1);
    }
    if (!nullToAbsent || noAwal != null) {
      map['no_awal'] = Variable<int>(noAwal);
    }
    if (!nullToAbsent || noSurat2 != null) {
      map['no_surat2'] = Variable<int>(noSurat2);
    }
    if (!nullToAbsent || noAkhir != null) {
      map['no_akhir'] = Variable<int>(noAkhir);
    }
    return map;
  }

  MHalTCompanion toCompanion(bool nullToAbsent) {
    return MHalTCompanion(
      noHal:
          noHal == null && nullToAbsent ? const Value.absent() : Value(noHal),
      noSurat1:
          noSurat1 == null && nullToAbsent
              ? const Value.absent()
              : Value(noSurat1),
      noAwal:
          noAwal == null && nullToAbsent ? const Value.absent() : Value(noAwal),
      noSurat2:
          noSurat2 == null && nullToAbsent
              ? const Value.absent()
              : Value(noSurat2),
      noAkhir:
          noAkhir == null && nullToAbsent
              ? const Value.absent()
              : Value(noAkhir),
    );
  }

  factory MHalTData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MHalTData(
      noHal: serializer.fromJson<int?>(json['no_hal']),
      noSurat1: serializer.fromJson<int?>(json['no_surat1']),
      noAwal: serializer.fromJson<int?>(json['no_awal']),
      noSurat2: serializer.fromJson<int?>(json['no_surat2']),
      noAkhir: serializer.fromJson<int?>(json['no_akhir']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'no_hal': serializer.toJson<int?>(noHal),
      'no_surat1': serializer.toJson<int?>(noSurat1),
      'no_awal': serializer.toJson<int?>(noAwal),
      'no_surat2': serializer.toJson<int?>(noSurat2),
      'no_akhir': serializer.toJson<int?>(noAkhir),
    };
  }

  MHalTData copyWith({
    Value<int?> noHal = const Value.absent(),
    Value<int?> noSurat1 = const Value.absent(),
    Value<int?> noAwal = const Value.absent(),
    Value<int?> noSurat2 = const Value.absent(),
    Value<int?> noAkhir = const Value.absent(),
  }) => MHalTData(
    noHal: noHal.present ? noHal.value : this.noHal,
    noSurat1: noSurat1.present ? noSurat1.value : this.noSurat1,
    noAwal: noAwal.present ? noAwal.value : this.noAwal,
    noSurat2: noSurat2.present ? noSurat2.value : this.noSurat2,
    noAkhir: noAkhir.present ? noAkhir.value : this.noAkhir,
  );
  MHalTData copyWithCompanion(MHalTCompanion data) {
    return MHalTData(
      noHal: data.noHal.present ? data.noHal.value : this.noHal,
      noSurat1: data.noSurat1.present ? data.noSurat1.value : this.noSurat1,
      noAwal: data.noAwal.present ? data.noAwal.value : this.noAwal,
      noSurat2: data.noSurat2.present ? data.noSurat2.value : this.noSurat2,
      noAkhir: data.noAkhir.present ? data.noAkhir.value : this.noAkhir,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MHalTData(')
          ..write('noHal: $noHal, ')
          ..write('noSurat1: $noSurat1, ')
          ..write('noAwal: $noAwal, ')
          ..write('noSurat2: $noSurat2, ')
          ..write('noAkhir: $noAkhir')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(noHal, noSurat1, noAwal, noSurat2, noAkhir);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MHalTData &&
          other.noHal == this.noHal &&
          other.noSurat1 == this.noSurat1 &&
          other.noAwal == this.noAwal &&
          other.noSurat2 == this.noSurat2 &&
          other.noAkhir == this.noAkhir);
}

class MHalTCompanion extends UpdateCompanion<MHalTData> {
  final Value<int?> noHal;
  final Value<int?> noSurat1;
  final Value<int?> noAwal;
  final Value<int?> noSurat2;
  final Value<int?> noAkhir;
  final Value<int> rowid;
  const MHalTCompanion({
    this.noHal = const Value.absent(),
    this.noSurat1 = const Value.absent(),
    this.noAwal = const Value.absent(),
    this.noSurat2 = const Value.absent(),
    this.noAkhir = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MHalTCompanion.insert({
    this.noHal = const Value.absent(),
    this.noSurat1 = const Value.absent(),
    this.noAwal = const Value.absent(),
    this.noSurat2 = const Value.absent(),
    this.noAkhir = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<MHalTData> custom({
    Expression<int>? noHal,
    Expression<int>? noSurat1,
    Expression<int>? noAwal,
    Expression<int>? noSurat2,
    Expression<int>? noAkhir,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (noHal != null) 'no_hal': noHal,
      if (noSurat1 != null) 'no_surat1': noSurat1,
      if (noAwal != null) 'no_awal': noAwal,
      if (noSurat2 != null) 'no_surat2': noSurat2,
      if (noAkhir != null) 'no_akhir': noAkhir,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MHalTCompanion copyWith({
    Value<int?>? noHal,
    Value<int?>? noSurat1,
    Value<int?>? noAwal,
    Value<int?>? noSurat2,
    Value<int?>? noAkhir,
    Value<int>? rowid,
  }) {
    return MHalTCompanion(
      noHal: noHal ?? this.noHal,
      noSurat1: noSurat1 ?? this.noSurat1,
      noAwal: noAwal ?? this.noAwal,
      noSurat2: noSurat2 ?? this.noSurat2,
      noAkhir: noAkhir ?? this.noAkhir,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (noHal.present) {
      map['no_hal'] = Variable<int>(noHal.value);
    }
    if (noSurat1.present) {
      map['no_surat1'] = Variable<int>(noSurat1.value);
    }
    if (noAwal.present) {
      map['no_awal'] = Variable<int>(noAwal.value);
    }
    if (noSurat2.present) {
      map['no_surat2'] = Variable<int>(noSurat2.value);
    }
    if (noAkhir.present) {
      map['no_akhir'] = Variable<int>(noAkhir.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MHalTCompanion(')
          ..write('noHal: $noHal, ')
          ..write('noSurat1: $noSurat1, ')
          ..write('noAwal: $noAwal, ')
          ..write('noSurat2: $noSurat2, ')
          ..write('noAkhir: $noAkhir, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class MJuzT extends Table with TableInfo<MJuzT, MJuzTData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  MJuzT(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _noJuzMeta = const VerificationMeta('noJuz');
  late final GeneratedColumn<int> noJuz = GeneratedColumn<int>(
    'no_juz',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _noSuratMeta = const VerificationMeta(
    'noSurat',
  );
  late final GeneratedColumn<int> noSurat = GeneratedColumn<int>(
    'no_surat',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _noAyatMeta = const VerificationMeta('noAyat');
  late final GeneratedColumn<int> noAyat = GeneratedColumn<int>(
    'no_ayat',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _noHalMeta = const VerificationMeta('noHal');
  late final GeneratedColumn<int> noHal = GeneratedColumn<int>(
    'no_hal',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [noJuz, noSurat, noAyat, noHal];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'm_juz_t';
  @override
  VerificationContext validateIntegrity(
    Insertable<MJuzTData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('no_juz')) {
      context.handle(
        _noJuzMeta,
        noJuz.isAcceptableOrUnknown(data['no_juz']!, _noJuzMeta),
      );
    }
    if (data.containsKey('no_surat')) {
      context.handle(
        _noSuratMeta,
        noSurat.isAcceptableOrUnknown(data['no_surat']!, _noSuratMeta),
      );
    }
    if (data.containsKey('no_ayat')) {
      context.handle(
        _noAyatMeta,
        noAyat.isAcceptableOrUnknown(data['no_ayat']!, _noAyatMeta),
      );
    }
    if (data.containsKey('no_hal')) {
      context.handle(
        _noHalMeta,
        noHal.isAcceptableOrUnknown(data['no_hal']!, _noHalMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  MJuzTData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MJuzTData(
      noJuz: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}no_juz'],
      ),
      noSurat: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}no_surat'],
      ),
      noAyat: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}no_ayat'],
      ),
      noHal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}no_hal'],
      ),
    );
  }

  @override
  MJuzT createAlias(String alias) {
    return MJuzT(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class MJuzTData extends DataClass implements Insertable<MJuzTData> {
  final int? noJuz;
  final int? noSurat;
  final int? noAyat;
  final int? noHal;
  const MJuzTData({this.noJuz, this.noSurat, this.noAyat, this.noHal});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || noJuz != null) {
      map['no_juz'] = Variable<int>(noJuz);
    }
    if (!nullToAbsent || noSurat != null) {
      map['no_surat'] = Variable<int>(noSurat);
    }
    if (!nullToAbsent || noAyat != null) {
      map['no_ayat'] = Variable<int>(noAyat);
    }
    if (!nullToAbsent || noHal != null) {
      map['no_hal'] = Variable<int>(noHal);
    }
    return map;
  }

  MJuzTCompanion toCompanion(bool nullToAbsent) {
    return MJuzTCompanion(
      noJuz:
          noJuz == null && nullToAbsent ? const Value.absent() : Value(noJuz),
      noSurat:
          noSurat == null && nullToAbsent
              ? const Value.absent()
              : Value(noSurat),
      noAyat:
          noAyat == null && nullToAbsent ? const Value.absent() : Value(noAyat),
      noHal:
          noHal == null && nullToAbsent ? const Value.absent() : Value(noHal),
    );
  }

  factory MJuzTData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MJuzTData(
      noJuz: serializer.fromJson<int?>(json['no_juz']),
      noSurat: serializer.fromJson<int?>(json['no_surat']),
      noAyat: serializer.fromJson<int?>(json['no_ayat']),
      noHal: serializer.fromJson<int?>(json['no_hal']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'no_juz': serializer.toJson<int?>(noJuz),
      'no_surat': serializer.toJson<int?>(noSurat),
      'no_ayat': serializer.toJson<int?>(noAyat),
      'no_hal': serializer.toJson<int?>(noHal),
    };
  }

  MJuzTData copyWith({
    Value<int?> noJuz = const Value.absent(),
    Value<int?> noSurat = const Value.absent(),
    Value<int?> noAyat = const Value.absent(),
    Value<int?> noHal = const Value.absent(),
  }) => MJuzTData(
    noJuz: noJuz.present ? noJuz.value : this.noJuz,
    noSurat: noSurat.present ? noSurat.value : this.noSurat,
    noAyat: noAyat.present ? noAyat.value : this.noAyat,
    noHal: noHal.present ? noHal.value : this.noHal,
  );
  MJuzTData copyWithCompanion(MJuzTCompanion data) {
    return MJuzTData(
      noJuz: data.noJuz.present ? data.noJuz.value : this.noJuz,
      noSurat: data.noSurat.present ? data.noSurat.value : this.noSurat,
      noAyat: data.noAyat.present ? data.noAyat.value : this.noAyat,
      noHal: data.noHal.present ? data.noHal.value : this.noHal,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MJuzTData(')
          ..write('noJuz: $noJuz, ')
          ..write('noSurat: $noSurat, ')
          ..write('noAyat: $noAyat, ')
          ..write('noHal: $noHal')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(noJuz, noSurat, noAyat, noHal);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MJuzTData &&
          other.noJuz == this.noJuz &&
          other.noSurat == this.noSurat &&
          other.noAyat == this.noAyat &&
          other.noHal == this.noHal);
}

class MJuzTCompanion extends UpdateCompanion<MJuzTData> {
  final Value<int?> noJuz;
  final Value<int?> noSurat;
  final Value<int?> noAyat;
  final Value<int?> noHal;
  final Value<int> rowid;
  const MJuzTCompanion({
    this.noJuz = const Value.absent(),
    this.noSurat = const Value.absent(),
    this.noAyat = const Value.absent(),
    this.noHal = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MJuzTCompanion.insert({
    this.noJuz = const Value.absent(),
    this.noSurat = const Value.absent(),
    this.noAyat = const Value.absent(),
    this.noHal = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<MJuzTData> custom({
    Expression<int>? noJuz,
    Expression<int>? noSurat,
    Expression<int>? noAyat,
    Expression<int>? noHal,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (noJuz != null) 'no_juz': noJuz,
      if (noSurat != null) 'no_surat': noSurat,
      if (noAyat != null) 'no_ayat': noAyat,
      if (noHal != null) 'no_hal': noHal,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MJuzTCompanion copyWith({
    Value<int?>? noJuz,
    Value<int?>? noSurat,
    Value<int?>? noAyat,
    Value<int?>? noHal,
    Value<int>? rowid,
  }) {
    return MJuzTCompanion(
      noJuz: noJuz ?? this.noJuz,
      noSurat: noSurat ?? this.noSurat,
      noAyat: noAyat ?? this.noAyat,
      noHal: noHal ?? this.noHal,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (noJuz.present) {
      map['no_juz'] = Variable<int>(noJuz.value);
    }
    if (noSurat.present) {
      map['no_surat'] = Variable<int>(noSurat.value);
    }
    if (noAyat.present) {
      map['no_ayat'] = Variable<int>(noAyat.value);
    }
    if (noHal.present) {
      map['no_hal'] = Variable<int>(noHal.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MJuzTCompanion(')
          ..write('noJuz: $noJuz, ')
          ..write('noSurat: $noSurat, ')
          ..write('noAyat: $noAyat, ')
          ..write('noHal: $noHal, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class MSuratT extends Table with TableInfo<MSuratT, MSuratTData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  MSuratT(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _noSuratMeta = const VerificationMeta(
    'noSurat',
  );
  late final GeneratedColumn<int> noSurat = GeneratedColumn<int>(
    'no_surat',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _noAyatMeta = const VerificationMeta('noAyat');
  late final GeneratedColumn<int> noAyat = GeneratedColumn<int>(
    'no_ayat',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _noJuzMeta = const VerificationMeta('noJuz');
  late final GeneratedColumn<int> noJuz = GeneratedColumn<int>(
    'no_juz',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _noHalMeta = const VerificationMeta('noHal');
  late final GeneratedColumn<int> noHal = GeneratedColumn<int>(
    'no_hal',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _tafsirMeta = const VerificationMeta('tafsir');
  late final GeneratedColumn<String> tafsir = GeneratedColumn<String>(
    'tafsir',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _tafsirMuasirMeta = const VerificationMeta(
    'tafsirMuasir',
  );
  late final GeneratedColumn<String> tafsirMuasir = GeneratedColumn<String>(
    'tafsir_muasir',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _tafsirClearQuranMeta = const VerificationMeta(
    'tafsirClearQuran',
  );
  late final GeneratedColumn<String> tafsirClearQuran = GeneratedColumn<String>(
    'tafsir_clearQuran',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _tafsirSureQuranMeta = const VerificationMeta(
    'tafsirSureQuran',
  );
  late final GeneratedColumn<String> tafsirSureQuran = GeneratedColumn<String>(
    'tafsir_sureQuran',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _arabMeta = const VerificationMeta('arab');
  late final GeneratedColumn<String> arab = GeneratedColumn<String>(
    'arab',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [
    noSurat,
    noAyat,
    noJuz,
    noHal,
    tafsir,
    tafsirMuasir,
    tafsirClearQuran,
    tafsirSureQuran,
    arab,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'm_surat_t';
  @override
  VerificationContext validateIntegrity(
    Insertable<MSuratTData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('no_surat')) {
      context.handle(
        _noSuratMeta,
        noSurat.isAcceptableOrUnknown(data['no_surat']!, _noSuratMeta),
      );
    }
    if (data.containsKey('no_ayat')) {
      context.handle(
        _noAyatMeta,
        noAyat.isAcceptableOrUnknown(data['no_ayat']!, _noAyatMeta),
      );
    }
    if (data.containsKey('no_juz')) {
      context.handle(
        _noJuzMeta,
        noJuz.isAcceptableOrUnknown(data['no_juz']!, _noJuzMeta),
      );
    }
    if (data.containsKey('no_hal')) {
      context.handle(
        _noHalMeta,
        noHal.isAcceptableOrUnknown(data['no_hal']!, _noHalMeta),
      );
    }
    if (data.containsKey('tafsir')) {
      context.handle(
        _tafsirMeta,
        tafsir.isAcceptableOrUnknown(data['tafsir']!, _tafsirMeta),
      );
    }
    if (data.containsKey('tafsir_muasir')) {
      context.handle(
        _tafsirMuasirMeta,
        tafsirMuasir.isAcceptableOrUnknown(
          data['tafsir_muasir']!,
          _tafsirMuasirMeta,
        ),
      );
    }
    if (data.containsKey('tafsir_clearQuran')) {
      context.handle(
        _tafsirClearQuranMeta,
        tafsirClearQuran.isAcceptableOrUnknown(
          data['tafsir_clearQuran']!,
          _tafsirClearQuranMeta,
        ),
      );
    }
    if (data.containsKey('tafsir_sureQuran')) {
      context.handle(
        _tafsirSureQuranMeta,
        tafsirSureQuran.isAcceptableOrUnknown(
          data['tafsir_sureQuran']!,
          _tafsirSureQuranMeta,
        ),
      );
    }
    if (data.containsKey('arab')) {
      context.handle(
        _arabMeta,
        arab.isAcceptableOrUnknown(data['arab']!, _arabMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  MSuratTData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MSuratTData(
      noSurat: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}no_surat'],
      ),
      noAyat: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}no_ayat'],
      ),
      noJuz: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}no_juz'],
      ),
      noHal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}no_hal'],
      ),
      tafsir: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tafsir'],
      ),
      tafsirMuasir: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tafsir_muasir'],
      ),
      tafsirClearQuran: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tafsir_clearQuran'],
      ),
      tafsirSureQuran: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tafsir_sureQuran'],
      ),
      arab: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}arab'],
      ),
    );
  }

  @override
  MSuratT createAlias(String alias) {
    return MSuratT(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class MSuratTData extends DataClass implements Insertable<MSuratTData> {
  final int? noSurat;
  final int? noAyat;
  final int? noJuz;
  final int? noHal;
  final String? tafsir;
  final String? tafsirMuasir;
  final String? tafsirClearQuran;
  final String? tafsirSureQuran;
  final String? arab;
  const MSuratTData({
    this.noSurat,
    this.noAyat,
    this.noJuz,
    this.noHal,
    this.tafsir,
    this.tafsirMuasir,
    this.tafsirClearQuran,
    this.tafsirSureQuran,
    this.arab,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || noSurat != null) {
      map['no_surat'] = Variable<int>(noSurat);
    }
    if (!nullToAbsent || noAyat != null) {
      map['no_ayat'] = Variable<int>(noAyat);
    }
    if (!nullToAbsent || noJuz != null) {
      map['no_juz'] = Variable<int>(noJuz);
    }
    if (!nullToAbsent || noHal != null) {
      map['no_hal'] = Variable<int>(noHal);
    }
    if (!nullToAbsent || tafsir != null) {
      map['tafsir'] = Variable<String>(tafsir);
    }
    if (!nullToAbsent || tafsirMuasir != null) {
      map['tafsir_muasir'] = Variable<String>(tafsirMuasir);
    }
    if (!nullToAbsent || tafsirClearQuran != null) {
      map['tafsir_clearQuran'] = Variable<String>(tafsirClearQuran);
    }
    if (!nullToAbsent || tafsirSureQuran != null) {
      map['tafsir_sureQuran'] = Variable<String>(tafsirSureQuran);
    }
    if (!nullToAbsent || arab != null) {
      map['arab'] = Variable<String>(arab);
    }
    return map;
  }

  MSuratTCompanion toCompanion(bool nullToAbsent) {
    return MSuratTCompanion(
      noSurat:
          noSurat == null && nullToAbsent
              ? const Value.absent()
              : Value(noSurat),
      noAyat:
          noAyat == null && nullToAbsent ? const Value.absent() : Value(noAyat),
      noJuz:
          noJuz == null && nullToAbsent ? const Value.absent() : Value(noJuz),
      noHal:
          noHal == null && nullToAbsent ? const Value.absent() : Value(noHal),
      tafsir:
          tafsir == null && nullToAbsent ? const Value.absent() : Value(tafsir),
      tafsirMuasir:
          tafsirMuasir == null && nullToAbsent
              ? const Value.absent()
              : Value(tafsirMuasir),
      tafsirClearQuran:
          tafsirClearQuran == null && nullToAbsent
              ? const Value.absent()
              : Value(tafsirClearQuran),
      tafsirSureQuran:
          tafsirSureQuran == null && nullToAbsent
              ? const Value.absent()
              : Value(tafsirSureQuran),
      arab: arab == null && nullToAbsent ? const Value.absent() : Value(arab),
    );
  }

  factory MSuratTData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MSuratTData(
      noSurat: serializer.fromJson<int?>(json['no_surat']),
      noAyat: serializer.fromJson<int?>(json['no_ayat']),
      noJuz: serializer.fromJson<int?>(json['no_juz']),
      noHal: serializer.fromJson<int?>(json['no_hal']),
      tafsir: serializer.fromJson<String?>(json['tafsir']),
      tafsirMuasir: serializer.fromJson<String?>(json['tafsir_muasir']),
      tafsirClearQuran: serializer.fromJson<String?>(json['tafsir_clearQuran']),
      tafsirSureQuran: serializer.fromJson<String?>(json['tafsir_sureQuran']),
      arab: serializer.fromJson<String?>(json['arab']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'no_surat': serializer.toJson<int?>(noSurat),
      'no_ayat': serializer.toJson<int?>(noAyat),
      'no_juz': serializer.toJson<int?>(noJuz),
      'no_hal': serializer.toJson<int?>(noHal),
      'tafsir': serializer.toJson<String?>(tafsir),
      'tafsir_muasir': serializer.toJson<String?>(tafsirMuasir),
      'tafsir_clearQuran': serializer.toJson<String?>(tafsirClearQuran),
      'tafsir_sureQuran': serializer.toJson<String?>(tafsirSureQuran),
      'arab': serializer.toJson<String?>(arab),
    };
  }

  MSuratTData copyWith({
    Value<int?> noSurat = const Value.absent(),
    Value<int?> noAyat = const Value.absent(),
    Value<int?> noJuz = const Value.absent(),
    Value<int?> noHal = const Value.absent(),
    Value<String?> tafsir = const Value.absent(),
    Value<String?> tafsirMuasir = const Value.absent(),
    Value<String?> tafsirClearQuran = const Value.absent(),
    Value<String?> tafsirSureQuran = const Value.absent(),
    Value<String?> arab = const Value.absent(),
  }) => MSuratTData(
    noSurat: noSurat.present ? noSurat.value : this.noSurat,
    noAyat: noAyat.present ? noAyat.value : this.noAyat,
    noJuz: noJuz.present ? noJuz.value : this.noJuz,
    noHal: noHal.present ? noHal.value : this.noHal,
    tafsir: tafsir.present ? tafsir.value : this.tafsir,
    tafsirMuasir: tafsirMuasir.present ? tafsirMuasir.value : this.tafsirMuasir,
    tafsirClearQuran:
        tafsirClearQuran.present
            ? tafsirClearQuran.value
            : this.tafsirClearQuran,
    tafsirSureQuran:
        tafsirSureQuran.present ? tafsirSureQuran.value : this.tafsirSureQuran,
    arab: arab.present ? arab.value : this.arab,
  );
  MSuratTData copyWithCompanion(MSuratTCompanion data) {
    return MSuratTData(
      noSurat: data.noSurat.present ? data.noSurat.value : this.noSurat,
      noAyat: data.noAyat.present ? data.noAyat.value : this.noAyat,
      noJuz: data.noJuz.present ? data.noJuz.value : this.noJuz,
      noHal: data.noHal.present ? data.noHal.value : this.noHal,
      tafsir: data.tafsir.present ? data.tafsir.value : this.tafsir,
      tafsirMuasir:
          data.tafsirMuasir.present
              ? data.tafsirMuasir.value
              : this.tafsirMuasir,
      tafsirClearQuran:
          data.tafsirClearQuran.present
              ? data.tafsirClearQuran.value
              : this.tafsirClearQuran,
      tafsirSureQuran:
          data.tafsirSureQuran.present
              ? data.tafsirSureQuran.value
              : this.tafsirSureQuran,
      arab: data.arab.present ? data.arab.value : this.arab,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MSuratTData(')
          ..write('noSurat: $noSurat, ')
          ..write('noAyat: $noAyat, ')
          ..write('noJuz: $noJuz, ')
          ..write('noHal: $noHal, ')
          ..write('tafsir: $tafsir, ')
          ..write('tafsirMuasir: $tafsirMuasir, ')
          ..write('tafsirClearQuran: $tafsirClearQuran, ')
          ..write('tafsirSureQuran: $tafsirSureQuran, ')
          ..write('arab: $arab')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    noSurat,
    noAyat,
    noJuz,
    noHal,
    tafsir,
    tafsirMuasir,
    tafsirClearQuran,
    tafsirSureQuran,
    arab,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MSuratTData &&
          other.noSurat == this.noSurat &&
          other.noAyat == this.noAyat &&
          other.noJuz == this.noJuz &&
          other.noHal == this.noHal &&
          other.tafsir == this.tafsir &&
          other.tafsirMuasir == this.tafsirMuasir &&
          other.tafsirClearQuran == this.tafsirClearQuran &&
          other.tafsirSureQuran == this.tafsirSureQuran &&
          other.arab == this.arab);
}

class MSuratTCompanion extends UpdateCompanion<MSuratTData> {
  final Value<int?> noSurat;
  final Value<int?> noAyat;
  final Value<int?> noJuz;
  final Value<int?> noHal;
  final Value<String?> tafsir;
  final Value<String?> tafsirMuasir;
  final Value<String?> tafsirClearQuran;
  final Value<String?> tafsirSureQuran;
  final Value<String?> arab;
  final Value<int> rowid;
  const MSuratTCompanion({
    this.noSurat = const Value.absent(),
    this.noAyat = const Value.absent(),
    this.noJuz = const Value.absent(),
    this.noHal = const Value.absent(),
    this.tafsir = const Value.absent(),
    this.tafsirMuasir = const Value.absent(),
    this.tafsirClearQuran = const Value.absent(),
    this.tafsirSureQuran = const Value.absent(),
    this.arab = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MSuratTCompanion.insert({
    this.noSurat = const Value.absent(),
    this.noAyat = const Value.absent(),
    this.noJuz = const Value.absent(),
    this.noHal = const Value.absent(),
    this.tafsir = const Value.absent(),
    this.tafsirMuasir = const Value.absent(),
    this.tafsirClearQuran = const Value.absent(),
    this.tafsirSureQuran = const Value.absent(),
    this.arab = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<MSuratTData> custom({
    Expression<int>? noSurat,
    Expression<int>? noAyat,
    Expression<int>? noJuz,
    Expression<int>? noHal,
    Expression<String>? tafsir,
    Expression<String>? tafsirMuasir,
    Expression<String>? tafsirClearQuran,
    Expression<String>? tafsirSureQuran,
    Expression<String>? arab,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (noSurat != null) 'no_surat': noSurat,
      if (noAyat != null) 'no_ayat': noAyat,
      if (noJuz != null) 'no_juz': noJuz,
      if (noHal != null) 'no_hal': noHal,
      if (tafsir != null) 'tafsir': tafsir,
      if (tafsirMuasir != null) 'tafsir_muasir': tafsirMuasir,
      if (tafsirClearQuran != null) 'tafsir_clearQuran': tafsirClearQuran,
      if (tafsirSureQuran != null) 'tafsir_sureQuran': tafsirSureQuran,
      if (arab != null) 'arab': arab,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MSuratTCompanion copyWith({
    Value<int?>? noSurat,
    Value<int?>? noAyat,
    Value<int?>? noJuz,
    Value<int?>? noHal,
    Value<String?>? tafsir,
    Value<String?>? tafsirMuasir,
    Value<String?>? tafsirClearQuran,
    Value<String?>? tafsirSureQuran,
    Value<String?>? arab,
    Value<int>? rowid,
  }) {
    return MSuratTCompanion(
      noSurat: noSurat ?? this.noSurat,
      noAyat: noAyat ?? this.noAyat,
      noJuz: noJuz ?? this.noJuz,
      noHal: noHal ?? this.noHal,
      tafsir: tafsir ?? this.tafsir,
      tafsirMuasir: tafsirMuasir ?? this.tafsirMuasir,
      tafsirClearQuran: tafsirClearQuran ?? this.tafsirClearQuran,
      tafsirSureQuran: tafsirSureQuran ?? this.tafsirSureQuran,
      arab: arab ?? this.arab,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (noSurat.present) {
      map['no_surat'] = Variable<int>(noSurat.value);
    }
    if (noAyat.present) {
      map['no_ayat'] = Variable<int>(noAyat.value);
    }
    if (noJuz.present) {
      map['no_juz'] = Variable<int>(noJuz.value);
    }
    if (noHal.present) {
      map['no_hal'] = Variable<int>(noHal.value);
    }
    if (tafsir.present) {
      map['tafsir'] = Variable<String>(tafsir.value);
    }
    if (tafsirMuasir.present) {
      map['tafsir_muasir'] = Variable<String>(tafsirMuasir.value);
    }
    if (tafsirClearQuran.present) {
      map['tafsir_clearQuran'] = Variable<String>(tafsirClearQuran.value);
    }
    if (tafsirSureQuran.present) {
      map['tafsir_sureQuran'] = Variable<String>(tafsirSureQuran.value);
    }
    if (arab.present) {
      map['arab'] = Variable<String>(arab.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MSuratTCompanion(')
          ..write('noSurat: $noSurat, ')
          ..write('noAyat: $noAyat, ')
          ..write('noJuz: $noJuz, ')
          ..write('noHal: $noHal, ')
          ..write('tafsir: $tafsir, ')
          ..write('tafsirMuasir: $tafsirMuasir, ')
          ..write('tafsirClearQuran: $tafsirClearQuran, ')
          ..write('tafsirSureQuran: $tafsirSureQuran, ')
          ..write('arab: $arab, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$QuranDatabase extends GeneratedDatabase {
  _$QuranDatabase(QueryExecutor e) : super(e);
  $QuranDatabaseManager get managers => $QuranDatabaseManager(this);
  late final MQuranT mQuranT = MQuranT(this);
  late final DFooterT dFooterT = DFooterT(this);
  late final DPilihanT dPilihanT = DPilihanT(this);
  late final MPilihanT mPilihanT = MPilihanT(this);
  late final MHalT mHalT = MHalT(this);
  late final MJuzT mJuzT = MJuzT(this);
  late final MSuratT mSuratT = MSuratT(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    mQuranT,
    dFooterT,
    dPilihanT,
    mPilihanT,
    mHalT,
    mJuzT,
    mSuratT,
  ];
}

typedef $MQuranTCreateCompanionBuilder =
    MQuranTCompanion Function({
      Value<int?> noSurat,
      Value<String?> nmSurat,
      Value<String?> nmSurat2,
      Value<String?> artiSurat,
      Value<int?> jmlAyat,
      Value<String?> tmpTurun,
      Value<String?> asbNuzul,
      Value<int?> finish,
      Value<int> rowid,
    });
typedef $MQuranTUpdateCompanionBuilder =
    MQuranTCompanion Function({
      Value<int?> noSurat,
      Value<String?> nmSurat,
      Value<String?> nmSurat2,
      Value<String?> artiSurat,
      Value<int?> jmlAyat,
      Value<String?> tmpTurun,
      Value<String?> asbNuzul,
      Value<int?> finish,
      Value<int> rowid,
    });

class $MQuranTFilterComposer extends Composer<_$QuranDatabase, MQuranT> {
  $MQuranTFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get noSurat => $composableBuilder(
    column: $table.noSurat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nmSurat => $composableBuilder(
    column: $table.nmSurat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nmSurat2 => $composableBuilder(
    column: $table.nmSurat2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get artiSurat => $composableBuilder(
    column: $table.artiSurat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get jmlAyat => $composableBuilder(
    column: $table.jmlAyat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tmpTurun => $composableBuilder(
    column: $table.tmpTurun,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get asbNuzul => $composableBuilder(
    column: $table.asbNuzul,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get finish => $composableBuilder(
    column: $table.finish,
    builder: (column) => ColumnFilters(column),
  );
}

class $MQuranTOrderingComposer extends Composer<_$QuranDatabase, MQuranT> {
  $MQuranTOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get noSurat => $composableBuilder(
    column: $table.noSurat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nmSurat => $composableBuilder(
    column: $table.nmSurat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nmSurat2 => $composableBuilder(
    column: $table.nmSurat2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get artiSurat => $composableBuilder(
    column: $table.artiSurat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get jmlAyat => $composableBuilder(
    column: $table.jmlAyat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tmpTurun => $composableBuilder(
    column: $table.tmpTurun,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get asbNuzul => $composableBuilder(
    column: $table.asbNuzul,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get finish => $composableBuilder(
    column: $table.finish,
    builder: (column) => ColumnOrderings(column),
  );
}

class $MQuranTAnnotationComposer extends Composer<_$QuranDatabase, MQuranT> {
  $MQuranTAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get noSurat =>
      $composableBuilder(column: $table.noSurat, builder: (column) => column);

  GeneratedColumn<String> get nmSurat =>
      $composableBuilder(column: $table.nmSurat, builder: (column) => column);

  GeneratedColumn<String> get nmSurat2 =>
      $composableBuilder(column: $table.nmSurat2, builder: (column) => column);

  GeneratedColumn<String> get artiSurat =>
      $composableBuilder(column: $table.artiSurat, builder: (column) => column);

  GeneratedColumn<int> get jmlAyat =>
      $composableBuilder(column: $table.jmlAyat, builder: (column) => column);

  GeneratedColumn<String> get tmpTurun =>
      $composableBuilder(column: $table.tmpTurun, builder: (column) => column);

  GeneratedColumn<String> get asbNuzul =>
      $composableBuilder(column: $table.asbNuzul, builder: (column) => column);

  GeneratedColumn<int> get finish =>
      $composableBuilder(column: $table.finish, builder: (column) => column);
}

class $MQuranTTableManager
    extends
        RootTableManager<
          _$QuranDatabase,
          MQuranT,
          MQuranTData,
          $MQuranTFilterComposer,
          $MQuranTOrderingComposer,
          $MQuranTAnnotationComposer,
          $MQuranTCreateCompanionBuilder,
          $MQuranTUpdateCompanionBuilder,
          (MQuranTData, BaseReferences<_$QuranDatabase, MQuranT, MQuranTData>),
          MQuranTData,
          PrefetchHooks Function()
        > {
  $MQuranTTableManager(_$QuranDatabase db, MQuranT table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $MQuranTFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $MQuranTOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $MQuranTAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int?> noSurat = const Value.absent(),
                Value<String?> nmSurat = const Value.absent(),
                Value<String?> nmSurat2 = const Value.absent(),
                Value<String?> artiSurat = const Value.absent(),
                Value<int?> jmlAyat = const Value.absent(),
                Value<String?> tmpTurun = const Value.absent(),
                Value<String?> asbNuzul = const Value.absent(),
                Value<int?> finish = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MQuranTCompanion(
                noSurat: noSurat,
                nmSurat: nmSurat,
                nmSurat2: nmSurat2,
                artiSurat: artiSurat,
                jmlAyat: jmlAyat,
                tmpTurun: tmpTurun,
                asbNuzul: asbNuzul,
                finish: finish,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<int?> noSurat = const Value.absent(),
                Value<String?> nmSurat = const Value.absent(),
                Value<String?> nmSurat2 = const Value.absent(),
                Value<String?> artiSurat = const Value.absent(),
                Value<int?> jmlAyat = const Value.absent(),
                Value<String?> tmpTurun = const Value.absent(),
                Value<String?> asbNuzul = const Value.absent(),
                Value<int?> finish = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MQuranTCompanion.insert(
                noSurat: noSurat,
                nmSurat: nmSurat,
                nmSurat2: nmSurat2,
                artiSurat: artiSurat,
                jmlAyat: jmlAyat,
                tmpTurun: tmpTurun,
                asbNuzul: asbNuzul,
                finish: finish,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $MQuranTProcessedTableManager =
    ProcessedTableManager<
      _$QuranDatabase,
      MQuranT,
      MQuranTData,
      $MQuranTFilterComposer,
      $MQuranTOrderingComposer,
      $MQuranTAnnotationComposer,
      $MQuranTCreateCompanionBuilder,
      $MQuranTUpdateCompanionBuilder,
      (MQuranTData, BaseReferences<_$QuranDatabase, MQuranT, MQuranTData>),
      MQuranTData,
      PrefetchHooks Function()
    >;
typedef $DFooterTCreateCompanionBuilder =
    DFooterTCompanion Function({
      Value<int?> noSurat,
      Value<int?> noAyat,
      Value<int?> noFoot,
      Value<int?> tFoot,
      Value<int?> catatan,
      Value<int> rowid,
    });
typedef $DFooterTUpdateCompanionBuilder =
    DFooterTCompanion Function({
      Value<int?> noSurat,
      Value<int?> noAyat,
      Value<int?> noFoot,
      Value<int?> tFoot,
      Value<int?> catatan,
      Value<int> rowid,
    });

class $DFooterTFilterComposer extends Composer<_$QuranDatabase, DFooterT> {
  $DFooterTFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get noSurat => $composableBuilder(
    column: $table.noSurat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get noAyat => $composableBuilder(
    column: $table.noAyat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get noFoot => $composableBuilder(
    column: $table.noFoot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tFoot => $composableBuilder(
    column: $table.tFoot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get catatan => $composableBuilder(
    column: $table.catatan,
    builder: (column) => ColumnFilters(column),
  );
}

class $DFooterTOrderingComposer extends Composer<_$QuranDatabase, DFooterT> {
  $DFooterTOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get noSurat => $composableBuilder(
    column: $table.noSurat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get noAyat => $composableBuilder(
    column: $table.noAyat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get noFoot => $composableBuilder(
    column: $table.noFoot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tFoot => $composableBuilder(
    column: $table.tFoot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get catatan => $composableBuilder(
    column: $table.catatan,
    builder: (column) => ColumnOrderings(column),
  );
}

class $DFooterTAnnotationComposer extends Composer<_$QuranDatabase, DFooterT> {
  $DFooterTAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get noSurat =>
      $composableBuilder(column: $table.noSurat, builder: (column) => column);

  GeneratedColumn<int> get noAyat =>
      $composableBuilder(column: $table.noAyat, builder: (column) => column);

  GeneratedColumn<int> get noFoot =>
      $composableBuilder(column: $table.noFoot, builder: (column) => column);

  GeneratedColumn<int> get tFoot =>
      $composableBuilder(column: $table.tFoot, builder: (column) => column);

  GeneratedColumn<int> get catatan =>
      $composableBuilder(column: $table.catatan, builder: (column) => column);
}

class $DFooterTTableManager
    extends
        RootTableManager<
          _$QuranDatabase,
          DFooterT,
          DFooterTData,
          $DFooterTFilterComposer,
          $DFooterTOrderingComposer,
          $DFooterTAnnotationComposer,
          $DFooterTCreateCompanionBuilder,
          $DFooterTUpdateCompanionBuilder,
          (
            DFooterTData,
            BaseReferences<_$QuranDatabase, DFooterT, DFooterTData>,
          ),
          DFooterTData,
          PrefetchHooks Function()
        > {
  $DFooterTTableManager(_$QuranDatabase db, DFooterT table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $DFooterTFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $DFooterTOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $DFooterTAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int?> noSurat = const Value.absent(),
                Value<int?> noAyat = const Value.absent(),
                Value<int?> noFoot = const Value.absent(),
                Value<int?> tFoot = const Value.absent(),
                Value<int?> catatan = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DFooterTCompanion(
                noSurat: noSurat,
                noAyat: noAyat,
                noFoot: noFoot,
                tFoot: tFoot,
                catatan: catatan,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<int?> noSurat = const Value.absent(),
                Value<int?> noAyat = const Value.absent(),
                Value<int?> noFoot = const Value.absent(),
                Value<int?> tFoot = const Value.absent(),
                Value<int?> catatan = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DFooterTCompanion.insert(
                noSurat: noSurat,
                noAyat: noAyat,
                noFoot: noFoot,
                tFoot: tFoot,
                catatan: catatan,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $DFooterTProcessedTableManager =
    ProcessedTableManager<
      _$QuranDatabase,
      DFooterT,
      DFooterTData,
      $DFooterTFilterComposer,
      $DFooterTOrderingComposer,
      $DFooterTAnnotationComposer,
      $DFooterTCreateCompanionBuilder,
      $DFooterTUpdateCompanionBuilder,
      (DFooterTData, BaseReferences<_$QuranDatabase, DFooterT, DFooterTData>),
      DFooterTData,
      PrefetchHooks Function()
    >;
typedef $DPilihanTCreateCompanionBuilder =
    DPilihanTCompanion Function({
      Value<int?> noSurat,
      Value<int?> noAyat,
      Value<int?> konten,
      Value<int> rowid,
    });
typedef $DPilihanTUpdateCompanionBuilder =
    DPilihanTCompanion Function({
      Value<int?> noSurat,
      Value<int?> noAyat,
      Value<int?> konten,
      Value<int> rowid,
    });

class $DPilihanTFilterComposer extends Composer<_$QuranDatabase, DPilihanT> {
  $DPilihanTFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get noSurat => $composableBuilder(
    column: $table.noSurat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get noAyat => $composableBuilder(
    column: $table.noAyat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get konten => $composableBuilder(
    column: $table.konten,
    builder: (column) => ColumnFilters(column),
  );
}

class $DPilihanTOrderingComposer extends Composer<_$QuranDatabase, DPilihanT> {
  $DPilihanTOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get noSurat => $composableBuilder(
    column: $table.noSurat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get noAyat => $composableBuilder(
    column: $table.noAyat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get konten => $composableBuilder(
    column: $table.konten,
    builder: (column) => ColumnOrderings(column),
  );
}

class $DPilihanTAnnotationComposer
    extends Composer<_$QuranDatabase, DPilihanT> {
  $DPilihanTAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get noSurat =>
      $composableBuilder(column: $table.noSurat, builder: (column) => column);

  GeneratedColumn<int> get noAyat =>
      $composableBuilder(column: $table.noAyat, builder: (column) => column);

  GeneratedColumn<int> get konten =>
      $composableBuilder(column: $table.konten, builder: (column) => column);
}

class $DPilihanTTableManager
    extends
        RootTableManager<
          _$QuranDatabase,
          DPilihanT,
          DPilihanTData,
          $DPilihanTFilterComposer,
          $DPilihanTOrderingComposer,
          $DPilihanTAnnotationComposer,
          $DPilihanTCreateCompanionBuilder,
          $DPilihanTUpdateCompanionBuilder,
          (
            DPilihanTData,
            BaseReferences<_$QuranDatabase, DPilihanT, DPilihanTData>,
          ),
          DPilihanTData,
          PrefetchHooks Function()
        > {
  $DPilihanTTableManager(_$QuranDatabase db, DPilihanT table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $DPilihanTFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $DPilihanTOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $DPilihanTAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int?> noSurat = const Value.absent(),
                Value<int?> noAyat = const Value.absent(),
                Value<int?> konten = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DPilihanTCompanion(
                noSurat: noSurat,
                noAyat: noAyat,
                konten: konten,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<int?> noSurat = const Value.absent(),
                Value<int?> noAyat = const Value.absent(),
                Value<int?> konten = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DPilihanTCompanion.insert(
                noSurat: noSurat,
                noAyat: noAyat,
                konten: konten,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $DPilihanTProcessedTableManager =
    ProcessedTableManager<
      _$QuranDatabase,
      DPilihanT,
      DPilihanTData,
      $DPilihanTFilterComposer,
      $DPilihanTOrderingComposer,
      $DPilihanTAnnotationComposer,
      $DPilihanTCreateCompanionBuilder,
      $DPilihanTUpdateCompanionBuilder,
      (
        DPilihanTData,
        BaseReferences<_$QuranDatabase, DPilihanT, DPilihanTData>,
      ),
      DPilihanTData,
      PrefetchHooks Function()
    >;
typedef $MPilihanTCreateCompanionBuilder =
    MPilihanTCompanion Function({
      Value<int?> noPil,
      Value<String?> konten,
      Value<int> rowid,
    });
typedef $MPilihanTUpdateCompanionBuilder =
    MPilihanTCompanion Function({
      Value<int?> noPil,
      Value<String?> konten,
      Value<int> rowid,
    });

class $MPilihanTFilterComposer extends Composer<_$QuranDatabase, MPilihanT> {
  $MPilihanTFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get noPil => $composableBuilder(
    column: $table.noPil,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get konten => $composableBuilder(
    column: $table.konten,
    builder: (column) => ColumnFilters(column),
  );
}

class $MPilihanTOrderingComposer extends Composer<_$QuranDatabase, MPilihanT> {
  $MPilihanTOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get noPil => $composableBuilder(
    column: $table.noPil,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get konten => $composableBuilder(
    column: $table.konten,
    builder: (column) => ColumnOrderings(column),
  );
}

class $MPilihanTAnnotationComposer
    extends Composer<_$QuranDatabase, MPilihanT> {
  $MPilihanTAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get noPil =>
      $composableBuilder(column: $table.noPil, builder: (column) => column);

  GeneratedColumn<String> get konten =>
      $composableBuilder(column: $table.konten, builder: (column) => column);
}

class $MPilihanTTableManager
    extends
        RootTableManager<
          _$QuranDatabase,
          MPilihanT,
          MPilihanTData,
          $MPilihanTFilterComposer,
          $MPilihanTOrderingComposer,
          $MPilihanTAnnotationComposer,
          $MPilihanTCreateCompanionBuilder,
          $MPilihanTUpdateCompanionBuilder,
          (
            MPilihanTData,
            BaseReferences<_$QuranDatabase, MPilihanT, MPilihanTData>,
          ),
          MPilihanTData,
          PrefetchHooks Function()
        > {
  $MPilihanTTableManager(_$QuranDatabase db, MPilihanT table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $MPilihanTFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $MPilihanTOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $MPilihanTAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int?> noPil = const Value.absent(),
                Value<String?> konten = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MPilihanTCompanion(
                noPil: noPil,
                konten: konten,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<int?> noPil = const Value.absent(),
                Value<String?> konten = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MPilihanTCompanion.insert(
                noPil: noPil,
                konten: konten,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $MPilihanTProcessedTableManager =
    ProcessedTableManager<
      _$QuranDatabase,
      MPilihanT,
      MPilihanTData,
      $MPilihanTFilterComposer,
      $MPilihanTOrderingComposer,
      $MPilihanTAnnotationComposer,
      $MPilihanTCreateCompanionBuilder,
      $MPilihanTUpdateCompanionBuilder,
      (
        MPilihanTData,
        BaseReferences<_$QuranDatabase, MPilihanT, MPilihanTData>,
      ),
      MPilihanTData,
      PrefetchHooks Function()
    >;
typedef $MHalTCreateCompanionBuilder =
    MHalTCompanion Function({
      Value<int?> noHal,
      Value<int?> noSurat1,
      Value<int?> noAwal,
      Value<int?> noSurat2,
      Value<int?> noAkhir,
      Value<int> rowid,
    });
typedef $MHalTUpdateCompanionBuilder =
    MHalTCompanion Function({
      Value<int?> noHal,
      Value<int?> noSurat1,
      Value<int?> noAwal,
      Value<int?> noSurat2,
      Value<int?> noAkhir,
      Value<int> rowid,
    });

class $MHalTFilterComposer extends Composer<_$QuranDatabase, MHalT> {
  $MHalTFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get noHal => $composableBuilder(
    column: $table.noHal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get noSurat1 => $composableBuilder(
    column: $table.noSurat1,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get noAwal => $composableBuilder(
    column: $table.noAwal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get noSurat2 => $composableBuilder(
    column: $table.noSurat2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get noAkhir => $composableBuilder(
    column: $table.noAkhir,
    builder: (column) => ColumnFilters(column),
  );
}

class $MHalTOrderingComposer extends Composer<_$QuranDatabase, MHalT> {
  $MHalTOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get noHal => $composableBuilder(
    column: $table.noHal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get noSurat1 => $composableBuilder(
    column: $table.noSurat1,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get noAwal => $composableBuilder(
    column: $table.noAwal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get noSurat2 => $composableBuilder(
    column: $table.noSurat2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get noAkhir => $composableBuilder(
    column: $table.noAkhir,
    builder: (column) => ColumnOrderings(column),
  );
}

class $MHalTAnnotationComposer extends Composer<_$QuranDatabase, MHalT> {
  $MHalTAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get noHal =>
      $composableBuilder(column: $table.noHal, builder: (column) => column);

  GeneratedColumn<int> get noSurat1 =>
      $composableBuilder(column: $table.noSurat1, builder: (column) => column);

  GeneratedColumn<int> get noAwal =>
      $composableBuilder(column: $table.noAwal, builder: (column) => column);

  GeneratedColumn<int> get noSurat2 =>
      $composableBuilder(column: $table.noSurat2, builder: (column) => column);

  GeneratedColumn<int> get noAkhir =>
      $composableBuilder(column: $table.noAkhir, builder: (column) => column);
}

class $MHalTTableManager
    extends
        RootTableManager<
          _$QuranDatabase,
          MHalT,
          MHalTData,
          $MHalTFilterComposer,
          $MHalTOrderingComposer,
          $MHalTAnnotationComposer,
          $MHalTCreateCompanionBuilder,
          $MHalTUpdateCompanionBuilder,
          (MHalTData, BaseReferences<_$QuranDatabase, MHalT, MHalTData>),
          MHalTData,
          PrefetchHooks Function()
        > {
  $MHalTTableManager(_$QuranDatabase db, MHalT table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $MHalTFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $MHalTOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $MHalTAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int?> noHal = const Value.absent(),
                Value<int?> noSurat1 = const Value.absent(),
                Value<int?> noAwal = const Value.absent(),
                Value<int?> noSurat2 = const Value.absent(),
                Value<int?> noAkhir = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MHalTCompanion(
                noHal: noHal,
                noSurat1: noSurat1,
                noAwal: noAwal,
                noSurat2: noSurat2,
                noAkhir: noAkhir,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<int?> noHal = const Value.absent(),
                Value<int?> noSurat1 = const Value.absent(),
                Value<int?> noAwal = const Value.absent(),
                Value<int?> noSurat2 = const Value.absent(),
                Value<int?> noAkhir = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MHalTCompanion.insert(
                noHal: noHal,
                noSurat1: noSurat1,
                noAwal: noAwal,
                noSurat2: noSurat2,
                noAkhir: noAkhir,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $MHalTProcessedTableManager =
    ProcessedTableManager<
      _$QuranDatabase,
      MHalT,
      MHalTData,
      $MHalTFilterComposer,
      $MHalTOrderingComposer,
      $MHalTAnnotationComposer,
      $MHalTCreateCompanionBuilder,
      $MHalTUpdateCompanionBuilder,
      (MHalTData, BaseReferences<_$QuranDatabase, MHalT, MHalTData>),
      MHalTData,
      PrefetchHooks Function()
    >;
typedef $MJuzTCreateCompanionBuilder =
    MJuzTCompanion Function({
      Value<int?> noJuz,
      Value<int?> noSurat,
      Value<int?> noAyat,
      Value<int?> noHal,
      Value<int> rowid,
    });
typedef $MJuzTUpdateCompanionBuilder =
    MJuzTCompanion Function({
      Value<int?> noJuz,
      Value<int?> noSurat,
      Value<int?> noAyat,
      Value<int?> noHal,
      Value<int> rowid,
    });

class $MJuzTFilterComposer extends Composer<_$QuranDatabase, MJuzT> {
  $MJuzTFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get noJuz => $composableBuilder(
    column: $table.noJuz,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get noSurat => $composableBuilder(
    column: $table.noSurat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get noAyat => $composableBuilder(
    column: $table.noAyat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get noHal => $composableBuilder(
    column: $table.noHal,
    builder: (column) => ColumnFilters(column),
  );
}

class $MJuzTOrderingComposer extends Composer<_$QuranDatabase, MJuzT> {
  $MJuzTOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get noJuz => $composableBuilder(
    column: $table.noJuz,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get noSurat => $composableBuilder(
    column: $table.noSurat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get noAyat => $composableBuilder(
    column: $table.noAyat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get noHal => $composableBuilder(
    column: $table.noHal,
    builder: (column) => ColumnOrderings(column),
  );
}

class $MJuzTAnnotationComposer extends Composer<_$QuranDatabase, MJuzT> {
  $MJuzTAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get noJuz =>
      $composableBuilder(column: $table.noJuz, builder: (column) => column);

  GeneratedColumn<int> get noSurat =>
      $composableBuilder(column: $table.noSurat, builder: (column) => column);

  GeneratedColumn<int> get noAyat =>
      $composableBuilder(column: $table.noAyat, builder: (column) => column);

  GeneratedColumn<int> get noHal =>
      $composableBuilder(column: $table.noHal, builder: (column) => column);
}

class $MJuzTTableManager
    extends
        RootTableManager<
          _$QuranDatabase,
          MJuzT,
          MJuzTData,
          $MJuzTFilterComposer,
          $MJuzTOrderingComposer,
          $MJuzTAnnotationComposer,
          $MJuzTCreateCompanionBuilder,
          $MJuzTUpdateCompanionBuilder,
          (MJuzTData, BaseReferences<_$QuranDatabase, MJuzT, MJuzTData>),
          MJuzTData,
          PrefetchHooks Function()
        > {
  $MJuzTTableManager(_$QuranDatabase db, MJuzT table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $MJuzTFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $MJuzTOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $MJuzTAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int?> noJuz = const Value.absent(),
                Value<int?> noSurat = const Value.absent(),
                Value<int?> noAyat = const Value.absent(),
                Value<int?> noHal = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MJuzTCompanion(
                noJuz: noJuz,
                noSurat: noSurat,
                noAyat: noAyat,
                noHal: noHal,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<int?> noJuz = const Value.absent(),
                Value<int?> noSurat = const Value.absent(),
                Value<int?> noAyat = const Value.absent(),
                Value<int?> noHal = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MJuzTCompanion.insert(
                noJuz: noJuz,
                noSurat: noSurat,
                noAyat: noAyat,
                noHal: noHal,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $MJuzTProcessedTableManager =
    ProcessedTableManager<
      _$QuranDatabase,
      MJuzT,
      MJuzTData,
      $MJuzTFilterComposer,
      $MJuzTOrderingComposer,
      $MJuzTAnnotationComposer,
      $MJuzTCreateCompanionBuilder,
      $MJuzTUpdateCompanionBuilder,
      (MJuzTData, BaseReferences<_$QuranDatabase, MJuzT, MJuzTData>),
      MJuzTData,
      PrefetchHooks Function()
    >;
typedef $MSuratTCreateCompanionBuilder =
    MSuratTCompanion Function({
      Value<int?> noSurat,
      Value<int?> noAyat,
      Value<int?> noJuz,
      Value<int?> noHal,
      Value<String?> tafsir,
      Value<String?> tafsirMuasir,
      Value<String?> tafsirClearQuran,
      Value<String?> tafsirSureQuran,
      Value<String?> arab,
      Value<int> rowid,
    });
typedef $MSuratTUpdateCompanionBuilder =
    MSuratTCompanion Function({
      Value<int?> noSurat,
      Value<int?> noAyat,
      Value<int?> noJuz,
      Value<int?> noHal,
      Value<String?> tafsir,
      Value<String?> tafsirMuasir,
      Value<String?> tafsirClearQuran,
      Value<String?> tafsirSureQuran,
      Value<String?> arab,
      Value<int> rowid,
    });

class $MSuratTFilterComposer extends Composer<_$QuranDatabase, MSuratT> {
  $MSuratTFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get noSurat => $composableBuilder(
    column: $table.noSurat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get noAyat => $composableBuilder(
    column: $table.noAyat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get noJuz => $composableBuilder(
    column: $table.noJuz,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get noHal => $composableBuilder(
    column: $table.noHal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tafsir => $composableBuilder(
    column: $table.tafsir,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tafsirMuasir => $composableBuilder(
    column: $table.tafsirMuasir,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tafsirClearQuran => $composableBuilder(
    column: $table.tafsirClearQuran,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tafsirSureQuran => $composableBuilder(
    column: $table.tafsirSureQuran,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get arab => $composableBuilder(
    column: $table.arab,
    builder: (column) => ColumnFilters(column),
  );
}

class $MSuratTOrderingComposer extends Composer<_$QuranDatabase, MSuratT> {
  $MSuratTOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get noSurat => $composableBuilder(
    column: $table.noSurat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get noAyat => $composableBuilder(
    column: $table.noAyat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get noJuz => $composableBuilder(
    column: $table.noJuz,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get noHal => $composableBuilder(
    column: $table.noHal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tafsir => $composableBuilder(
    column: $table.tafsir,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tafsirMuasir => $composableBuilder(
    column: $table.tafsirMuasir,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tafsirClearQuran => $composableBuilder(
    column: $table.tafsirClearQuran,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tafsirSureQuran => $composableBuilder(
    column: $table.tafsirSureQuran,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get arab => $composableBuilder(
    column: $table.arab,
    builder: (column) => ColumnOrderings(column),
  );
}

class $MSuratTAnnotationComposer extends Composer<_$QuranDatabase, MSuratT> {
  $MSuratTAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get noSurat =>
      $composableBuilder(column: $table.noSurat, builder: (column) => column);

  GeneratedColumn<int> get noAyat =>
      $composableBuilder(column: $table.noAyat, builder: (column) => column);

  GeneratedColumn<int> get noJuz =>
      $composableBuilder(column: $table.noJuz, builder: (column) => column);

  GeneratedColumn<int> get noHal =>
      $composableBuilder(column: $table.noHal, builder: (column) => column);

  GeneratedColumn<String> get tafsir =>
      $composableBuilder(column: $table.tafsir, builder: (column) => column);

  GeneratedColumn<String> get tafsirMuasir => $composableBuilder(
    column: $table.tafsirMuasir,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tafsirClearQuran => $composableBuilder(
    column: $table.tafsirClearQuran,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tafsirSureQuran => $composableBuilder(
    column: $table.tafsirSureQuran,
    builder: (column) => column,
  );

  GeneratedColumn<String> get arab =>
      $composableBuilder(column: $table.arab, builder: (column) => column);
}

class $MSuratTTableManager
    extends
        RootTableManager<
          _$QuranDatabase,
          MSuratT,
          MSuratTData,
          $MSuratTFilterComposer,
          $MSuratTOrderingComposer,
          $MSuratTAnnotationComposer,
          $MSuratTCreateCompanionBuilder,
          $MSuratTUpdateCompanionBuilder,
          (MSuratTData, BaseReferences<_$QuranDatabase, MSuratT, MSuratTData>),
          MSuratTData,
          PrefetchHooks Function()
        > {
  $MSuratTTableManager(_$QuranDatabase db, MSuratT table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $MSuratTFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $MSuratTOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $MSuratTAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int?> noSurat = const Value.absent(),
                Value<int?> noAyat = const Value.absent(),
                Value<int?> noJuz = const Value.absent(),
                Value<int?> noHal = const Value.absent(),
                Value<String?> tafsir = const Value.absent(),
                Value<String?> tafsirMuasir = const Value.absent(),
                Value<String?> tafsirClearQuran = const Value.absent(),
                Value<String?> tafsirSureQuran = const Value.absent(),
                Value<String?> arab = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MSuratTCompanion(
                noSurat: noSurat,
                noAyat: noAyat,
                noJuz: noJuz,
                noHal: noHal,
                tafsir: tafsir,
                tafsirMuasir: tafsirMuasir,
                tafsirClearQuran: tafsirClearQuran,
                tafsirSureQuran: tafsirSureQuran,
                arab: arab,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<int?> noSurat = const Value.absent(),
                Value<int?> noAyat = const Value.absent(),
                Value<int?> noJuz = const Value.absent(),
                Value<int?> noHal = const Value.absent(),
                Value<String?> tafsir = const Value.absent(),
                Value<String?> tafsirMuasir = const Value.absent(),
                Value<String?> tafsirClearQuran = const Value.absent(),
                Value<String?> tafsirSureQuran = const Value.absent(),
                Value<String?> arab = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MSuratTCompanion.insert(
                noSurat: noSurat,
                noAyat: noAyat,
                noJuz: noJuz,
                noHal: noHal,
                tafsir: tafsir,
                tafsirMuasir: tafsirMuasir,
                tafsirClearQuran: tafsirClearQuran,
                tafsirSureQuran: tafsirSureQuran,
                arab: arab,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $MSuratTProcessedTableManager =
    ProcessedTableManager<
      _$QuranDatabase,
      MSuratT,
      MSuratTData,
      $MSuratTFilterComposer,
      $MSuratTOrderingComposer,
      $MSuratTAnnotationComposer,
      $MSuratTCreateCompanionBuilder,
      $MSuratTUpdateCompanionBuilder,
      (MSuratTData, BaseReferences<_$QuranDatabase, MSuratT, MSuratTData>),
      MSuratTData,
      PrefetchHooks Function()
    >;

class $QuranDatabaseManager {
  final _$QuranDatabase _db;
  $QuranDatabaseManager(this._db);
  $MQuranTTableManager get mQuranT => $MQuranTTableManager(_db, _db.mQuranT);
  $DFooterTTableManager get dFooterT =>
      $DFooterTTableManager(_db, _db.dFooterT);
  $DPilihanTTableManager get dPilihanT =>
      $DPilihanTTableManager(_db, _db.dPilihanT);
  $MPilihanTTableManager get mPilihanT =>
      $MPilihanTTableManager(_db, _db.mPilihanT);
  $MHalTTableManager get mHalT => $MHalTTableManager(_db, _db.mHalT);
  $MJuzTTableManager get mJuzT => $MJuzTTableManager(_db, _db.mJuzT);
  $MSuratTTableManager get mSuratT => $MSuratTTableManager(_db, _db.mSuratT);
}
