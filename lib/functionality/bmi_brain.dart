import 'dart:math';

class BmiBrain {
  final int height;
  final int weight;
 late double _bmi;

  BmiBrain({required this.height, required this.weight});

  String getBmiResult() {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResultClassification() {
    if (_bmi < 18) {
      return 'Under Weight';
    } else if (_bmi < 24) {
      return 'Normal';
    } else if (_bmi > 24 && _bmi < 30) {
      return 'Over Weight';
    } else {
      return 'Extreme Obesity';
    }
  }

  String getResultDetails() {
    if (_bmi < 18) {
      return 'Your Body lacks protiens, you should eat Kidney beans often.';
    } else if (_bmi < 24) {
      return 'You are healthy, Keep it up!';
    } else if (_bmi > 24 && _bmi < 30) {
      return 'You have too much fat in your body, start going to gym.';
    } else {
      return 'Visit nearest hospital and start working out and eat less and lesser.';
    }
  }
}
