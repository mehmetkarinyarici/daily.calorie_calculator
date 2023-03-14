import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Container buildTextContainer(String data) {
  return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.lightBlueAccent)),
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      margin: const EdgeInsets.all(15.0),
      child: Flex(
        mainAxisAlignment: MainAxisAlignment.center,
        direction: Axis.horizontal,
        children: [
          Text(
          data,
          style: GoogleFonts.secularOne(color: Colors.white),
        ),]
      ));
}
