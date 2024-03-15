import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';

class adjustable_card extends StatelessWidget {
  adjustable_card({required this.label, required this.parameter, required this.reduceOnPress, required this. increaseOnPress, required this.increaseLongPress, required this.reduceLongPress});

  final String label;
  final int parameter;
  final VoidCallback reduceOnPress;
  final VoidCallback reduceLongPress;
  final VoidCallback increaseLongPress;
  final VoidCallback increaseOnPress;

@override
Widget build(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(label, style: labelStyle,),
      Text(parameter.toString(), style: numberStyle,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundIconButton(icon: FontAwesomeIcons.minus,
            onPressed: reduceOnPress,onLongPressed: reduceLongPress,),
          SizedBox(width: 10.0,),
          RoundIconButton(icon: FontAwesomeIcons.plus,
            onPressed: increaseOnPress, onLongPressed: increaseLongPress,),
        ],
      ),
    ],
  );
}
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed, required this.onLongPressed});

  final IconData icon;
  final VoidCallback onPressed;
  final VoidCallback onLongPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      onLongPress: onLongPressed,
      elevation: 0.0,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
          width: 56.0, height: 56.0
      ),
      shape: CircleBorder(),
      fillColor: buttonColor,
    );
  }
}

