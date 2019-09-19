import 'package:bayda_bible_bowl/screens/study/flashcard_screen.dart';
import 'package:bayda_bible_bowl/utils/menu.dart';
import 'package:flutter/material.dart';

class Study extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Study"),
      ),
      drawer: Menu(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.assignment),
              label: Text("Press for sample flashcards"),
              onPressed:() => Navigator.push(context, MaterialPageRoute(builder: (context) => Flashcards(5))),
            ),
          ],
        ),
      ),
    );
  }
}