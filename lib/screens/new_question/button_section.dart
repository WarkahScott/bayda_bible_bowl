import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'answer_section.dart';
import 'dropdown_section.dart';
import 'question_section.dart';
import 'radio_section.dart';

class ButtonSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final _radio = Provider.of<RadioSection>(context);
    final _answer = Provider.of<AnswerSection>(context);
    final _dropdown = Provider.of<DropdownSection>(context);
    final _question = Provider.of<QuestionSection>(context);

    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FlatButton(
            color: Colors.blueAccent,
            child: Text("Submit"),
            onPressed: () => {print("type: ${_radio.value}   Q: ${_question.value}   A: ${_answer.value}    ref: ${_dropdown.value}")},
          )
        ]
    );
  }
}