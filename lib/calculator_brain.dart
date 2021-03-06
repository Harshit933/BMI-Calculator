import 'dart:math';
class CalculatorBrain{

  CalculatorBrain(this.height,this.weight);

  final int height;
  final int weight;
  late double _bmi;

  String calculateBMI(){
    _bmi = weight / pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >= 25){
      return 'overweight';
    } else if(_bmi > 18.5){
      return 'normal';
    } else{
      return 'underweight';
    }
  }

  String getInterpretation(){
    if(_bmi >= 25){
      return 'Try some Exercising';
    } else if(_bmi > 18.5){
      return 'Goof Job! your bmi is normal';
    } else{
      return 'Try Bulking!';
    }
  }
}