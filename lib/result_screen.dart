import 'package:flutter/material.dart';
import 'package:quiz_app/result_item.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen(this.answers, this.onRestartQuiz, {super.key});

  final void Function() onRestartQuiz;
  final List<String> answers;

  @override
  State<StatefulWidget> createState() {
    return _ResultScreenState();
  }
}

class _ResultScreenState extends State<ResultScreen> {
  void test() {}

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'RESULTADOS',
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            ...widget.answers.asMap().entries.map((entry) {
              final int index = entry.key;
              final String answer = entry.value;
              // También puedes acceder a la clave así: final dynamic key = entry.key;
              return ResultItem(
                index: index,
                answer: answer,
              );
            }).toList(),
            OutlinedButton.icon(
              onPressed: widget.onRestartQuiz,
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              label: const Text('Reiniciar el cuestionario'),
              icon: const Icon(
                Icons.replay,
              ),
            )
          ],
        ),
      ),
    );
  }
}
