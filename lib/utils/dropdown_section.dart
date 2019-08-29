import 'package:flutter/material.dart';

import '../data/db/bible_data.dart';
import 'custom_dropdown_button.dart';

// ignore: must_be_immutable
class DropdownSection extends StatefulWidget with ChangeNotifier{

  final _DropdownSectionState _state = _DropdownSectionState();
  List<String> get value => _state.reference;
  void notify() => notifyListeners();

  @override
  _DropdownSectionState createState() => _state;
}

class _DropdownSectionState extends State<DropdownSection> {

  String _book = "Genesis";
  String _chapter = "1";
  String _verse = "1";

  List<String> get reference => <String>[_book, _chapter, _verse];
  List<String> sample = ["Sample 1", "Sample 2","Sample 3","Sample 4"];
  Map<String, Book> books = Bible.bookMap;
  List<int> chapters = [1];
  List<int> verses = [1];

  _update(int field, String value){
    setState(() {
      switch(field){
        case 0: _book = value; _chapter = "1"; _verse = "1";
          chapters = new List<int>.generate(books[_book].chapters, (i) => i + 1);
          break;
        case 1: _chapter = value; _verse = "1";
          break;
        case 2: _verse = value; break;
      }
      widget.notify();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 3,
            child: new CustomDropdownButton<String>(
                hint: Text("Book"),
                value: _book,
                items: books.keys.map((value) {
                  return new DropdownMenuItem <String>(
                      value: value,
                      child: new FittedBox(
                        child: new Text(value, overflow: TextOverflow.ellipsis,),)
                  );
                }).toList(),
                onChanged: (value) => _update(0, value)
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 8,
            child: new CustomDropdownButton<String>(
                hint: Text("Chapter"),
                value: _chapter,
                items: chapters.map((value) {
                  return new DropdownMenuItem <String>(
                      value: value.toString(),
                      child: new Text(value.toString(), overflow: TextOverflow.ellipsis,)
                  );
                }).toList(),
                onChanged: (value) => _update(1, value)
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 8,
            child: new CustomDropdownButton<String>(
                hint: Text("Verse"),
                value: _verse,
                items: verses.map((value) {
                  return new DropdownMenuItem <String>(
                      value: value.toString(),
                      child: new Text(value.toString(), overflow: TextOverflow.ellipsis,)
                  );
                }).toList(),
                onChanged: (value) => _update(2, value)
            ),
          ),
        ]
    );
  }
}