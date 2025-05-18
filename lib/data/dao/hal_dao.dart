import 'package:drift/drift.dart';
import 'package:ssg_app/data/local/quran_database.dart';
import 'package:tuple/tuple.dart';

part 'hal_dao.g.dart';

@DriftAccessor(tables: [MHalT, MQuranT, MSuratT])
class HalDao extends DatabaseAccessor<QuranDatabase> with _$HalDaoMixin {
  HalDao(QuranDatabase db) : super(db);

  Future<List<MQuranTData>> fetchKeteranganHal(int noHal) {
    final query = customSelect(
      '''
      SELECT q.*
      FROM m_hal_t AS h
      JOIN m_quran_t AS q
        ON (q.no_surat BETWEEN h.no_surat1 AND h.no_surat2)
      WHERE h.no_hal = ?
      ''',
      variables: [Variable<int>(noHal)],
      readsFrom: {db.mHalT, db.mQuranT},
    );

    return query.asyncMap(db.mQuranT.mapFromRow).get();
  }

  Future<List<Tuple3<MQuranTData, MHalTData, MSuratTData>>> fetchUniquePerHalaman() async {
    final query = customSelect(
      '''
      SELECT q.*, h.*, s.*
      FROM m_hal_t h
      JOIN m_quran_t q ON q.no_surat BETWEEN h.no_surat1 AND h.no_surat2
      JOIN m_surat_t s ON s.no_surat = q.no_surat
      ORDER BY h.no_hal
      ''',
      readsFrom: {db.mQuranT, db.mHalT, db.mSuratT},
    );

    final rows = await query.get();
    final List<Tuple3<MQuranTData, MHalTData, MSuratTData>> result = [];
    final seen = <int>{};

    for (final row in rows) {
      final q = await db.mQuranT.mapFromRow(row);
      final h = await db.mHalT.mapFromRow(row);
      final s = await db.mSuratT.mapFromRow(row);

      if (h.noHal != null && !seen.contains(h.noHal)) {
        result.add(Tuple3(q, h, s));
        seen.add(h.noHal!);
      }
    }

    return result;
  }



  Future<List<MSuratTData>> fetchHalaman(int noHal) {
    final query = customSelect(
      '''
      SELECT * FROM m_surat_t WHERE no_hal = ?
      ''',
      variables: [Variable<int>(noHal)],
      readsFrom: {db.mHalT, db.mSuratT},
    );
    return query.asyncMap(db.mSuratT.mapFromRow).get();
  }

  Future<List<String>> pageBlocksAsText(int noHal) async {
    final List<MSuratTData> rows = await fetchHalaman(
      noHal,
    );

    final List<String> blocks = [];
    List<String> current = [];

    for (final a in rows) {
      if (a.noAyat == 1 && current.isNotEmpty) {
        blocks.add(current.join(' '));
        current = [];
      }
      current.add('${a.arab!.trim()} ◌ ');
    }
    if (current.isNotEmpty) blocks.add(current.join(' '));

    if (rows[0].noAyat == 1) blocks.add('begin in first ayat');

    return blocks;
  }
}
