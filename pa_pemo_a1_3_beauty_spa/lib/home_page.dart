// ignore_for_file: camel_case_types
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:paa/detail_treatment.dart';
import 'package:paa/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool switchOn = false; //dark and light theme

  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                onTap: () {
                  Navigator.pushNamed(context, '/detailTreatmentPage1');
                },
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        Image.asset('assets/facial.png'),
                        const Text('Facial',
                            style:
                                TextStyle(fontSize: 16, color: Colors.black)),
                      ],
                    ),
                  ),
                ),
              ),

              //body massage
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/detailTreatmentPage2');
                },
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        Image.asset('assets/body-massage.png'),
                        const Text('Body Massage and Spa',
                            style:
                                TextStyle(fontSize: 16, color: Colors.black)),
                      ],
                    ),
                  ),
                ),
              ),

              //waxing
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/detailTreatmentPage3');
                },
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        Image.asset('assets/waxing.png'),
                        const Text('Waxing',
                            style:
                                TextStyle(fontSize: 16, color: Colors.black)),
                      ],
                    ),
                  ),
                ),
              ),

              //aromatherapy
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/detailTreatmentPage4');
                },
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        Image.asset('assets/aromatherapy.png'),
                        const Text('Arommatherapy',
                            style:
                                TextStyle(fontSize: 16, color: Colors.black)),
                      ],
                    ),
                  ),
                ),
              ),

              //meni pedi
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/detailTreatmentPage5');
                },
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        Image.asset('assets/manicure-padicure.png'),
                        const Text('Manicure & Pedicure',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                ),
              ),

              //nail care
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/detailTreatmentPage6');
                  //DetailTreatmentPage(name_treatment: "nail care");
                },
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        Image.asset('assets/nail-care.png'),
                        const Text('Nail Care Treatment',
                            style:
                                TextStyle(fontSize: 16, color: Colors.black)),
                      ],
                    ),
                  ),
                ),
              ),

              //hair spa
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/detailTreatmentPage7');
                },
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
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNavItem extends StatefulWidget {
  // const BottomNavItem({super.key});

  @override
  State<BottomNavItem> createState() => _BottomNavItemState();
}

class _BottomNavItemState extends State<BottomNavItem>
    with TickerProviderStateMixin {
  int currentIndex = 0;
  late Animation<double> animation;
  late AnimationController _animationController;

  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    )..addListener(() {
        setState(() {});
      });

    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  final List<Widget> pages = [
    HomePage(),
    DetailTreatmentPage2(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: Transform.translate(
          offset: Offset(0, 100 * animation.value),
          child: CurvedNavigationBar(
            backgroundColor: Color.fromARGB(255, 254, 254, 254),
            color: Color.fromARGB(87, 207, 186, 188),
            animationDuration: Duration(milliseconds: 300),
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              Icon(
                Icons.home,
                color: Color.fromARGB(236, 182, 62, 62),
              ),
              Icon(
                Icons.today,
                color: Color.fromARGB(236, 182, 62, 62),
              ),
              Icon(
                Icons.person,
                color: Color.fromARGB(236, 182, 62, 62),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
