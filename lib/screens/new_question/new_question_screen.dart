import 'package:flutter/material.dart';

import 'package:bayda_bible_bowl/utils/menu.dart';

import 'dropdown_section.dart';

class NewQuestion extends StatefulWidget {
  @override
  _NewQuestionState createState() => _NewQuestionState();
}

class _NewQuestionState extends State<NewQuestion> {

  DropdownSection dropdown = DropdownSection();

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
              RadioSection(),
              QuestionSection(),
              AnswerSection(),
              dropdown,
              //ButtonSection()
              FlatButton(
                color: Colors.blueAccent,
                child: Text("Submit"),
                onPressed: () => {print(dropdown.reference)},
              )
            ],
          )
      ),
    );
  }
}

//class ButtonSection extends Row {
//  ButtonSection() : super(
//      mainAxisSize: MainAxisSize.max,
//      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//      children: <Widget>[
//        FlatButton(
//          color: Colors.blueAccent,
//          child: Text("Submit"),
//          onPressed: () => {print()},
//        )
//      ]
//  );
//}

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

class AnswerSection extends Row {
  AnswerSection() : super(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Expanded(
        child: Card(
            margin: EdgeInsets.all(30),
            child: Center(
              child: Text("Answer"),
            )
        ),
      ),
    ],
  );
}

class RadioSection extends Row {
  RadioSection() : super(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Radio<String>(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: "Q/A",
          groupValue: "txt",
          onChanged: null,
        ),
        Text('Q/A', textAlign: TextAlign.left),
        Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),

        Radio<String>(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: "FTV",
          groupValue: "txt",
          onChanged: null,
        ),
        Text('FTV'),
        Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),

        Radio<String>(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: "FIB",
          groupValue: "txt",
          onChanged: null,
        ),
        Text('FIB'),
        Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),

        Radio<String>(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: "T/F",
          groupValue: "txt",
          onChanged: null,
        ),
        Text('T/F'),
        Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),

        Radio<String>(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: "REF",
          groupValue: "txt",
          onChanged: null,
        ),
        Text('REF'),
      ]
  );
}