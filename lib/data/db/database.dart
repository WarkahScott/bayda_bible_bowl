import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';

@DataClassName("Question")
class Questions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get question => text()();
  TextColumn get answer => text()();
  TextColumn get book => text()();
  IntColumn get chapter => integer()();
  IntColumn get verse => integer()();
  TextColumn get type => text()();
}

@UseMoor(tables: [Questions], daos: [QuestionDao])
class Database extends _$Database{
  Database() : super(FlutterQueryExecutor.inDatabaseFolder(
      path: 'db.sqlite',
      logStatements: true,
    )
  );

  @override
  int get schemaVersion => 5;
}

@UseDao(tables: [Questions])
class QuestionDao extends DatabaseAccessor<Database> with _$QuestionDaoMixin{
  final Database db;

  QuestionDao(this.db) : super(db);

  Future<List<Question>> getAllQuestions() => select(questions).get();
  Stream<List<Question>> watchAllQuestions() => select(questions).watch();
  Stream<List<Question>> watchFilteredQuestions(String book, String chapter){
    return (
      select(questions)
      ..where((question){
        final b = question.book.equals(book);
        final c = question.chapter.equals(int.parse(chapter));
        return and(b, c);
      })).watch();
  }
  Future insertQuestion(Insertable<Question> question) => into(questions).insert(question);
  Future deleteQuestion(Insertable<Question> question) => delete(questions).delete(question);

}