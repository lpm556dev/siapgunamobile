import 'package:drift/drift.dart';
import 'package:ssg_app/data/local/quran_database.dart';

part 'surat_dao.g.dart';

@DriftAccessor(tables: [MSuratT])
class SuratDao extends DatabaseAccessor<QuranDatabase> with _$SuratDaoMixin {
  SuratDao(QuranDatabase db) : super(db);

  /// Semua ayat dalam satu surat
  Future<List<MSuratTData>> getSurat(int noSurat) =>
      (select(db.mSuratT)
            ..where((t) => t.noSurat.equals(noSurat))
            ..orderBy([(t) => OrderingTerm(expression: t.noAyat)]))
          .get();

  /// Pencarian teks arab (LIKE simple)
  Future<List<MSuratTData>> searchArabic(String word) =>
      (select(db.mSuratT)..where((t) => t.arab.like('%$word%'))).get();

  Future<List<MHalTData>> getHalaman(int noHal) =>
      (select(db.mHalT)
            ..where((t) => t.noHal.equals(noHal))
            ..orderBy([(t) => OrderingTerm(expression: t.noHal)]))
          .get();

  Future<List<MQuranTData>> getAllSurah() => 
      (select(db.mQuranT)
        ..orderBy([(t) => OrderingTerm(expression: t.noSurat)]))
      .get();

    Future<List<MQuranTData>> fetchKeteranganSurah(int noSurat) {
    final query = customSelect(
      '''
      SELECT q.*
      FROM m_surat_t AS s
      JOIN m_quran_t AS q
        ON q.no_surat = s.no_surat
      WHERE s.no_surat = ?
      ''',
      variables: [Variable<int>(noSurat)],
      readsFrom: {db.mSuratT, db.mQuranT},
    );

    return query.asyncMap(db.mQuranT.mapFromRow).get();
  }
}
