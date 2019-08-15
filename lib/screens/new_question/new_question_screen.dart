import 'package:bayda_bible_bowl/utils/menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'answer_section.dart';
import 'dropdown_section.dart';
import 'radio_section.dart';

class NewQuestion extends StatefulWidget {
  @override
  _NewQuestionState createState() => _NewQuestionState();
}

class _NewQuestionState extends State<NewQuestion> {

  RadioSection _radio = RadioSection();
  QuestionSection _question = QuestionSection();
  AnswerSection _answer = AnswerSection();
  DropdownSection _dropdown = DropdownSection();
  ButtonSection _button = ButtonSection();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Question'),
      ),
      drawer: Menu(),
      body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _radio,
              _question,
              ChangeNotifierProvider(
                  builder:(context) => _radio,
                  child: _answer,
              ),
              _dropdown,
              _button
            ],
          )
      ),
    );
  }
}

class ButtonSection extends Row {
  ButtonSection() : super(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FlatButton(
          color: Colors.blueAccent,
          child: Text("Submit"),
          onPressed: () => {print("tst")},
        )
      ]
  );
}

class QuestionSection extends Row {
  QuestionSection() : super(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Expanded(
        child: Card(
          margin: EdgeInsets.all(30),
          child: Center(
            child: Text("Question"),
          )
        ),
      ),
    ],
  );
}

