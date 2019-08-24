import 'package:bayda_bible_bowl/utils/menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../shared_widgets/dropdown_section.dart';
import 'answer_section.dart';
import 'button_section.dart';
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('New Question'),
      ),
      drawer: Menu(),
      body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _radio,
              Provider.value(
                value: _answer,
                child: _question,
              ),
              MultiProvider(
                providers: [
                  ChangeNotifierProvider.value(value: _radio),
                  ChangeNotifierProvider.value(value: _question),
                  ChangeNotifierProvider.value(value: _dropdown),
                ],
                child: _answer,
              ),
              _dropdown,
              MultiProvider(
                providers: [
                  ListenableProvider.value(value: _radio),
                  ChangeNotifierProvider.value(value: _question),
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