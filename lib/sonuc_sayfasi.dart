import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalori_hesapla/user_data.dart';
import 'calculator_dart.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key, required this.userData}) : super(key: key);
  final UserData userData;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.calculate_outlined),
        title: const Text('GÜNLÜK KALORİ HESAPLAMA',
            style: TextStyle(fontSize: 21)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text('GÜNLÜK HARCADIĞINIZ KALORİ MİKTARI',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.secularOne(
                          fontSize: 20, color: Colors.white)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Calculator(widget.userData)
                          .calorieCalculator()
                          .round()
                          .toString(),
                      style: GoogleFonts.archivo(
                          fontSize: 60, color: Colors.white),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Text(
                        'kcal',
                        style: GoogleFonts.secularOne(
                            fontSize: 15, color: Colors.white),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.indigo,
                  textStyle: GoogleFonts.patuaOne(fontSize: 22),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('TEKRAR HESAPLA'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
