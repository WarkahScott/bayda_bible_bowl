import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DropdownSection extends StatefulWidget with ChangeNotifier{

  final _DropdownSectionState _state = _DropdownSectionState();

  List<String> get value => _state.reference;
  void notify() => notifyListeners();

  @override
  _DropdownSectionState createState() => _state;
}

class _DropdownSectionState extends State<DropdownSection> {

  String _book;
  String _chapter;
  String _verse;

  List<String> get reference => <String>[_book, _chapter, _verse];
  List<String> sample = ["Sample 1", "Sample 2","Sample 3","Sample 4"];

  _update(int field, String value){
    setState(() {
      switch(field){
        case 0: _book = value; break;
        case 1: _chapter = value; break;
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
          new DropdownButton<String>(
              hint: Text("Book"),
              value: _book,
              items: sample.map((String value) {
                return new DropdownMenuItem <String>(
                    value: value,
                    child: new FittedBox(
                      child: new Text(value, overflow: TextOverflow.ellipsis,),)
                );
              }).toList(),
              onChanged: (value) => _update(0, value)
          ),
          new DropdownButton<String>(
              hint: Text("Chapter"),
              value: _chapter,
              items: sample.map((String value) {
                return new DropdownMenuItem <String>(
                    value: value,
                    child: new Text(value, overflow: TextOverflow.ellipsis,)
                );
              }).toList(),
              onChanged: (value) => _update(1, value)
          ),
          new DropdownButton<String>(
              hint: Text("Verse"),
              value: _verse,
              items: sample.map((String value) {
                return new DropdownMenuItem <String>(
                    value: value,
                    child: new Text(value, overflow: TextOverflow.ellipsis,)
                );
              }).toList(),
              onChanged: (value) => _update(2, value)
          ),
        ]
    );
  }
}