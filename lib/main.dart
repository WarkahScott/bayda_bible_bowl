import 'package:bayda_bible_bowl/data/db/database.dart';
import 'package:bayda_bible_bowl/utils/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      builder: (_) => Database().questionDao,
      child: MaterialApp(
        title: 'Bible Bowl Companion',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      )
    );
  }
}