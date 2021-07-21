// TODO Implement this library.
import 'package:flutter/material.dart';

class Question {
  String quesText;
  Color colors;
  double textSize;

  Question(this.quesText, this.colors, this.textSize);
}

int quesNum = 0;

class QuesBank {
  List<Question> quesBankList = [
    Question('How did you like our service?', Colors.blue, 20),
    Question('How did you appreciate the sanitation?', Colors.blue, 20),
    Question('How was the sound quality?', Colors.blue, 20),
    Question('How was the lightning?', Colors.blue, 20),
    Question(
        'How likely are you to recommend us to your friends?', Colors.blue, 20),
    Question('How likely are you to come back here?', Colors.blue, 20),
    Question('We are sorry for your inconvenience', Colors.red, 40),
    Question('Hope we serve you better next time', Colors.yellow, 40),
    Question('We hope you come back next time.', Colors.green, 40),
  ];

  String getQuesText() {
    return quesBankList[quesNum].quesText;
  }

  Color getColor() {
    return quesBankList[quesNum].colors;
  }

  double getSize() {
    return quesBankList[quesNum].textSize;
  }

  void restartApp() {
    quesNum = 0;
  }
}
