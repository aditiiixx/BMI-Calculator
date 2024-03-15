
import 'package:bmi_calc/bmi-Calculation.dart';
import 'package:bmi_calc/result_page.dart';
import 'package:bmi_calc/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'icon_content.dart';
import 'adjustable_card_content.dart';


enum Gender{
  male, female, notSelected,
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender selectedGender = Gender.notSelected;
  int height = 180;
  int weight = 60;
  int age = 20;

  BmiCalc myBMI = BmiCalc();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: Row(
              children: [
                Expanded(child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.notSelected ? inactiveCardColor : selectedGender == Gender.male ? activeCardColor : inactiveCardColor,
                cardChild: IconContents(icon: FontAwesomeIcons.mars, label: 'MALE',),)),
                Expanded(child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.notSelected ? inactiveCardColor : selectedGender == Gender.female ? activeCardColor : inactiveCardColor,
                cardChild: IconContents(icon: FontAwesomeIcons.venus, label: 'FEMALE',),)),
              ],
            )),
            Expanded(child: ReusableCard(colour: activeCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('HEIGHT', style: labelStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(height.toString(), style: numberStyle,),
                    SizedBox(width: 10.0,),
                    Text('cm', style: labelStyle,),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: activeSliderColor,
                    inactiveTrackColor: inactiveSliderColor,
                    thumbColor: thumbColor,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 13.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 24.0),
                    overlayColor: thumbOverlayColor,
                  ),
                  child: Slider(value: height.toDouble(),
                      min: minHeight,
                      max: maxHeight,
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                  }),
                )
              ],
            ),)),
            Expanded(child: Row(
              children: [
                Expanded(child: ReusableCard(colour: activeCardColor,
                cardChild: adjustable_card(
                  label: 'WEIGHT',
                  parameter: weight,
                  reduceOnPress: (){
                    setState(() {
                      weight--;
                    });
                  },
                  increaseOnPress: (){
                    setState(() {
                      weight++;
                    });
                  }, increaseLongPress: () {
                    setState(() {
                      weight+=10;
                    });
                }, reduceLongPress: () {
                    setState(() {
                      weight-=10;
                    });
                },
                ),)),
                Expanded(child: ReusableCard(colour: activeCardColor,
                  cardChild: adjustable_card(
                    label: 'AGE',
                    parameter: age,
                    reduceOnPress: (){
                      setState(() {
                        age--;
                      });
                    },
                    increaseOnPress: (){
                      setState(() {
                        age++;
                      });
                    }, increaseLongPress: () {
                      setState(() {
                        age+=10;
                      });
                  }, reduceLongPress: () {
                      setState(() {
                        age-=10;
                      });
                  },
                  ),
                )),
              ],
            )),
            InkWell(
              child: Container(
                color: bottomContainerColor,
                margin: EdgeInsets.only(top: 10.00),
                width: double.infinity,
                height: bottomContainerHeight,
                child: Center(child: Text('CALCULATE',
                  style: TextStyle(
                    fontSize: 30.0, fontWeight: FontWeight.bold,
                  ),),),
              ),
              onTap: (){
                if(selectedGender == Gender.notSelected ){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Select Gender!')));
                  return;
                }
                myBMI.Calculation(weight, height);
                Navigator.pushNamed(context, '/Results', arguments: {
                  'myBMI': myBMI,
                });
              },
            )
          ],
        ),
      ),
    );
  }
}





