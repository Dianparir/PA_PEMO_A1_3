import 'dart:async';
import 'package:flutter/material.dart';
import 'landing_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashStart();
  }

  splashStart() {
    var duration = const Duration(seconds: 5);
    Timer(duration, () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) {
            return const landingPage();
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width; //MediaQuery
    var tinggi = MediaQuery.of(context).size.height; //MediaQuery

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        height: tinggi,
        width: lebar,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/beauty_spa_logo.png",
              height: tinggi / 2,
              width: lebar / 2,
            ),
          ],
        ),
      ),
    );
  }
}
