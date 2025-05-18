import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ssg_app/data/tables/app_tables.dart';
import 'package:path/path.dart' as p;
import 'package:ssg_app/data/dao/p_bookmark_dao.dart';

part 'app_database.g.dart';

LazyDatabase _openAppDatabase() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app.db'));
    return NativeDatabase(file, logStatements: true);
  });
}

@DriftDatabase(
  tables: [PBookmarkT],
  daos: [PBookmarkDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openAppDatabase());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) => m.createAll(),
  );
}