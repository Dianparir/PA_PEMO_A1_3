import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'home_page.dart';
import 'splash_screen.dart';
import 'landing_page.dart';
import 'registration.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'package:paa/booking_page.dart';
import 'detail_treatment.dart';
import 'schedule_page.dart';
import 'account_page.dart';
import 'package:paa/profile_page.dart';
import 'about_page.dart';

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
      debugShowCheckedModeBanner: false,
      title: 'Beauty Spa',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.pink,
        primaryColor: Colors.pinkAccent,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
        textTheme: GoogleFonts.montserratTextTheme(const TextTheme(
          displayMedium: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          displaySmall: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              letterSpacing: 2),
          titleMedium: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          titleSmall: TextStyle(fontSize: 18, color: Colors.black),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 15, color: Colors.black),
          bodySmall:
              TextStyle(fontSize: 13, color: Colors.black, letterSpacing: 1),
        )),
      ),
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
      initialRoute: '/splashscreen',
      routes: {
        '/splashScreen': (context) => const SplashScreen(),
        '/landingPage': (context) => const landingPage(),
        '/registerPage': (context) => RegisterPage(),
        '/loginPage': (context) => const LoginPage(),
        '/homePage': (context) => const HomePage(),
        '/detailTreatmentPage1': (context) => const DetailTreatmentPage1(),
        '/detailTreatmentPage2': (context) => const DetailTreatmentPage2(),
        '/detailTreatmentPage3': (context) => const DetailTreatmentPage3(),
        '/detailTreatmentPage4': (context) => const DetailTreatmentPage4(),
        '/detailTreatmentPage5': (context) => const DetailTreatmentPage5(),
        '/detailTreatmentPage6': (context) => const DetailTreatmentPage6(),
        '/detailTreatmentPage7': (context) => const DetailTreatmentPage7(),
        '/bookingPage': (context) => const BookingPage(),
        '/schedulePage': (context) => SchedulePage(),
        '/accountPage': (context) => const AccountPage(),
        '/profilePage': (context) => ProfilePage(),
        '/aboutPage': (context) => const AboutPage(),
      },
    );
  }
}
