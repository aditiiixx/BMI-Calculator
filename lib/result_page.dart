import 'package:bmi_calc/bmi-Calculation.dart';
import 'package:bmi_calc/constants.dart';
import 'package:bmi_calc/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BmiCalc myBMI = ((ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map)['myBMI'];

    return Scaffold(
      appBar: AppBar(title: Center(child: Text('BMI CALCULATOR')),
      backgroundColor: Color(0xFF0A0E21),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 10.0),
            child: Text('YOUR RESULTS', style: TextStyle(
              fontSize: 30.0, color: Colors.black
            ), textAlign: TextAlign.center,),
          ),
          Expanded(
            child: ReusableCard(colour: activeCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(myBMI.result.toUpperCase(), style: resultStyle,),
                Text(myBMI.bmiValue.toStringAsFixed(2), style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 100.0,
                ),),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(myBMI.message, style: TextStyle(
                    fontSize: 25.0,
                  ),
                  textAlign: TextAlign.center,),
                )
              ],
            )),
          ),
          InkWell(
            child: Container(
              color: bottomContainerColor,
              margin: EdgeInsets.only(top: 10.00),
              width: double.infinity,
              height: bottomContainerHeight,
              child: Center(child: Text('RE-CALCULATE',
                style: TextStyle(
                  fontSize: 30.0, fontWeight: FontWeight.bold,
                ),),),
            ),
            onTap: (){
              Navigator.pushNamed(context, '/HomePage');
            },
          )
        ],
      ),
    );
  }
}
