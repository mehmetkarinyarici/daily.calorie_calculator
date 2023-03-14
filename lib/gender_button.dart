import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildGenderButton extends StatelessWidget {
  final Color color;
  final String gender;
  final IconData icn;
  final Function() onPress;

  const BuildGenderButton({
    Key? key,
    required this.gender,
    required this.icn,
    required this.onPress,
    this.color = Colors.white38,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icn, size: 45, color: Colors.white),
            Text(gender,
                style: GoogleFonts.rowdies(fontSize: 18, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
