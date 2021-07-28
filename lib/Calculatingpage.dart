import 'dart:math';
class BMICalculator{

  final int height;
  final  int weight;

  double _bmi=18.0;

  BMICalculator(this.height,this.weight);

  String claculateBMI(){
     _bmi=weight/pow(height/100,2);
    return _bmi.toStringAsFixed(2);
  }

  String resultText()
  {
    if(_bmi>25)
      {
        return 'overweight';
      }
    else if(_bmi>=18.5)
      {
        return 'normal';
      }
    else
      {
        return 'underweight';
      }
  }


  String resultSuggestion()
  {
    if(_bmi>25)
    {
      return 'You have a higher than normal body weight. Try to exercise more !';
    }
    else if(_bmi>=18.5)
    {
      return 'You have a normal body weight. Good Job!';
    }

    return 'You have a lower than normal body weight. You can eat a bit more !';

  }






}