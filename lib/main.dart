import 'package:flutter/material.dart';
import 'package:introapp/data/questions.dart';
import 'package:introapp/models/question_model.dart';

void main() {
  runApp(const MaterialApp(home: QuizScreen()));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key}); // 1. gereksinim

  // 2. gereksinim
  Widget build(BuildContext buildContext) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // asset
            Image.asset(
              "assets/images/quiz-logo.png",
              width: 240,
            ),
            const Text("Quiz App",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5)),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber, foregroundColor: Colors.black),
              child: const Text(
                "Oyuna Başla",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() {
    return _QuizState();
  }
}

// _State
class _QuizState extends State<QuizScreen> {
  String text = "Aşağıdakilerden hangisi bir widget türüdür";

  void changeText() {
    setState(() {
      text = "Yeni Değer";
    });
  }

  int questionNum = 0;
  void ChangeQuestion() {
    setState(() {
      if (questionNum >= questions.length - 1) {
        questionNum = 0;
      } else {
        questionNum++;
      }
    });
  }

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(questions[questionNum].question),
            ...questions[questionNum].answers.map((answer) {
              return ElevatedButton(
                  onPressed: () {
                    ChangeQuestion();
                  },
                  child: Text(answer));
            })
          ],
        ),
      ),
    );
  }
}
