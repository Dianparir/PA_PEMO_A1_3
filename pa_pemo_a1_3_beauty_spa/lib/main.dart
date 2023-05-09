import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pa_pemo_a1_3_beauty_spa/landing_page.dart';
import 'package:pa_pemo_a1_3_beauty_spa/profile_page.dart';
import 'package:pa_pemo_a1_3_beauty_spa/splash_screen.dart';
import 'package:get/get.dart';
import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beauty Spa',
      home: SplashScreen(),
      // home: ProfilePage(),
    );
  }
}