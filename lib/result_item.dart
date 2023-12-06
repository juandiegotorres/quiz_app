import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';

class ResultItem extends StatelessWidget {
  const ResultItem({required this.answer, required this.index, super.key});

  final int index;
  final String answer;

  @override
  Widget build(BuildContext context) {
    String question = questions[index].text;
    String correctAnswer = questions[index].answers[0];
    var isSameAnswer = Colors.red.shade400;
    if (correctAnswer == answer) {
      isSameAnswer = Colors.green.shade400;
    }

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: isSameAnswer,
        child: Text(
          (index + 1).toString(),
        ),
      ),
      title: Text(
        question,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            correctAnswer,
            style: TextStyle(color: Colors.grey.shade400),
          ),
          Text(
            answer,
            style: TextStyle(color: isSameAnswer),
          )
        ],
      ),
      isThreeLine: true,
    );
  }
}
