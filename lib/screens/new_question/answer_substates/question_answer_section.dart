import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../answer_section.dart';

// ignore: must_be_immutable
class AnswerQA extends StatefulWidget{

  _AnswerQAState _state = _AnswerQAState();

  String get value => _state._value;

  @override
  State<StatefulWidget> createState() => _state;
}

class _AnswerQAState extends State<AnswerQA> {

  String _value;

  _update(String text){
    setState(() {
      _value = text;
      widget._state = this;
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
                  child: Container(
                    alignment: Alignment(0, 0),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 10,
                    child: TextField(
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      onChanged: (text) => _update(text),
                      decoration: null,
                    ),
                  )
              )
          ),
        ),
      ],
    );
  }
}