import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DropdownSection extends StatefulWidget {
  List<String> _reference;

  @override
  _DropdownSectionState createState(){
    _DropdownSectionState state = _DropdownSectionState();
    _reference = state.reference;
    return state;
  }

  List<String> get reference => _reference;
}

class _DropdownSectionState extends State<DropdownSection> {

  String _book;
  String _chapter;
  String _verse;

  List<String> get reference => <String>[_book, _chapter, _verse];
  List<String> sample = ["Sample 1", "Sample 2","Sample 3","Sample 4"];

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
              onChanged: (value) => setState(() {_book = value; widget._reference = reference;})
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
              onChanged: (value) => setState(() {_chapter = value; widget._reference = reference;})
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
              onChanged: (value) => setState(() {_verse = value; widget._reference = reference;})
          ),
        ]
    );
  }
}