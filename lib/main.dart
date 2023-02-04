import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:quizapp/answer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Kamel', 'score': 1},
        {'text': 'Max', 'score': 2},
        {'text': 'Ahmed', 'score': 3},
        {'text': 'Ola', 'score': 4},
      ],
    },
  ];

  int counter = 0;
  int _score = 0;

  void _increaseCounter() {
    setState(() {
      counter += 1;
    });
  }

  void onAnswerPressed(int score) {
    _score += score;
    _increaseCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QuizApp"),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 12),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              (_questions[counter])["questionText"] as String,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                itemCount: ((_questions[counter])["answers"]
                        as List<Map<String, Object>>)
                    .length,
                itemBuilder: (context, index) {
                  return Answer(
                      onAnswerPressed: () {
                       onAnswerPressed( ((_questions[counter])["answers"]
                       as List<Map<String, Object>>)[index]["score"]
                       as int);
                      },
                      answer: ((_questions[counter])["answers"]
                              as List<Map<String, Object>>)[index]["text"]
                          as String);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
