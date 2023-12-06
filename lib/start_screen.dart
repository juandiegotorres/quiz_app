import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuizz, {super.key});

  final void Function() startQuizz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/img/homero.png'),
            width: 200,
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            '¿Qué tanto sabes de los Simpsons?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: startQuizz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            label: const Text(
              'Empezar el cuestionario',
              style: TextStyle(fontSize: 18),
            ),
            icon: const Icon(
              Icons.arrow_right_alt,
            ),
          )
        ],
      ),
    );
  }
}
