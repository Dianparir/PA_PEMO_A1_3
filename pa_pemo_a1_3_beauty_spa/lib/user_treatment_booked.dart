import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserBookedPage extends StatefulWidget {
  final User user;
  const UserBookedPage({super.key, required this.user});

  @override
  State<UserBookedPage> createState() => _UserBookedPageState();
}

class _UserBookedPageState extends State<UserBookedPage> {
  late DocumentSnapshot _userData;
  late User _currentUser;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  // controller
  final TextEditingController _emailController = TextEditingController();

  void initState() {
    super.initState();
    _getCurrentUser();
  }

  Future<void> _getCurrentUser() async {
    final User? user = _auth.currentUser;
    if (user != null) {
      setState(() {
        _currentUser = user;
      });
      await _getUserData();
    }
  }

  Future<void> _getUserData() async {
    final QuerySnapshot snapshot = await _db
        .collection('users')
        .where('email', isEqualTo: _currentUser.email)
        .limit(1)
        .get();
    if (snapshot.docs.isNotEmpty) {
      // final userData = userSnapshot.docs.first.data();
      setState(() {
        _userData = snapshot.docs.first;
        _emailController.text = _userData['email'];
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        height: heightScreen,
        width: widthScreen,
        padding: const EdgeInsets.all(30),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.topLeft,
              height: heightScreen,
              width: widthScreen / 1.5,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(200)),
                color: Color.fromARGB(255, 255, 183, 213),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.spa,
                        color: Color.fromRGBO(253, 80, 146, 1),
                        size: 40,
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        child: const CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/beauty_spa_logo2.png"),
                          radius: 50,
                        ),
                      ),
                      const Icon(
                        Icons.spa,
                        color: Color.fromRGBO(253, 80, 146, 1),
                        size: 40,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text("Your Schedule",
                      style: Theme.of(context).textTheme.titleSmall),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    width: widthScreen / 1.3,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 3, color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 2, top: 3),
                          child: Text(
                            'Nama treatment',
                            maxLines: 10,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 2, top: 3),
                          child: Text(
                            'Tanggal',
                            maxLines: 5,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 2, top: 3),
                          child: Text(
                            'Jam',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}