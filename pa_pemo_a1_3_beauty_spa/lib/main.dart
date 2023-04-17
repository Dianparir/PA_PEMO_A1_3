import 'package:flutter/material.dart';
import 'package:pa_pemo_a1_3_beauty_spa/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beauty Spa',
      // theme: ThemeData(
        
      //   primarySwatch: Colors.blue,
      // ),
      home: landingPage(),
    );
  }
}

class contoh extends StatelessWidget {
  const contoh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Sudah Ganti halaman"),
      ),
    );
  }
}