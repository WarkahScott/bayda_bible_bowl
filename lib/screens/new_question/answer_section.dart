import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dropdown_section.dart';
import 'radio_section.dart';

class AnswerSection extends StatefulWidget{
  final _state = _AnswerSectionState();

  String get value => _state.value;

  @override
  State<StatefulWidget> createState() => _state;
}

class _AnswerSectionState extends State<AnswerSection> {

  Widget _subState;

  String get value
  {
    if(_subState is _AnswerTF)
      return (_subState as _AnswerTF).value;
    if(_subState is _AnswerREF)
      return (_subState as _AnswerREF).value;
    return "Invalid";
  }

  @override
  Widget build(BuildContext context) {
    var radio = Provider.of<RadioSection>(context);

    switch (radio.value) {
      case "Q/A":
        return _AnswerQA();
      case "FTV":
        return _AnswerFTV();
      case "FIB":
        return _AnswerFIB();
      case "T/F":
        return Provider<_AnswerSectionState>.value(
          value: this,
          child: _AnswerTF(),
        );
      case "REF":
        return Provider<_AnswerSectionState>.value(
          value: this,
          child: _AnswerREF(),
        );
      default:
        return Text("Invalid");
    }
  }
}

class _AnswerQA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                  child: Container(
                    alignment: Alignment(0, 0),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 5,
                    child: Text("QA answer"),
                  )
              )
          ),
        ),
      ],
    );
  }
}

class _AnswerFTV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                  child: Container(
                    alignment: Alignment(0, 0),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 5,
                    child: Text("FTV answer"),
                  )
              )
          ),
        ),
      ],
    );
  }
}

class _AnswerFIB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Container(
                  alignment: Alignment(0, 0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 5,
                  child: Text("FIB Section"),
                )
              )
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class _AnswerTF extends StatefulWidget{

   _AnswerTFState _state = _AnswerTFState();

  String get value => _state._value;

  @override
  State<StatefulWidget> createState() => _state;
}

class _AnswerTFState extends State<_AnswerTF> {
  String _value = "True";
  bool _status = true;

  _switch(bool value) {
    setState(() {
      widget._state = this;
      _status = value;
      _value = _status ? "True" : "False";
    });
  }


  @override
  Widget build(BuildContext context) {
    final _state = Provider.of<_AnswerSectionState>(context);
    _state._subState = widget;

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: Card(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio<bool>(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          value: true,
                          groupValue: _status,
                          onChanged: (value) => _switch(value)),
                      Text('True', textAlign: TextAlign.left),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 30.0)),
                      Radio<bool>(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          value: false,
                          groupValue: _status,
                          onChanged: (value) => _switch(value)),
                      Text('False', textAlign: TextAlign.left),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
                    ],
                  )
              )
          ),
        ),
      ],
    );
  }
}

class _AnswerREF extends StatefulWidget {

  final _AnswerREFState _state = _AnswerREFState();

  String get value => _state._value;

  @override
  State<StatefulWidget> createState() => _state;
}

class _AnswerREFState extends State<_AnswerREF> {
  String _value;

  String _book;
  String _chapter;
  String _verse;

  @override
  Widget build(BuildContext context) {

    final dropdown = Provider.of<DropdownSection>(context);
    var _state = Provider.of<_AnswerSectionState>(context);
    _state._subState = widget;

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

