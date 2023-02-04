import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answer;
  final VoidCallback onAnswerPressed;
  const Answer({super.key, required this.answer,required this.onAnswerPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        width: double.infinity,
        child: ElevatedButton(onPressed: onAnswerPressed, child: Text(answer)));
  }
}
