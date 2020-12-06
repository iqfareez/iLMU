import 'package:flutter/material.dart';

Color darkblue = Color(0xff14213D);
Color yellow = Color(0xffFFCC3E);

int fadeDuration = 1000;
double delayIncrement = 0.5;
double delayBase = 2.0;

Widget customText(BuildContext context, double size, FontWeight weight, Color color, String text) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: 'Nunito',
      fontSize: size,
      fontWeight: weight,
      color: color
    ),
  );
}