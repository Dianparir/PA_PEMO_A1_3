// ignore_for_file: camel_case_types
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pa_pemo_a1_3_beauty_spa/booking_page.dart';
import 'package:pa_pemo_a1_3_beauty_spa/detail_page.dart';
import 'package:pa_pemo_a1_3_beauty_spa/detail_treatment.dart';
import 'package:pa_pemo_a1_3_beauty_spa/profile_page.dart';

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
                  // BookingPage(namaTreatment: "Facial");
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
                onTap: () {
                  DetailTreatmentPage(name_treatment: "Arommatherapy");
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
                onTap: () {
                  DetailTreatmentPage(name_treatment: "nail care");
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
        // bottomNavigationBar: BottomNavItem(),
        // bottomNavigationBar: BottomNavigationBar(
        //   items: const <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.home),
        //       label: "Home",
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         Icons.today,
        //       ),
        //       label: "Schedule",
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.person),
        //       label: 'Account',
        //     ),
        //   ],
        //   currentIndex: 0,
        //   selectedItemColor: const Color.fromARGB(255, 255, 87, 166),
        //   unselectedItemColor: Colors.grey,
        //   showUnselectedLabels: true,
        // ),
      ),
    );
  }
}


class BottomNavItem extends StatefulWidget {
  // BottomNavItem({Key? key}) : super(key: key);

  @override
  State<BottomNavItem> createState() => _BottomNavItemState();
}

class _BottomNavItemState extends State<BottomNavItem> with TickerProviderStateMixin{
  int _currentIndex = 0;
  List<Widget> pages = [];
  User? _currentUser;

  late Animation<double> animation;
  late AnimationController _animationController;

  void initState() {
    super.initState();
    _getCurrentUser();
    pages = [
      homePage(),
      BookingPage(),
      ProfilePage(user: _currentUser!),
    ];
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    )..addListener(() {
      setState(() {});
    });
    
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _getCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      _currentUser = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: pages,
        ),
        // pages[currentIndex],
        bottomNavigationBar: Transform.translate(
          offset: Offset(0, 100 * animation.value),
          child: CurvedNavigationBar(
            backgroundColor: Color.fromARGB(255, 254, 254, 254),
            color: Color.fromARGB(87, 207, 186, 188),
            animationDuration: Duration(milliseconds: 300),
            onTap: (index) {
              setState(() {
                _currentIndex = index;
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
