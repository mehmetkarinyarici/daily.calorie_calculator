import 'package:flutter/material.dart';
import 'bilgi_giris.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.black12,
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.indigo, size: 38),
          ),
          scaffoldBackgroundColor: Colors.white12),
      home: const BilgiGiris(),
    );
  }
}
