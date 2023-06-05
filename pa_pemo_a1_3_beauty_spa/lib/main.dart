import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pa_pemo_a1_3_beauty_spa/treatment_provider.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'login_fix.dart';
import 'splash_screen.dart';
import 'landing_page.dart';
import 'registration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TreatmentProvider())
      ],
      child: MaterialApp(
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
          '/loginPage': (context) => LoginPage(),
          '/homePage': (context) => HomePage(),
        },
      ),
    );
  }
}
