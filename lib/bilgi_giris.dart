import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalori_hesapla/sonuc_sayfasi.dart';
import 'package:kalori_hesapla/text_info.dart';
import 'package:kalori_hesapla/user_data.dart';
import 'error_dialog.dart';
import 'gender_button.dart';
import 'number_picker.dart';

class BilgiGiris extends StatefulWidget {
  const BilgiGiris({Key? key}) : super(key: key);

  @override
  State<BilgiGiris> createState() => _BilgiGirisState();
}

class _BilgiGirisState extends State<BilgiGiris> {
  final items = [
    'Egzersiz yok',
    'Hafif iş - egzersiz',
    'Orta yoğunlukta egzersiz',
    'Ağır egzersiz',
    'Çok ağır egzersiz',
  ];
  String _selectedItem = 'Egzersiz yok';
  String? currentButton;
  int _currentAge = 25;
  int _currentHeight = 170;
  int _currentWeight = 70;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.calculate_outlined),
          title: Text(
            'GÜNLÜK KALORİ HESAPLAMA',
            style: GoogleFonts.secularOne(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 15.0),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: buildTextContainer('CİNSİYET'),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BuildGenderButton(
                          onPress: () {
                            setState(() {
                              currentButton = 'ERKEK';
                            });
                          },
                          color: currentButton == 'ERKEK'
                              ? Colors.indigo
                              : Colors.white38,
                          gender: 'ERKEK',
                          icn: Icons.man,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: BuildGenderButton(
                            onPress: () {
                              setState(() {
                                currentButton = 'KADIN';
                              });
                            },
                            color: currentButton == 'KADIN'
                                ? Colors.indigo
                                : Colors.white38,
                            gender: 'KADIN',
                            icn: Icons.woman,
                          )),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top:8.0),
                child: MyDivider(),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(child: buildTextContainer('YAŞ')),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: buildNumberPicker(
                          _currentAge,
                          100,
                          1,
                          (value) => setState(() => _currentAge = value),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const MyDivider(),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(child: buildTextContainer('BOY')),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: buildNumberPicker(
                          _currentHeight,
                          250,
                          100,
                          (value) => setState(() => _currentHeight = value),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const MyDivider(),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(child: buildTextContainer('KİLO')),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: buildNumberPicker(
                          _currentWeight,
                          250,
                          20,
                          (value) => setState(() => _currentWeight = value),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const MyDivider(),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      //child: Padding(
                        //padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: buildTextContainer('HAREKET'),
                      //),
                    ),
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                          child: DropdownButton<String>(
                            icon: const Padding(
                              padding: EdgeInsets.only(left: 70),
                              child: Icon(Icons.arrow_downward_outlined),
                            ),
                            underline: const Divider(
                                color: Colors.yellowAccent, height: 2),
                            alignment: Alignment.centerLeft,
                            borderRadius: BorderRadius.circular(20.0),
                            dropdownColor: Colors.black,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            items: items.map((String dropdownStringItem) {
                              return DropdownMenuItem<String>(
                                value: dropdownStringItem,
                                child: Text(dropdownStringItem),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedItem = newValue!;
                              });
                            },
                            value: _selectedItem,
                          ),
                        ))
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 70.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (currentButton == null) {
                              showDialog( context: context,
                                  builder: (BuildContext context) {
                                    return const ErrorDialog();
                                  });
                            } else {
                              Navigator.push( context,
                                  MaterialPageRoute(
                                      builder: (context) => ResultPage(
                                            userData: UserData(
                                              currentAge: _currentAge,
                                              currentHeight: _currentHeight,
                                              currentWeight: _currentWeight,
                                              selectedItem: _selectedItem,
                                              currentButton: currentButton,
                                            ),
                                          )));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.indigo,
                            textStyle: GoogleFonts.patuaOne(fontSize: 22),
                          ),
                          child: const Text('HESAPLA'),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyDivider extends StatelessWidget {
  const MyDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left:30.0,right: 30.0),
      child: Divider(
        thickness: 2,
        color: Colors.white,
      ),
    );
  }
}
