// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PBookmarkTTable extends PBookmarkT
    with TableInfo<$PBookmarkTTable, PBookmarkTData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PBookmarkTTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _noHalMeta = const VerificationMeta('noHal');
  @override
  late final GeneratedColumn<int> noHal = GeneratedColumn<int>(
    'no_hal',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nmSuratMeta = const VerificationMeta(
    'nmSurat',
  );
  @override
  late final GeneratedColumn<String> nmSurat = GeneratedColumn<String>(
    'nm_surat',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _jmlAyatMeta = const VerificationMeta(
    'jmlAyat',
  );
  @override
  late final GeneratedColumn<int> jmlAyat = GeneratedColumn<int>(
    'jml_ayat',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [noHal, nmSurat, jmlAyat, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'p_bookmark_t';
  @override
  VerificationContext validateIntegrity(
    Insertable<PBookmarkTData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('no_hal')) {
      context.handle(
        _noHalMeta,
        noHal.isAcceptableOrUnknown(data['no_hal']!, _noHalMeta),
      );
    } else if (isInserting) {
      context.missing(_noHalMeta);
    }
    if (data.containsKey('nm_surat')) {
      context.handle(
        _nmSuratMeta,
        nmSurat.isAcceptableOrUnknown(data['nm_surat']!, _nmSuratMeta),
      );
    } else if (isInserting) {
      context.missing(_nmSuratMeta);
    }
    if (data.containsKey('jml_ayat')) {
      context.handle(
        _jmlAyatMeta,
        jmlAyat.isAcceptableOrUnknown(data['jml_ayat']!, _jmlAyatMeta),
      );
    } else if (isInserting) {
      context.missing(_jmlAyatMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  PBookmarkTData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PBookmarkTData(
      noHal:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}no_hal'],
          )!,
      nmSurat:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}nm_surat'],
          )!,
      jmlAyat:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}jml_ayat'],
          )!,
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
    );
  }

  @override
  $PBookmarkTTable createAlias(String alias) {
    return $PBookmarkTTable(attachedDatabase, alias);
  }
}

