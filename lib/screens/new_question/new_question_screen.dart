import 'package:bayda_bible_bowl/utils/menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'answer_section.dart';
import 'dropdown_section.dart';
import 'question_section.dart';
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
              MultiProvider(
                providers: [
                  ChangeNotifierProvider.value(value: _radio),
                  ChangeNotifierProvider.value(value: _dropdown),
                ],
                child: _answer,
              ),
              _dropdown,
              MultiProvider(
                providers: [
                  ListenableProvider.value(value: _radio),
                  Provider.value(value: _answer),
                  ListenableProvider.value(value: _dropdown),
                ],
                child: _button,
              ),
            ],
          )
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final _radio = Provider.of<RadioSection>(context);
    final _answer = Provider.of<AnswerSection>(context);
    final _dropdown = Provider.of<DropdownSection>(context);

    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FlatButton(
            color: Colors.blueAccent,
            child: Text("Submit"),
            onPressed: () => {print("type: ${_radio.value}   ans: ${_answer.value}    ref: ${_dropdown.value}")},
          )
        ]
    );
  }
}

