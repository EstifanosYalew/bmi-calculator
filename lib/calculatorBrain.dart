import 'dart:math';

class CalculatorBrain {
  CalculatorBrain(this.height, this.weight);
  final int height;
  final int weight;
  double _bmi = 0.0;
  String calcBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String result() {
    if (_bmi >= 25) {
      return ('over weight');
    } else if (_bmi >= 18.5) {
      return 'normal';
    } else {
      return 'under weight ';
    }
  }

  String getDescription() {
    if (_bmi >= 25) {
      return ('you are too big you are gonna burst');
    } else if (_bmi >= 18.5) {
      return 'You have really good BMI keep it up';
    } else {
      return 'you are afraiding of food just eat';
    }
  }
}
