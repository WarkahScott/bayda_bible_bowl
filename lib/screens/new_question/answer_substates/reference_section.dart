import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../answer_section.dart';
import '../dropdown_section.dart';

class AnswerREF extends StatefulWidget {

  final _AnswerREFState _state = _AnswerREFState();

  String get value => _state._value;

  @override
  State<StatefulWidget> createState() => _state;
}

class _AnswerREFState extends State<AnswerREF> {
  String _value;

  String _book;
  String _chapter;
  String _verse;

  @override
  Widget build(BuildContext context) {

    final dropdown = Provider.of<DropdownSection>(context);
    var _state = Provider.of<AnswerSectionState>(context);
    _state.subState = widget;

    List<String> _reference = dropdown.value;
    _book = (_reference[0] ?? "null").substring(0, 3);
    _chapter = _reference[1] ?? "null";
    _verse = _reference[2] ?? "null";
    _value = "$_book. $_chapter: $_verse";

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: Card(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Center(
                child: Text(_value),
              )
          ),
        ),
      ],
    );
  }
}