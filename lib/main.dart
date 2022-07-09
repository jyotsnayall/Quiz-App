import 'package:flutter/material.dart';

import './questions.dart';
import './answer.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': ['Black', 'Red', 'Blue', 'None'],
    },
    {
      'questionText': 'What\'s your favourite book?',
      'answers': [
        'Some series (like HP, PJO)',
        'Finding Alaska',
        'MXTX ifykyk',
        'Other'
      ],
    },
    {
      'questionText': 'What\'s your favourite movie?',
      'answers': ['Black', 'Red', 'Blue', 'None'],
    },
    {
      'questionText': 'Do you skateboard?',
      'answers': ['Yes', 'No', 'Wanna try', 'Not interested'],
    },
    {
      'questionText': 'What\'s your favourite skateboard trick?',
      'answers': ['Ollie', 'Pop Shuv', 'Drop ins', 'Kick Flip'],
    },
  ];
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < questions.length) {
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
          title: Text('My Quiz App'),
        ),
        body: _questionIndex < questions.length
            ? Column(
                children: [
                  Question(
                    questions[_questionIndex]['questionText'] as String,
                  ),
                  ...(questions[_questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList()
                ],
              )
            : Center(
                child: Text('You did it!'),
              ),
      ),
    );
  }
}
