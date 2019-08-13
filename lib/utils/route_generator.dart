import 'package:bayda_bible_bowl/screens/about_screen.dart';
import 'package:bayda_bible_bowl/screens/all_questions_screen.dart';
import 'package:bayda_bible_bowl/screens/home_screen.dart';
import 'package:bayda_bible_bowl/screens/new_question/new_question_screen.dart';
import 'package:bayda_bible_bowl/screens/prepare_screen.dart';
import 'package:bayda_bible_bowl/screens/study_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      case '/new':
        return MaterialPageRoute(builder: (_) => NewQuestion());
      case '/all':
        return MaterialPageRoute(builder: (_) => AllQuestions());
      case '/prep':
        return MaterialPageRoute(builder: (_) => Prepare());
      case '/study':
        return MaterialPageRoute(builder: (_) => Study());
      case '/about':
        return MaterialPageRoute(builder: (_) => About());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}