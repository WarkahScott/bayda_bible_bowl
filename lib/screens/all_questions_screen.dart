import 'package:bayda_bible_bowl/data/db/bible_data.dart';
import 'package:bayda_bible_bowl/data/db/database.dart';
import 'package:bayda_bible_bowl/utils/bible_text.dart';
import 'package:bayda_bible_bowl/utils/dropdown_section_short.dart';
import 'package:bayda_bible_bowl/utils/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';


// ignore: must_be_immutable
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
          return _buildListItem(questionItem, dao, context);
        }
      );
    },
  );
}

Widget _buildListItem(Question question, QuestionDao dao, BuildContext context){

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
      onTap: () => _questionView(context, question),
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

void _questionView(BuildContext context, Question question) {
  String reference = "${question.book} ${question.chapter} : ${question.verse}";

  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.black.withOpacity(0),
        child: Card(
          child: Container(
            height: MediaQuery.of(context).size.height * .5,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(question.question, style: TextStyle(fontSize: 20),),
                  Text(question.answer,style: TextStyle(fontSize: 20),),
                  Text(reference,style: TextStyle(fontSize: 20),),
                  FutureBuilder(
                    future: getReference(reference),
                    builder: (context, snapshot) {
                      if(snapshot.hasData)
                        return Text("\"${snapshot.data}", textAlign: TextAlign.center,style: TextStyle(fontSize: 20));
                      else if (snapshot.hasError)
                        return Text(snapshot.error);

                      return CircularProgressIndicator();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  );
}