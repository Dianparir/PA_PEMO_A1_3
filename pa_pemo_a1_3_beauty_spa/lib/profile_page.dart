// import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pa_pemo_a1_3_beauty_spa/bottom_nav_bar.dart';
import 'package:pa_pemo_a1_3_beauty_spa/login_fix.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  final User user;
  ProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final currentIndex = 3;
  late DocumentSnapshot _userData;
  late User _currentUser;
  // late String _gender;
  String? _selectedGender;
  // late Stream<QuerySnapshot> _dataStream;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  // controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _birthController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

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
        _nameController.text = _userData['name'];
        _emailController.text = _userData['email'];
        _birthController.text = _userData['birth'];
        _selectedGender = _userData['gender'];
        _genderController.text = _selectedGender.toString();
        _phoneController.text = _userData['phone_number'];
        _passwordController.text = _userData['password'];
      });
    }
  }

  Future<void> _updateUserData(String field, String newValue) async {
    final userRef = _db.collection('users').doc(_currentUser.uid);
    if (widget.user != null) {
      await userRef.update({
        field: newValue,
      });
    }
  }

  void _showEditDialog(
      BuildContext context, String field, String currentValue) {
    TextEditingController _textEditingController = TextEditingController();
    _textEditingController.text = currentValue;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // bool _isUpdatePassword = true;
        return AlertDialog(
          title: Text(
            'Update Data',
            textAlign: TextAlign.center,
          ),
          content: TextField(
            controller: _textEditingController,
            decoration: InputDecoration(
              labelText: 'New Data',
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 184, 35, 73),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: ElevatedButton(
                    child: Text('Save'),
                    onPressed: () {
                      String newValue = _textEditingController.text.trim();
                      if (newValue.isNotEmpty && newValue != currentValue) {
                        // Update data
                        _updateUserData(field, newValue);
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) {
                          return BottomNavItem();
                        }));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 184, 35, 73),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  String _getProfileImage() {
    if (_selectedGender.toString() == 'Male') {
      return 'assets/Male_profile.png';
    } else {
      return 'assets/Female_profile.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 254, 254, 254),
        body: ListView(children: [
          Stack(
            children: [
              Container(
                width: size.width - 2,
                // height: size.height - 2,
                margin: EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                  // top: 40.0,
                  bottom: size.height * 0.6
                ),
                decoration: BoxDecoration(
                    color: Color.fromARGB(87, 207, 186, 188),
                    borderRadius: BorderRadius.circular(20.0)),
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: size.height * 0.10, left: size.width * 0.79),
                      child: CircleAvatar(
                        backgroundColor: Colors.white54,
                        radius: 70,
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 150,
                      margin: EdgeInsets.only(top: 70.0),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(500)),
                        color: Colors.white54,
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 60,
                      margin: EdgeInsets.only(left: size.width * 0.54),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(200),
                            bottomRight: Radius.circular(200)),
                        color: Colors.white54,
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Ink(
                            child: Container(
                              margin: EdgeInsets.only(
                              left: 15.0, top: size.height * 0.02),
                              width: 35.0,
                              height: 35.0,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(207, 93, 79, 79)),
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 14,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (_) {
                                    return BottomNavItem();
                                  }));
                                },
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: size.height * 0.02),
                            child: Text(
                              "Profile",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 182, 62, 62)),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            margin: EdgeInsets.only(
                            right: 15.0, top: size.height * 0.02),
                            width: 35.0,
                            height: 35.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(207, 93, 79, 79),
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.logout,
                                size: 14,
                                color: Colors.white,
                              ),
                              onPressed: () async {
                                await _auth.signOut();
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: size.height * 0.22),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 60,
                ),
              ),
              Expanded(
                  child: Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: size.height * 0.23),
                child: CircleAvatar(
                  backgroundImage: AssetImage(_getProfileImage()),
                  radius: 50,
                ),
              )),
              // SizedBox(
              //   height: 10,
              // ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: size.height * 0.36),
                child: TextField(
                  controller: _nameController,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  readOnly: true,
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: size.height * 0.40),
                child: TextField(
                  controller: _emailController,
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  readOnly: true,
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.45),
                    child: Column(
                      children: [
                        Card(
                          child: ListTile(
                            trailing: IconButton(
                              icon: Icon(Icons.account_circle,
                                  color: Color.fromARGB(178, 182, 62, 62)),
                              onPressed: () {
                                _showEditDialog(
                                    context, 'name', _userData['name']);
                              },
                            ),
                            title: Text(
                              "Username:",
                              style: TextStyle(fontSize: 12),
                            ),
                            subtitle: TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              readOnly: true,
                            ),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            trailing: IconButton(
                              icon: Icon(Icons.email_outlined,
                                  color: Color.fromARGB(178, 182, 62, 62)),
                              onPressed: () {},
                            ),
                            title: Text(
                              "Email:",
                              style: TextStyle(fontSize: 12),
                            ),
                            subtitle: TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              readOnly: true,
                            ),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            trailing: IconButton(
                              icon: Icon(Icons.calendar_month_sharp,
                                  color: Color.fromARGB(178, 182, 62, 62)),
                              onPressed: () {},
                            ),
                            title: Text(
                              "Birth:",
                              style: TextStyle(fontSize: 12),
                            ),
                            subtitle: TextField(
                                controller: _birthController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                readOnly: true,
                              ),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            trailing: IconButton(
                              icon: Icon(Icons.person_2,
                                  color: Color.fromARGB(178, 182, 62, 62)),
                              onPressed: () {},
                            ),
                            title: Text(
                              "Gender:",
                              style: TextStyle(fontSize: 12),
                            ),
                            subtitle: TextFormField(
                              controller: _genderController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              readOnly: true,
                            ),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            trailing: IconButton(
                              icon: Icon(Icons.phone_outlined,
                                  color: Color.fromARGB(178, 182, 62, 62)),
                              onPressed: () {},
                            ),
                            title: Text(
                              "Phone Number:",
                              style: TextStyle(fontSize: 12),
                            ),
                            subtitle: TextFormField(
                              controller: _phoneController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              readOnly: true,
                            ),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            trailing: IconButton(
                              icon: Icon(Icons.key_sharp,
                                  color: Color.fromARGB(178, 182, 62, 62)),
                              onPressed: () {
                                _showEditDialog(
                                    context, 'password', _userData['password']);
                              },
                            ),
                            title: Text(
                              "Password:",
                              style: TextStyle(fontSize: 12),
                            ),
                            subtitle: TextFormField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              readOnly: true,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }
}
