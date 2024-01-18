import 'package:bmi_calculator/functionality/constants.dart';
import 'package:bmi_calculator/functionality/custom_widget.dart';
import 'package:bmi_calculator/functionality/reuseble_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {required this.getBmiResult,
      required this.getResultDetails,
      required this.getResultClassification});

  final String getBmiResult;
  final String getResultDetails;
  final String getResultClassification;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Results',
          style: const TextStyle(),
        ),
        centerTitle: true,
        elevation: 10.0,
        bottomOpacity: 0.5,
      ),
      body: Column(
        children: [
          Center(
            child: const Text(
              'Your Results',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
          ),
          Expanded(
            child: ReusebleCard(
              colour: kActiveCardColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    getResultClassification.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.green),
                  ),
                  Text(
                    getBmiResult,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 100,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    getResultDetails,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          ButtomButton(
            buttonName: 'Re-Calculate',
            onPressedd: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
