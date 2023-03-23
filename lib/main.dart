import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 7},
        {'text': 'Green', 'score': 4},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 1},
        {'text': 'Snake', 'score': 5},
        {'text': 'Elephant', 'score': 4},
        {'text': 'Lion', 'score': 3},
      ],
    },
    {
      'questionText': 'What\'s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
      ],
    }
  ];
  var _questionsIndex = 0;
  var _totalSCore = 0;

  void _resetQuiz() {
    setState(() {
      _questionsIndex = 0;
      _totalSCore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalSCore += score;

    setState(() {
      _questionsIndex = _questionsIndex + 1;
    });
    print(_questionsIndex);
    if (_questionsIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
          ),
          body: _questionsIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionsIndex: _questionsIndex,
                  questions: _questions,
                )
              : Result(_totalSCore, _resetQuiz)),
    );
  }
}