class PBookmarkTData extends DataClass implements Insertable<PBookmarkTData> {
  final int noHal;
  final String nmSurat;
  final int jmlAyat;
  final DateTime createdAt;
  const PBookmarkTData({
    required this.noHal,
    required this.nmSurat,
    required this.jmlAyat,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['no_hal'] = Variable<int>(noHal);
    map['nm_surat'] = Variable<String>(nmSurat);
    map['jml_ayat'] = Variable<int>(jmlAyat);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PBookmarkTCompanion toCompanion(bool nullToAbsent) {
    return PBookmarkTCompanion(
      noHal: Value(noHal),
      nmSurat: Value(nmSurat),
      jmlAyat: Value(jmlAyat),
      createdAt: Value(createdAt),
    );
  }

  factory PBookmarkTData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PBookmarkTData(
      noHal: serializer.fromJson<int>(json['noHal']),
      nmSurat: serializer.fromJson<String>(json['nmSurat']),
      jmlAyat: serializer.fromJson<int>(json['jmlAyat']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'noHal': serializer.toJson<int>(noHal),
      'nmSurat': serializer.toJson<String>(nmSurat),
      'jmlAyat': serializer.toJson<int>(jmlAyat),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PBookmarkTData copyWith({
    int? noHal,
    String? nmSurat,
    int? jmlAyat,
    DateTime? createdAt,
  }) => PBookmarkTData(
    noHal: noHal ?? this.noHal,
    nmSurat: nmSurat ?? this.nmSurat,
    jmlAyat: jmlAyat ?? this.jmlAyat,
    createdAt: createdAt ?? this.createdAt,
  );
  PBookmarkTData copyWithCompanion(PBookmarkTCompanion data) {
    return PBookmarkTData(
      noHal: data.noHal.present ? data.noHal.value : this.noHal,
      nmSurat: data.nmSurat.present ? data.nmSurat.value : this.nmSurat,
      jmlAyat: data.jmlAyat.present ? data.jmlAyat.value : this.jmlAyat,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PBookmarkTData(')
          ..write('noHal: $noHal, ')
          ..write('nmSurat: $nmSurat, ')
          ..write('jmlAyat: $jmlAyat, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(noHal, nmSurat, jmlAyat, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PBookmarkTData &&
          other.noHal == this.noHal &&
          other.nmSurat == this.nmSurat &&
          other.jmlAyat == this.jmlAyat &&
          other.createdAt == this.createdAt);
}

class PBookmarkTCompanion extends UpdateCompanion<PBookmarkTData> {
  final Value<int> noHal;
  final Value<String> nmSurat;
  final Value<int> jmlAyat;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const PBookmarkTCompanion({
    this.noHal = const Value.absent(),
    this.nmSurat = const Value.absent(),
    this.jmlAyat = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PBookmarkTCompanion.insert({
    required int noHal,
    required String nmSurat,
    required int jmlAyat,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : noHal = Value(noHal),
       nmSurat = Value(nmSurat),
       jmlAyat = Value(jmlAyat),
       createdAt = Value(createdAt);
  static Insertable<PBookmarkTData> custom({
    Expression<int>? noHal,
    Expression<String>? nmSurat,
    Expression<int>? jmlAyat,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (noHal != null) 'no_hal': noHal,
      if (nmSurat != null) 'nm_surat': nmSurat,
      if (jmlAyat != null) 'jml_ayat': jmlAyat,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PBookmarkTCompanion copyWith({
    Value<int>? noHal,
    Value<String>? nmSurat,
    Value<int>? jmlAyat,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return PBookmarkTCompanion(
      noHal: noHal ?? this.noHal,
      nmSurat: nmSurat ?? this.nmSurat,
      jmlAyat: jmlAyat ?? this.jmlAyat,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (noHal.present) {
      map['no_hal'] = Variable<int>(noHal.value);
    }
    if (nmSurat.present) {
      map['nm_surat'] = Variable<String>(nmSurat.value);
    }
    if (jmlAyat.present) {
      map['jml_ayat'] = Variable<int>(jmlAyat.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PBookmarkTCompanion(')
          ..write('noHal: $noHal, ')
          ..write('nmSurat: $nmSurat, ')
          ..write('jmlAyat: $jmlAyat, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PBookmarkTTable pBookmarkT = $PBookmarkTTable(this);
  late final PBookmarkDao pBookmarkDao = PBookmarkDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [pBookmarkT];
}

typedef $$PBookmarkTTableCreateCompanionBuilder =
    PBookmarkTCompanion Function({
      required int noHal,
      required String nmSurat,
      required int jmlAyat,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$PBookmarkTTableUpdateCompanionBuilder =
    PBookmarkTCompanion Function({
      Value<int> noHal,
      Value<String> nmSurat,
      Value<int> jmlAyat,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$PBookmarkTTableFilterComposer
    extends Composer<_$AppDatabase, $PBookmarkTTable> {
  $$PBookmarkTTableFilterComposer({
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

  ColumnFilters<String> get nmSurat => $composableBuilder(
    column: $table.nmSurat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get jmlAyat => $composableBuilder(
    column: $table.jmlAyat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PBookmarkTTableOrderingComposer
    extends Composer<_$AppDatabase, $PBookmarkTTable> {
  $$PBookmarkTTableOrderingComposer({
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

  ColumnOrderings<String> get nmSurat => $composableBuilder(
    column: $table.nmSurat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get jmlAyat => $composableBuilder(
    column: $table.jmlAyat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PBookmarkTTableAnnotationComposer
    extends Composer<_$AppDatabase, $PBookmarkTTable> {
  $$PBookmarkTTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get noHal =>
      $composableBuilder(column: $table.noHal, builder: (column) => column);

  GeneratedColumn<String> get nmSurat =>
      $composableBuilder(column: $table.nmSurat, builder: (column) => column);

  GeneratedColumn<int> get jmlAyat =>
      $composableBuilder(column: $table.jmlAyat, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$PBookmarkTTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PBookmarkTTable,
          PBookmarkTData,
          $$PBookmarkTTableFilterComposer,
          $$PBookmarkTTableOrderingComposer,
          $$PBookmarkTTableAnnotationComposer,
          $$PBookmarkTTableCreateCompanionBuilder,
          $$PBookmarkTTableUpdateCompanionBuilder,
          (
            PBookmarkTData,
            BaseReferences<_$AppDatabase, $PBookmarkTTable, PBookmarkTData>,
          ),
          PBookmarkTData,
          PrefetchHooks Function()
        > {
  $$PBookmarkTTableTableManager(_$AppDatabase db, $PBookmarkTTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$PBookmarkTTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$PBookmarkTTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$PBookmarkTTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> noHal = const Value.absent(),
                Value<String> nmSurat = const Value.absent(),
                Value<int> jmlAyat = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PBookmarkTCompanion(
                noHal: noHal,
                nmSurat: nmSurat,
                jmlAyat: jmlAyat,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int noHal,
                required String nmSurat,
                required int jmlAyat,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => PBookmarkTCompanion.insert(
                noHal: noHal,
                nmSurat: nmSurat,
                jmlAyat: jmlAyat,
                createdAt: createdAt,
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

typedef $$PBookmarkTTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PBookmarkTTable,
      PBookmarkTData,
      $$PBookmarkTTableFilterComposer,
      $$PBookmarkTTableOrderingComposer,
      $$PBookmarkTTableAnnotationComposer,
      $$PBookmarkTTableCreateCompanionBuilder,
      $$PBookmarkTTableUpdateCompanionBuilder,
      (
        PBookmarkTData,
        BaseReferences<_$AppDatabase, $PBookmarkTTable, PBookmarkTData>,
      ),
      PBookmarkTData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PBookmarkTTableTableManager get pBookmarkT =>
      $$PBookmarkTTableTableManager(_db, _db.pBookmarkT);
}
