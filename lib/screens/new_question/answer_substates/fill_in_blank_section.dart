import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../answer_section.dart';
import '../question_section.dart';

// ignore: must_be_immutable
class AnswerFIB extends StatefulWidget{

  _AnswerFIBState _state = _AnswerFIBState();

  String get value => _state._value;

  @override
  State<StatefulWidget> createState() => _state;
}

class _AnswerFIBState extends State<AnswerFIB> {
  String _value;

  @override
  Widget build(BuildContext context) {
    final _state = Provider.of<AnswerSectionState>(context);
    final _question = Provider.of<QuestionSection>(context);

    _state.subState = widget;
    _value = _question.value;

    String _extractBlanks(){
      String ans = "";
      RegExp pattern = RegExp("[(][^)]*[)]");
      Iterable<RegExpMatch> matches = pattern.allMatches(_value);

      if(matches == null || matches.isEmpty)
        return "";

      for(RegExpMatch r in matches)
      {
        String match = _value.substring(r.start + 1, r.end - 1);
        ans = "$ans $match,";
      }

      return ans.substring(0, ans.length - 1);
    }

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
                    height: MediaQuery.of(context).size.height / 5,
                    child: Text(_extractBlanks()),
                  )
              )
          ),
        ),
      ],
    );
  }
}