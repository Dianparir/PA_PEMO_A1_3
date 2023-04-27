// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  bool switchOn = false; //dark and light theme

  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: heightScreen,
        width: widthScreen,
        padding: const EdgeInsets.all(30),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 2 / 2.45,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(10),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      Image.asset('assets/facial.png'),
                      const Text('Facial',
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                    ],
                  ),
                ),
              ),
            ),

            //body massage
            InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(10),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      Image.asset('assets/body-massage.png'),
                      const Text('Body Massage',
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                    ],
                  ),
                ),
              ),
            ),

            //waxing
            InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(10),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      Image.asset('assets/waxing.png'),
                      const Text('Waxing',
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                    ],
                  ),
                ),
              ),
            ),

            //aromatherapy
            InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(10),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      Image.asset('assets/aromatherapy.png'),
                      const Text('Arommatherapy',
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                    ],
                  ),
                ),
              ),
            ),

            //meni pedi
            InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(10),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      Image.asset('assets/manicure-padicure.png'),
                      const Text('Menicure & Pedicure',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          textAlign: TextAlign.center
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //nail care
            InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(10),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      Image.asset('assets/nail-care.png'),
                      const Text('Nail Care Treatment',
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                    ],
                  ),
                ),
              ),
            ),

            //hair spa
            InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(10),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      Image.asset('assets/hair-spa.png'),
                      const Text('Hair Spa & Hair Mask',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          textAlign: TextAlign.center
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.today,
            ),
            label: "Schedule",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: const Color.fromARGB(255, 255, 87, 166),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }
}
