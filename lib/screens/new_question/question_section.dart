import 'package:flutter/material.dart';

class QuestionSection extends StatefulWidget {
  final _state = _QuestionSectionState();

  String get value => _state._value;

  @override
  State<StatefulWidget> createState() => _state;
}

class _QuestionSectionState extends State<QuestionSection> {
  String _value;

  _update(String text){
    setState(() {
      _value = text;
    });
  }

  @override
  Widget build(BuildContext context) {
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
