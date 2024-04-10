import 'package:drift/drift.dart';

class AddTask extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text().withLength(max: 250)();
  IntColumn get category_id => integer()();
  DateTimeColumn get data_date => dateTime()();
  IntColumn get amount => integer()();

  DateTimeColumn get created_at => dateTime()();
  DateTimeColumn get updated_at => dateTime()();
  DateTimeColumn get deleted_at => dateTime().nullable()();
}