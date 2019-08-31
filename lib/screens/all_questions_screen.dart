import 'package:bayda_bible_bowl/data/db/bible_data.dart';
import 'package:bayda_bible_bowl/data/db/database.dart';
import 'package:bayda_bible_bowl/utils/dropdown_section_short.dart';
import 'package:bayda_bible_bowl/utils/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';


class AllQuestions extends StatelessWidget {
  DropdownSectionShort _filter = DropdownSectionShort();

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
            _filter,
            Container(
              height: MediaQuery.of(context).size.height * .75,
              child: ChangeNotifierProvider(
                builder: (_) => _filter,
                child: Consumer<DropdownSectionShort>(
                  builder: (_, _filter, __) => _buildQuestionList(_),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}

StreamBuilder<List<Question>> _buildQuestionList(BuildContext context){

  final dao = Provider.of<QuestionDao>(context);
  final filter = Provider.of<DropdownSectionShort>(context);

  String book = filter.value[0];
  String chapter = filter.value[1];

  final stream = (book == "(ALL)") ?
    dao.watchAllQuestions() : dao.watchFilteredQuestions(book, chapter);

  return StreamBuilder(
    stream: stream,
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
        ${Bible.bookFilter[question.book].abbreviation}. ${question.chapter} : ${question.verse}""",
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