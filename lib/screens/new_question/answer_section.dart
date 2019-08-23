import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'answer_substates/fill_in_blank_section.dart';
import 'answer_substates/finish_the_verse_section.dart';
import 'answer_substates/question_answer_section.dart';
import 'answer_substates/reference_section.dart';
import 'answer_substates/true_false_section.dart';
import 'radio_section.dart';

class AnswerSection extends StatefulWidget{
  final _state = AnswerSectionState();

  String get value => _state.value;

  @override
  State<StatefulWidget> createState() => _state;
}

class AnswerSectionState extends State<AnswerSection> {

  Widget subState;

  String get value
  {
    if(subState is AnswerTF)
      return (subState as AnswerTF).value;
    if(subState is AnswerREF)
      return (subState as AnswerREF).value;
    if(subState is AnswerQA)
      return (subState as AnswerQA).value;
    if(subState is AnswerFIB)
      return (subState as AnswerFIB).value;
    return "Invalid";
  }

  @override
  Widget build(BuildContext context) {
    var radio = Provider.of<RadioSection>(context);

    switch (radio.value) {
      case "Q/A":
        return Provider<AnswerSectionState>.value(
          value: this,
          child: AnswerQA(),
        );
      case "FTV":
        return Provider<AnswerSectionState>.value(
          value: this,
          child: AnswerFTV(),
        );
      case "FIB":
        return Provider<AnswerSectionState>.value(
          value: this,
          child: AnswerFIB(),
        );
      case "T/F":
        return Provider<AnswerSectionState>.value(
          value: this,
          child: AnswerTF(),
        );
      case "REF":
        return Provider<AnswerSectionState>.value(
          value: this,
          child: AnswerREF(),
        );
      default:
        return Text("Invalid");
    }
  }
}