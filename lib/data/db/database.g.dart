// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class Book extends DataClass implements Insertable<Book> {
  final int id;
  final String name;
  final int chapters;
  Book({@required this.id, @required this.name, @required this.chapters});
  factory Book.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Book(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      chapters:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}chapters']),
    );
  }
  factory Book.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Book(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      chapters: serializer.fromJson<int>(json['chapters']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'chapters': serializer.toJson<int>(chapters),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Book>>(bool nullToAbsent) {
    return BooksCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      chapters: chapters == null && nullToAbsent
          ? const Value.absent()
          : Value(chapters),
    ) as T;
  }

  Book copyWith({int id, String name, int chapters}) => Book(
        id: id ?? this.id,
        name: name ?? this.name,
        chapters: chapters ?? this.chapters,
      );
  @override
  String toString() {
    return (StringBuffer('Book(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('chapters: $chapters')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(
      $mrjc($mrjc($mrjc(0, id.hashCode), name.hashCode), chapters.hashCode));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Book &&
          other.id == id &&
          other.name == name &&
          other.chapters == chapters);
}

class BooksCompanion extends UpdateCompanion<Book> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> chapters;
  const BooksCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.chapters = const Value.absent(),
  });
}

class $BooksTable extends Books with TableInfo<$BooksTable, Book> {
  final GeneratedDatabase _db;
  final String _alias;
  $BooksTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false, hasAutoIncrement: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _chaptersMeta = const VerificationMeta('chapters');
  GeneratedIntColumn _chapters;
  @override
  GeneratedIntColumn get chapters => _chapters ??= _constructChapters();
  GeneratedIntColumn _constructChapters() {
    return GeneratedIntColumn(
      'chapters',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, chapters];
  @override
  $BooksTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'books';
  @override
  final String actualTableName = 'books';
  @override
  VerificationContext validateIntegrity(BooksCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.chapters.present) {
      context.handle(_chaptersMeta,
          chapters.isAcceptableValue(d.chapters.value, _chaptersMeta));
    } else if (chapters.isRequired && isInserting) {
      context.missing(_chaptersMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Book map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Book.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(BooksCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.chapters.present) {
      map['chapters'] = Variable<int, IntType>(d.chapters.value);
    }
    return map;
  }

  @override
  $BooksTable createAlias(String alias) {
    return $BooksTable(_db, alias);
  }
}

class ChapterInfo extends DataClass implements Insertable<ChapterInfo> {
  final String name;
  final int chapter;
  final int verses;
  ChapterInfo(
      {@required this.name, @required this.chapter, @required this.verses});
  factory ChapterInfo.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return ChapterInfo(
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      chapter:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}chapter']),
      verses: intType.mapFromDatabaseResponse(data['${effectivePrefix}verses']),
    );
  }
  factory ChapterInfo.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return ChapterInfo(
      name: serializer.fromJson<String>(json['name']),
      chapter: serializer.fromJson<int>(json['chapter']),
      verses: serializer.fromJson<int>(json['verses']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'name': serializer.toJson<String>(name),
      'chapter': serializer.toJson<int>(chapter),
      'verses': serializer.toJson<int>(verses),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<ChapterInfo>>(bool nullToAbsent) {
    return ChaptersCompanion(
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      chapter: chapter == null && nullToAbsent
          ? const Value.absent()
          : Value(chapter),
      verses:
          verses == null && nullToAbsent ? const Value.absent() : Value(verses),
    ) as T;
  }

  ChapterInfo copyWith({String name, int chapter, int verses}) => ChapterInfo(
        name: name ?? this.name,
        chapter: chapter ?? this.chapter,
        verses: verses ?? this.verses,
      );
  @override
  String toString() {
    return (StringBuffer('ChapterInfo(')
          ..write('name: $name, ')
          ..write('chapter: $chapter, ')
          ..write('verses: $verses')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(
      $mrjc($mrjc($mrjc(0, name.hashCode), chapter.hashCode), verses.hashCode));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is ChapterInfo &&
          other.name == name &&
          other.chapter == chapter &&
          other.verses == verses);
}

class ChaptersCompanion extends UpdateCompanion<ChapterInfo> {
  final Value<String> name;
  final Value<int> chapter;
  final Value<int> verses;
  const ChaptersCompanion({
    this.name = const Value.absent(),
    this.chapter = const Value.absent(),
    this.verses = const Value.absent(),
  });
}

class $ChaptersTable extends Chapters
    with TableInfo<$ChaptersTable, ChapterInfo> {
  final GeneratedDatabase _db;
  final String _alias;
  $ChaptersTable(this._db, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _chapterMeta = const VerificationMeta('chapter');
  GeneratedIntColumn _chapter;
  @override
  GeneratedIntColumn get chapter => _chapter ??= _constructChapter();
  GeneratedIntColumn _constructChapter() {
    return GeneratedIntColumn(
      'chapter',
      $tableName,
      false,
    );
  }

  final VerificationMeta _versesMeta = const VerificationMeta('verses');
  GeneratedIntColumn _verses;
  @override
  GeneratedIntColumn get verses => _verses ??= _constructVerses();
  GeneratedIntColumn _constructVerses() {
    return GeneratedIntColumn(
      'verses',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [name, chapter, verses];
  @override
  $ChaptersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'chapters';
  @override
  final String actualTableName = 'chapters';
  @override
  VerificationContext validateIntegrity(ChaptersCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.chapter.present) {
      context.handle(_chapterMeta,
          chapter.isAcceptableValue(d.chapter.value, _chapterMeta));
    } else if (chapter.isRequired && isInserting) {
      context.missing(_chapterMeta);
    }
    if (d.verses.present) {
      context.handle(
          _versesMeta, verses.isAcceptableValue(d.verses.value, _versesMeta));
    } else if (verses.isRequired && isInserting) {
      context.missing(_versesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  ChapterInfo map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ChapterInfo.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(ChaptersCompanion d) {
    final map = <String, Variable>{};
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.chapter.present) {
      map['chapter'] = Variable<int, IntType>(d.chapter.value);
    }
    if (d.verses.present) {
      map['verses'] = Variable<int, IntType>(d.verses.value);
    }
    return map;
  }

  @override
  $ChaptersTable createAlias(String alias) {
    return $ChaptersTable(_db, alias);
  }
}

class Question extends DataClass implements Insertable<Question> {
  final String question;
  final String answer;
  final String book;
  final int chapter;
  final int verse;
  final String type;
  Question(
      {@required this.question,
      @required this.answer,
      @required this.book,
      @required this.chapter,
      @required this.verse,
      @required this.type});
  factory Question.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return Question(
      question: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}question']),
      answer:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}answer']),
      book: stringType.mapFromDatabaseResponse(data['${effectivePrefix}book']),
      chapter:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}chapter']),
      verse: intType.mapFromDatabaseResponse(data['${effectivePrefix}verse']),
      type: stringType.mapFromDatabaseResponse(data['${effectivePrefix}type']),
    );
  }
  factory Question.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Question(
      question: serializer.fromJson<String>(json['question']),
      answer: serializer.fromJson<String>(json['answer']),
      book: serializer.fromJson<String>(json['book']),
      chapter: serializer.fromJson<int>(json['chapter']),
      verse: serializer.fromJson<int>(json['verse']),
      type: serializer.fromJson<String>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'question': serializer.toJson<String>(question),
      'answer': serializer.toJson<String>(answer),
      'book': serializer.toJson<String>(book),
      'chapter': serializer.toJson<int>(chapter),
      'verse': serializer.toJson<int>(verse),
      'type': serializer.toJson<String>(type),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Question>>(bool nullToAbsent) {
    return QuestionsCompanion(
      question: question == null && nullToAbsent
          ? const Value.absent()
          : Value(question),
      answer:
          answer == null && nullToAbsent ? const Value.absent() : Value(answer),
      book: book == null && nullToAbsent ? const Value.absent() : Value(book),
      chapter: chapter == null && nullToAbsent
          ? const Value.absent()
          : Value(chapter),
      verse:
          verse == null && nullToAbsent ? const Value.absent() : Value(verse),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
    ) as T;
  }

  Question copyWith(
          {String question,
          String answer,
          String book,
          int chapter,
          int verse,
          String type}) =>
      Question(
        question: question ?? this.question,
        answer: answer ?? this.answer,
        book: book ?? this.book,
        chapter: chapter ?? this.chapter,
        verse: verse ?? this.verse,
        type: type ?? this.type,
      );
  @override
  String toString() {
    return (StringBuffer('Question(')
          ..write('question: $question, ')
          ..write('answer: $answer, ')
          ..write('book: $book, ')
          ..write('chapter: $chapter, ')
          ..write('verse: $verse, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      $mrjc(
          $mrjc(
              $mrjc($mrjc($mrjc(0, question.hashCode), answer.hashCode),
                  book.hashCode),
              chapter.hashCode),
          verse.hashCode),
      type.hashCode));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Question &&
          other.question == question &&
          other.answer == answer &&
          other.book == book &&
          other.chapter == chapter &&
          other.verse == verse &&
          other.type == type);
}

class QuestionsCompanion extends UpdateCompanion<Question> {
  final Value<String> question;
  final Value<String> answer;
  final Value<String> book;
  final Value<int> chapter;
  final Value<int> verse;
  final Value<String> type;
  const QuestionsCompanion({
    this.question = const Value.absent(),
    this.answer = const Value.absent(),
    this.book = const Value.absent(),
    this.chapter = const Value.absent(),
    this.verse = const Value.absent(),
    this.type = const Value.absent(),
  });
}

class $QuestionsTable extends Questions
    with TableInfo<$QuestionsTable, Question> {
  final GeneratedDatabase _db;
  final String _alias;
  $QuestionsTable(this._db, [this._alias]);
  final VerificationMeta _questionMeta = const VerificationMeta('question');
  GeneratedTextColumn _question;
  @override
  GeneratedTextColumn get question => _question ??= _constructQuestion();
  GeneratedTextColumn _constructQuestion() {
    return GeneratedTextColumn(
      'question',
      $tableName,
      false,
    );
  }

  final VerificationMeta _answerMeta = const VerificationMeta('answer');
  GeneratedTextColumn _answer;
  @override
  GeneratedTextColumn get answer => _answer ??= _constructAnswer();
  GeneratedTextColumn _constructAnswer() {
    return GeneratedTextColumn(
      'answer',
      $tableName,
      false,
    );
  }

  final VerificationMeta _bookMeta = const VerificationMeta('book');
  GeneratedTextColumn _book;
  @override
  GeneratedTextColumn get book => _book ??= _constructBook();
  GeneratedTextColumn _constructBook() {
    return GeneratedTextColumn(
      'book',
      $tableName,
      false,
    );
  }

  final VerificationMeta _chapterMeta = const VerificationMeta('chapter');
  GeneratedIntColumn _chapter;
  @override
  GeneratedIntColumn get chapter => _chapter ??= _constructChapter();
  GeneratedIntColumn _constructChapter() {
    return GeneratedIntColumn(
      'chapter',
      $tableName,
      false,
    );
  }

  final VerificationMeta _verseMeta = const VerificationMeta('verse');
  GeneratedIntColumn _verse;
  @override
  GeneratedIntColumn get verse => _verse ??= _constructVerse();
  GeneratedIntColumn _constructVerse() {
    return GeneratedIntColumn(
      'verse',
      $tableName,
      false,
    );
  }

  final VerificationMeta _typeMeta = const VerificationMeta('type');
  GeneratedTextColumn _type;
  @override
  GeneratedTextColumn get type => _type ??= _constructType();
  GeneratedTextColumn _constructType() {
    return GeneratedTextColumn(
      'type',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [question, answer, book, chapter, verse, type];
  @override
  $QuestionsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'questions';
  @override
  final String actualTableName = 'questions';
  @override
  VerificationContext validateIntegrity(QuestionsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.question.present) {
      context.handle(_questionMeta,
          question.isAcceptableValue(d.question.value, _questionMeta));
    } else if (question.isRequired && isInserting) {
      context.missing(_questionMeta);
    }
    if (d.answer.present) {
      context.handle(
          _answerMeta, answer.isAcceptableValue(d.answer.value, _answerMeta));
    } else if (answer.isRequired && isInserting) {
      context.missing(_answerMeta);
    }
    if (d.book.present) {
      context.handle(
          _bookMeta, book.isAcceptableValue(d.book.value, _bookMeta));
    } else if (book.isRequired && isInserting) {
      context.missing(_bookMeta);
    }
    if (d.chapter.present) {
      context.handle(_chapterMeta,
          chapter.isAcceptableValue(d.chapter.value, _chapterMeta));
    } else if (chapter.isRequired && isInserting) {
      context.missing(_chapterMeta);
    }
    if (d.verse.present) {
      context.handle(
          _verseMeta, verse.isAcceptableValue(d.verse.value, _verseMeta));
    } else if (verse.isRequired && isInserting) {
      context.missing(_verseMeta);
    }
    if (d.type.present) {
      context.handle(
          _typeMeta, type.isAcceptableValue(d.type.value, _typeMeta));
    } else if (type.isRequired && isInserting) {
      context.missing(_typeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Question map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Question.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(QuestionsCompanion d) {
    final map = <String, Variable>{};
    if (d.question.present) {
      map['question'] = Variable<String, StringType>(d.question.value);
    }
    if (d.answer.present) {
      map['answer'] = Variable<String, StringType>(d.answer.value);
    }
    if (d.book.present) {
      map['book'] = Variable<String, StringType>(d.book.value);
    }
    if (d.chapter.present) {
      map['chapter'] = Variable<int, IntType>(d.chapter.value);
    }
    if (d.verse.present) {
      map['verse'] = Variable<int, IntType>(d.verse.value);
    }
    if (d.type.present) {
      map['type'] = Variable<String, StringType>(d.type.value);
    }
    return map;
  }

  @override
  $QuestionsTable createAlias(String alias) {
    return $QuestionsTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $BooksTable _books;
  $BooksTable get books => _books ??= $BooksTable(this);
  $ChaptersTable _chapters;
  $ChaptersTable get chapters => _chapters ??= $ChaptersTable(this);
  $QuestionsTable _questions;
  $QuestionsTable get questions => _questions ??= $QuestionsTable(this);
  @override
  List<TableInfo> get allTables => [books, chapters, questions];
}
