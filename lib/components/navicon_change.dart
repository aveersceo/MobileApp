import 'package:flutter/material.dart';
import 'package:aveers_student_poc/variables/globals.dart' as globals;

void navicon_change() {
  if (globals.page4nav == 0) {
    globals.colorcont1 = Colors.white;
    globals.colorcont2 = Colors.black;
    globals.colorcont3 = Colors.black;
    globals.colorcont4 = Colors.black;
    globals.colorcont5 = Colors.black;
  } else if (globals.page4nav == 1) {
    globals.colorcont1 = Colors.black;
    globals.colorcont2 = Colors.white;
    globals.colorcont3 = Colors.black;
    globals.colorcont4 = Colors.black;
    globals.colorcont5 = Colors.black;
  } else if (globals.page4nav == 2) {
    globals.colorcont1 = Colors.black;
    globals.colorcont2 = Colors.black;
    globals.colorcont3 = Colors.white;
    globals.colorcont4 = Colors.black;
    globals.colorcont5 = Colors.black;
  } else if (globals.page4nav == 3) {
    globals.colorcont1 = Colors.black;
    globals.colorcont2 = Colors.black;
    globals.colorcont3 = Colors.black;
    globals.colorcont4 = Colors.white;
    globals.colorcont5 = Colors.black;
  } else if (globals.page4nav == 4) {
    globals.colorcont1 = Colors.black;
    globals.colorcont2 = Colors.black;
    globals.colorcont3 = Colors.black;
    globals.colorcont4 = Colors.black;
    globals.colorcont5 = Colors.white;
  }
}
