import 'package:bayda_bible_bowl/data/db/bible_data.dart';
import 'package:bayda_bible_bowl/data/db/database.dart';
import 'package:bayda_bible_bowl/utils/dropdown_section_short.dart';
import 'package:bayda_bible_bowl/utils/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

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
            DropdownSectionShort(),
            Container(
              height: MediaQuery.of(context).size.height * .75,
              child: _buildQuestionList(context),
            ),
          ],
        ),
      ),
    );
  }
}

StreamBuilder<List<Question>> _buildQuestionList(BuildContext context){

  final dao = Provider.of<QuestionDao>(context);
  return StreamBuilder(
    stream: dao.watchAllQuestions(),
    builder: (context, AsyncSnapshot<List<Question>> snapshot){
      final questions = snapshot.data ?? List();

      return ListView.builder(
        itemCount: questions.length,
        itemBuilder: (_, index){
          final questionItem = questions[index];
          return _buildListItem(questionItem, dao);
        }
      );
    },
  );
}

Widget _buildListItem(Question question, QuestionDao dao){

  return Slidable(
    actionPane: SlidableDrawerActionPane(),
    actionExtentRatio: .15,
    child: ListTile(
      title: InkWell(
        child: Text(question.question),
      ),
      subtitle: InkWell(
        child: Text(question.answer),
      ),
      trailing: Text(
        """${question.type}
        ${Bible.bookMap[question.book].abbreviation}. ${question.chapter} : ${question.verse}""",
        textAlign: TextAlign.right,
      ),
      onTap: () {},
    ),
    secondaryActions: <Widget>[
      IconSlideAction(
        caption: 'Delete',
        color: Colors.red,
        icon: Icons.delete,
        onTap: () => dao.deleteQuestion(question),
      ),
    ],
  );
}