import 'package:drift/drift.dart';

class PBookmarkT extends Table {
  IntColumn get noHal => integer().unique()();
  TextColumn get nmSurat => text()();
  IntColumn get jmlAyat => integer()();
  DateTimeColumn get createdAt => dateTime()();
}
