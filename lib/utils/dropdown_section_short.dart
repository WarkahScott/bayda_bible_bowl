import 'package:flutter/material.dart';

import '../data/db/bible_data.dart';
import 'custom_dropdown_button.dart';

// ignore: must_be_immutable
class DropdownSectionShort extends StatefulWidget with ChangeNotifier{

  final _DropdownSectionShortState _state = _DropdownSectionShortState();
  List<String> get value => _state.reference;
  void notify() => notifyListeners();

  @override
  _DropdownSectionShortState createState() => _state;
}

class _DropdownSectionShortState extends State<DropdownSectionShort> {

  String _book = "Genesis";
  String _chapter = "1";

  List<String> get reference => <String>[_book, _chapter];
  Map<String, Book> books = Bible.bookFilter;
  List<int> chapters = new List<int>.generate(Bible.bookFilter["Genesis"].chapters, (i) => i + 1);

  _update(int field, String value){
    setState(() {
      switch(field){
        case 0: if(value != "(ALL)"){
            _book = value;
            _chapter = "1";
            chapters = new List<int>.generate(books[_book].chapters, (i) => i + 1);
          }
          else{
            _book = "(ALL)";
            _chapter = "(ALL)";
            chapters = new List<int>();
          }
        break;
        case 1: _chapter = value;
        break;
      }
      widget.notify();
    });
  }

  _checkChapters(){
    if(chapters.isEmpty)
      return [new DropdownMenuItem <String>(
          value: "(ALL)",
          child: new Text("-", overflow: TextOverflow.ellipsis,)
      )];

    return chapters.map((value) {
      return new DropdownMenuItem <String>(
          value: value.toString(),
          child: new Text(value.toString(), overflow: TextOverflow.ellipsis,)
      );
    }).toList();
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
                items: _checkChapters(),
                onChanged: (value) => _update(1, value)
            ),
          ),
        ]
    );
  }
}