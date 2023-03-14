import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.indigo,
      alignment: Alignment.center,
      title: Text('CİNSİYET SEÇİLMEDİ !',
          textAlign: TextAlign.center,
          style: GoogleFonts.secularOne(color: Colors.white, fontSize: 23)),
      content: Text(
        'Lütfen bir cinsiyet seçiniz.',
        textAlign: TextAlign.center,
        style: GoogleFonts.archivo(fontWeight: FontWeight.w500),
      ),
      actions: [
        GestureDetector(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(45.0, 8.0, 45.0, 8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.grey),
              padding: const EdgeInsets.only(top: 6, bottom: 6),
              alignment: Alignment.center,
              child: Text(
                'TAMAM',
                style:
                    GoogleFonts.secularOne(color: Colors.white, fontSize: 17),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
