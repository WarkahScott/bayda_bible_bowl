import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../answer_section.dart';

// ignore: must_be_immutable
class AnswerTF extends StatefulWidget{

  _AnswerTFState _state = _AnswerTFState();

  String get value => _state._value;

  @override
  State<StatefulWidget> createState() => _state;
}

class _AnswerTFState extends State<AnswerTF> {
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
    final _state = Provider.of<AnswerSectionState>(context);
    _state.subState = widget;

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