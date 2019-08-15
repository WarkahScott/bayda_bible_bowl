import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'radio_section.dart';

class AnswerSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var radio = Provider.of<RadioSection>(context);

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: Card(
            margin: EdgeInsets.all(30),
            child: Center(

              child: Text( radio.value ?? "null"),
                     )
          ),
        ),
      ],
    );
  }
}
