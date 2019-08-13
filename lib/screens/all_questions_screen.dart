import 'package:flutter/material.dart';

import 'package:bayda_bible_bowl/utils/menu.dart';

class AllQuestions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Questions'),
      ),
      drawer: Menu(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Testing',
              style: TextStyle(fontSize: 50),
            ),
          ],
        ),
      ),
    );
  }
}