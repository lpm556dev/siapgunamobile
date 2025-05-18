import 'package:drift/drift.dart';
import '../local/app_database.dart';
import 'package:ssg_app/data/tables/app_tables.dart';

part 'p_bookmark_dao.g.dart';

@DriftAccessor(tables: [PBookmarkT])
class PBookmarkDao extends DatabaseAccessor<AppDatabase>
    with _$PBookmarkDaoMixin {
  PBookmarkDao(AppDatabase db) : super(db);

  Future<List<PBookmarkTData>> getAll() =>
      (select(db.pBookmarkT)
        ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])).get();

  Future<PBookmarkTData?> getByPage(int page) async {
    final query = customSelect(
      '''
      SELECT bm.* FROM p_bookmark_t as bm WHERE bm.no_hal = ? ;
      ''',
      variables: [Variable<int>(page)],
      readsFrom: {db.pBookmarkT},
    );
    return await query.map(db.pBookmarkT.mapFromRow).getSingleOrNull();
  }

  Future<PBookmarkTData?> getCurrent() =>
      (select(db.pBookmarkT)
            ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])
            ..limit(1))
          .getSingleOrNull();

  Future<int> addNew(PBookmarkTCompanion entry) => into(db.pBookmarkT).insert(entry);

  Future<int> removeByPage(int page) async {
    final result =
        await (delete(db.pBookmarkT)
          ..where((tbl) => tbl.noHal.equals(page))).go();
    return result;
  }
}
