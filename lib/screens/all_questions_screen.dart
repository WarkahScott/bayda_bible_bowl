import 'package:bayda_bible_bowl/screens/shared_widgets/dropdown_section.dart';
import 'package:bayda_bible_bowl/utils/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            DropdownSection(),
            Container(
              height: MediaQuery.of(context).size.height * .75,
              child: ListView(
                children: <Widget>[
                  _QuestionTile(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _QuestionTile extends StatelessWidget{

  _QuestionTile();

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: .15,
      child: ListTile(
        title: InkWell(
          child: Text("tst q"),
        ),
        subtitle: InkWell(
          child: Text("tst ans"),
        ),
        trailing: Text("pls" ),
        onTap: () {},
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => {},
        ),
      ],
    );
  }
}