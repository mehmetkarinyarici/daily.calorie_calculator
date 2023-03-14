import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';

NumberPicker buildNumberPicker(int type, int max, int min, set) {
  return NumberPicker(
    textStyle: GoogleFonts.archivo(fontSize: 20, color: Colors.tealAccent),
    selectedTextStyle: GoogleFonts.archivo(
        fontSize: 20, color: Colors.amber, fontWeight: FontWeight.bold),
    value: type,
    maxValue: max,
    minValue: min,
    onChanged: set,
    axis: Axis.horizontal,
    itemCount: 3,
    itemWidth: 70,
    itemHeight: 50,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          width: 2,
          color: Colors.lightBlueAccent,
        )),
  );
}
