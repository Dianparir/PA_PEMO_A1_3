import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pa_pemo_a1_3_beauty_spa/home_page.dart';
import 'package:pa_pemo_a1_3_beauty_spa/profile_page.dart';
import 'package:pa_pemo_a1_3_beauty_spa/user_treatment_booked.dart';

class BottomNavItem extends StatefulWidget {
  // const BottomNavItem({super.key});

  @override
  State<BottomNavItem> createState() => _BottomNavItemState();
}

class _BottomNavItemState extends State<BottomNavItem> with TickerProviderStateMixin {
  int _currentIndex = 0;
  List<Widget> pages = [];
  User? _currentUser;
  late Animation<double> animation;
  late AnimationController _animationController;

  void initState() {
    super.initState();
    _getCurrentUser();
    pages = [
      HomePage(),
      UserBookedPage(),
      ProfilePage(user: _currentUser!),
    ];
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
