import 'package:bayda_bible_bowl/data/db/database.dart';
import 'package:flutter/material.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:provider/provider.dart';

import '../../utils/dropdown_section.dart';
import 'answer_section.dart';
import 'question_section.dart';
import 'toggle_section.dart';

class ButtonSection extends StatelessWidget {

  bool _isValid(QuestionsCompanion question){
    bool q = question.question.value != null && question.question.value != "";
    bool a = question.answer.value != null && question.answer.value != "";

    return q && a;
  }

  @override
  Widget build(BuildContext context) {

    //final _radio = Provider.of<RadioSection>(context);
    final _toggle = Provider.of<ToggleSection>(context);
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
            onPressed: () {
              final db = Provider.of<QuestionDao>(context);
              final question = QuestionsCompanion(
                question: Value(_question.value),
                answer: Value(_answer.value),
                book: Value(_dropdown.value[0]),
                chapter: Value(int.parse(_dropdown.value[1])),
                verse: Value(int.parse(_dropdown.value[2])),
                //type: Value(_radio.value)
                type: Value(_toggle.value)
              );

              if(_isValid(question)){
                db.insertQuestion(question);
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Question added."),
                    duration: Duration(seconds: 1),
                  )
                );
              }
              else
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Question not added."),
                    duration: Duration(seconds: 1),
                  )
                );
            },
          )
        ]
    );
  }
}