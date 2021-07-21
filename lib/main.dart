import 'package:flutter/material.dart';
import 'package:feedback_app/quesbank.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'FEEDBACK APP',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black54,
        ),
        body: SafeArea(child: MyAppBrain()),
      ),
    );
  }
}

class MyAppBrain extends StatefulWidget {
  @override
  _MyAppBrainState createState() => _MyAppBrainState();
}

class _MyAppBrainState extends State<MyAppBrain> {
  QuesBank quesBank = QuesBank();
  double totalSum = 0;
  double _currentSliderValue = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Center(
            child: Text(
              quesBank.getQuesText(),
              style: TextStyle(
                  color: quesBank.getColor(), fontSize: quesBank.getSize()),
            ),
          ),
        ),
        Slider(
          value: _currentSliderValue,
          min: 0,
          max: 5,
          divisions: 5,
          label: _currentSliderValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value;
              print(_currentSliderValue);
            });
          },
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                quesNum++;
                totalSum = totalSum + _currentSliderValue;
                print(totalSum);

                if (quesNum >= 6) {
                  if (totalSum >= 0.0 && totalSum <= 10.0) {
                    quesNum = 6;
                  } else if (totalSum >= 11.0 && totalSum <= 20.0) {
                    quesNum = 7;
                  } else
                    quesNum = 8;
                }
              });
            },
            child: Text('NEXT')),
        TextButton(
          onPressed: () {
            if (quesNum >= 6) {
              setState(() {
                quesNum = 0;
                totalSum = 0;
              });
            }
          },
          child: Text('Restart'),
        )
      ],
    );
  }
}
