import 'package:flutter/material.dart';

class detailPage extends StatelessWidget {
  const detailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Detail Page"),
        ),
      ),
    );
  }
}