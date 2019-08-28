// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class Question extends DataClass implements Insertable<Question> {
  final int id;
  final String question;
  final String answer;
  final String book;
  final int chapter;
  final int verse;
  final String type;
  Question(
      {@required this.id,
      @required this.question,
      @required this.answer,
      @required this.book,
      @required this.chapter,
      @required this.verse,
      @required this.type});
  factory Question.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Question(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
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
      id: serializer.fromJson<int>(json['id']),
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
      'id': serializer.toJson<int>(id),
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
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
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
          {int id,
          String question,
          String answer,
          String book,
          int chapter,
          int verse,
          String type}) =>
      Question(
        id: id ?? this.id,
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
          ..write('id: $id, ')
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
              $mrjc(
                  $mrjc($mrjc($mrjc(0, id.hashCode), question.hashCode),
                      answer.hashCode),
                  book.hashCode),
              chapter.hashCode),
          verse.hashCode),
      type.hashCode));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Question &&
          other.id == id &&
          other.question == question &&
          other.answer == answer &&
          other.book == book &&
          other.chapter == chapter &&
          other.verse == verse &&
          other.type == type);
}

class QuestionsCompanion extends UpdateCompanion<Question> {
  final Value<int> id;
  final Value<String> question;
  final Value<String> answer;
  final Value<String> book;
  final Value<int> chapter;
  final Value<int> verse;
  final Value<String> type;
  const QuestionsCompanion({
    this.id = const Value.absent(),
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
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false, hasAutoIncrement: true);
  }

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
      [id, question, answer, book, chapter, verse, type];
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
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Question map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Question.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(QuestionsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
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
  $QuestionsTable _questions;
  $QuestionsTable get questions => _questions ??= $QuestionsTable(this);
  QuestionDao _questionDao;
  QuestionDao get questionDao => _questionDao ??= QuestionDao(this as Database);
  @override
  List<TableInfo> get allTables => [questions];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$QuestionDaoMixin on DatabaseAccessor<Database> {
  $QuestionsTable get questions => db.questions;
}
