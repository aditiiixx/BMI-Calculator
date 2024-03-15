class BmiCalc{

  double bmiValue = 0.0;
  String result = '';
  String message='';

  void Calculation(int weight, int height){
    double heightInM = height/100;
    double bmi = weight/(heightInM*heightInM);
    bmiValue = bmi;
    if(bmi>=25){
      result = 'Overweight';
      message = 'You have a higher than normal body weight. Try to exercise more.';
    }
    else if(bmi>18.5){
      result='Normal';
      message = 'You have a normal body weight. Good job!';
    }
    else{
      result='Underweight';
      message = 'You have a lower than normal body weight. You can eata bit more.';
    }
  }
}