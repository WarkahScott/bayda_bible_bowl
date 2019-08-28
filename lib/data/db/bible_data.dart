enum Books{
  Genesis, Exodus, Leviticus, Numbers, Deuteronomy,
  Joshua, Judges, Ruth, Samuel1, Samuel2, Kings1,
  Kings2, Chronicles1, Chronicles2, Ezra, Nehemiah,
  Esther, Job, Psalms, Proverbs, Ecclesiastes,
  SongOfSolomon, Isaiah, Jeremiah, Lamentations,
  Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah,
  Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah,
  Malachi, Matthew, Mark, Luke, John, Acts, Romans,
  Corinthians1, Corinthians2, Galatians, Ephesians,
  Philippians, Colossians, Thessalonians1,
  Thessalonians2, Timothy1, Timothy2, Titus, Philemon,
  Hebrews, James, Peter1, Peter2, John1, John2, John3,
  Jude, Revelation
}

const Map<Books, Book> BIBLE = {
  Books.Genesis : const Book("Genesis", 50, []),
  Books.Exodus : const Book("Exodus", 40, []),
  Books.Leviticus : const Book("Leviticus", 27, []),
  Books.Numbers : const Book("Numbers", 36, []),
  Books.Deuteronomy : const Book("Deuteronomy", 34, []),
  Books.Joshua : const Book("Joshua", 24, []),
  Books.Judges : const Book("Judges", 21, []),
  Books.Ruth : const Book("Ruth", 4, []),
  Books.Samuel1 : const Book("1 Samuel", 31, []),
  Books.Samuel2 : const Book("2 Samuel", 24, []),
  Books.Kings1 : const Book("1 Kings", 22, []),
  Books.Kings2 : const Book("2 Kings", 25, []),
  Books.Chronicles1 : const Book("1 Chronicles", 39, []),
  Books.Chronicles2 : const Book("2 Chronicles", 36, []),
  Books.Ezra : const Book("Ezra", 10, []),
  Books.Nehemiah : const Book("Nehemiah", 13, []),
  Books.Esther : const Book("Esther", 10, []),
  Books.Job : const Book("Job", 42, []),
  Books.Psalms : const Book("Psalms", 150, []),
  Books.Proverbs : const Book("Proverbs", 31, []),
  Books.Ecclesiastes : const Book("Ecclesiastes", 12, []),
  Books.SongOfSolomon : const Book("Song Of Solomon", 8, []),
  Books.Isaiah : const Book("Isaiah", 66, []),
  Books.Jeremiah  : const Book("Jeremiah", 52, []),
  Books.Lamentations : const Book("Lamentations", 5, []),
  Books.Ezekiel : const Book("Ezekiel", 48, []),
  Books.Daniel : const Book("Daniel", 12, []),
  Books.Hosea : const Book("Hosea", 14, []),
  Books.Joel : const Book("Joel", 3, []),
  Books.Amos : const Book("Amos", 9, []),
  Books.Obadiah : const Book("Obadiah", 1, []),
  Books.Jonah : const Book("Jonah", 4, []),
  Books.Micah : const Book("Micah", 7, []),
  Books.Nahum : const Book("Nahum", 3, []),
  Books.Habakkuk : const Book("Habakkuk", 3, []),
  Books.Zephaniah : const Book("Zephaniah", 3, []),
  Books.Haggai : const Book("Haggai", 2, []),
  Books.Zechariah : const Book("Zechariah", 14, []),
  Books.Malachi : const Book("Malachi", 4, []),
  Books.Matthew : const Book("Matthew", 28, []),
  Books.Mark : const Book("Mark", 16, []),
  Books.Luke : const Book("Luke", 24, []),
  Books.John : const Book("John", 21, []),
  Books.Acts : const Book("Acts", 28, []),
  Books.Romans : const Book("Romans", 16, []),
  Books.Corinthians1 : const Book("Corinthians1", 16, []),
  Books.Corinthians2 : const Book("Corinthians2", 13, []),
  Books.Galatians : const Book("Galatians", 6, []),
  Books.Ephesians : const Book("Ephesians", 6, []),
  Books.Philippians : const Book("Philippians", 4, []),
  Books.Colossians : const Book("Colossians", 4, []),
  Books.Thessalonians1 : const Book("1 Thessalonians", 5, []),
  Books.Thessalonians2 : const Book("2 Thessalonians", 3, []),
  Books.Timothy1 : const Book("1 Timothy", 6, []),
  Books.Timothy2 : const Book("2 Timothy", 4, []),
  Books.Titus : const Book("Titus", 3, []),
  Books.Philemon : const Book("Philemon", 1, []),
  Books.Hebrews : const Book("Hebrews", 13, []),
  Books.James : const Book("James", 5, []),
  Books.Peter1 : const Book("1 Peter", 5, []),
  Books.Peter2 : const Book("2 Peter", 3, []),
  Books.John1 : const Book("1 John", 5, []),
  Books.John2 : const Book("2 John", 1, []),
  Books.John3 : const Book("3 John", 1, []),
  Books.Jude : const Book("Jude", 1, []),
  Books.Revelation : const Book("Revelation", 22, []),
};

bool isDigit(String s, int idx) => (s.codeUnitAt(idx) ^ 0x30) <= 9;

class Book{
  const Book(this.book, this.chapters, this.verses);

  final String book;
  final int chapters;
  final List<int> verses;
  String get abbreviation =>
      (isDigit(book, 0)) ? "${book[0]}${book.substring(2, 4)}" : book.substring(0, 3);
}

class Bible{
  static Map<String, Book> bookMap = Map.fromIterables(BIBLE.values.map((book) => book.book), BIBLE.values);
}