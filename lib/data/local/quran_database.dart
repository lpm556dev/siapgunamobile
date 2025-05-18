import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'quran_database.g.dart';

@DriftDatabase(
  include: {'../tables/quran_tables.drift'}
)
class QuranDatabase extends _$QuranDatabase {
  QuranDatabase() : super(_openQuranDatabase());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openQuranDatabase() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'quran.db'));
    if (!await file.exists()) {
      final data = await rootBundle.load('assets/databases/quran.db');
      await file.writeAsBytes(data.buffer.asUint8List());
    }
    return NativeDatabase(file, logStatements: false);
  });
}
