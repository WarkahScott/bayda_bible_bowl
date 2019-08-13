import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';

@DataClassName("Book")
class Books extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get chapters => integer()();
}

@DataClassName("ChapterInfo")
class Chapters extends Table {
  TextColumn get name => text()();
  IntColumn get chapter => integer()();
  IntColumn get verses => integer()();
}

@DataClassName("Question")
class Questions extends Table {
  TextColumn get question => text()();
  TextColumn get answer => text()();
  TextColumn get book => text()();
  IntColumn get chapter => integer()();
  IntColumn get verse => integer()();
  TextColumn get type => text()();
}

@UseMoor(tables: [Books, Chapters, Questions])
class Database extends _$Database{
  Database() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite'));

  @override
  int get schemaVersion => 2;
}