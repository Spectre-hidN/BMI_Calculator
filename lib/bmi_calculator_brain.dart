import 'dart:math';

class CalculatorBrain {

  final int height;
  final int weight;

  double _bmi = 0;

  CalculatorBrain({required this.height, required this.weight});

  String getResult() {
    _bmi = weight / pow((height/100), 2);
    return _bmi.toStringAsFixed(1);
  }

  String getStatus(){
    if(_bmi >= 25) {
      return "OVERWEIGHT";
    } else if (_bmi > 18.5 ){
      return "NORMAL";
    } else {
      return "UNDERWEIGHT";
    }
  }

  String getInterpretation(){
    if(_bmi >= 25) {
      return "You have a higher than normal body weight! Try to exercise as part of your daily routine..";
    } else if (_bmi > 18.5 ){
      return "Great Job! You have a normal body weight. Keep working out!";
    } else {
      return "You have a lower than normal body weight! Try to intake more calories.";
    }
  }
}