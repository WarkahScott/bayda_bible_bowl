import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../answer_section.dart';
import '../question_section.dart';

// ignore: must_be_immutable
class AnswerFTV extends StatefulWidget{

  _AnswerFTVState _state = _AnswerFTVState();

  String get value => _state._value;

  @override
  State<StatefulWidget> createState() => _state;
}

class _AnswerFTVState extends State<AnswerFTV> {
  String _value;

  @override
  Widget build(BuildContext context) {
    final _state = Provider.of<AnswerSectionState>(context);
    final _question = Provider.of<QuestionSection>(context);

    _state.subState = widget;

    String _extractBlank(String value){
      String ans = "";
      RegExp pattern = RegExp("[(][^)]*[)]");
      RegExpMatch match = pattern.firstMatch(value);
      if(match == null)
        return "";

      ans = value.substring(match.start + 1, match.end -1);
      return ans;
    }

    _value = _extractBlank(_question.value);

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
                      controller: TextEditingController()..text = _value,
                      readOnly: true,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Surround (blank) with parentheses.",
                      ),
                    ),
                  )
              )
          ),
        ),
      ],
    );
  }
}