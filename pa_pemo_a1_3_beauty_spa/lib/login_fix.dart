import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pa_pemo_a1_3_beauty_spa/bottom_nav_bar.dart';
import 'package:pa_pemo_a1_3_beauty_spa/registration.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isHidePassword = true;
  String _errorMessage = "";

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  // Controller dan inisialisasi
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController(text: "");
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> _login() async {
    try {
      final String email = _emailController.text.trim();
      final String password = _passwordController.text.trim();

      if (email.isEmpty || password.isEmpty) {
        setState(() {
          _errorMessage = 'Email and Password Cannot Be Empty';
        });
        return;
      }

      // Sign in user with Firebase Authentication
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Mengambil data user dari database
      final DocumentSnapshot userDoc = await _db.collection('users').doc(userCredential.user!.uid).get();

      if (userDoc.exists) {
        // User Terdaftar di database
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
        String name = userData['name'];
        String email = userData['email'];
        String phone_number = userData['phone_number'];
        String birth = userData['birth'];
        String gender = userData['gender'];
        String password = userData['password'];
      } else {
        // User tidak terdaftar di database
        print('User does not exist in Firestore');
      }

      // Navigasi Ke HomePage
      Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (_){
            return BottomNavItem();
        }),
      );
    } catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text('Error Message', style: Theme.of(context).textTheme.bodyLarge),
            ),
            content: Text("Your Account Is Not Registered", style: Theme.of(context).textTheme.bodySmall),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Center(
                  child: Text(
                    "OK"
                  ),
                )
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color.fromARGB(255, 252, 198, 203),
        body: Form(
          key: _formKey,
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/abstract.jpg",
                ),
                fit: BoxFit.cover
              ),
            ),
            child: Center(
              child: Container(
                height: size.height / 2,
                width: size.width * 0.84,
                decoration: BoxDecoration(
                  color: Color.fromARGB(179, 254, 219, 227),
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 1.5,
                      offset: Offset(0, 2)
                    )
                  ]
                ),
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(top: size.height * 0.05),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "SIGN IN",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: size.width / 1.3,
                          child: TextFormField(
                            controller: _emailController,
                            // keyboardType: TextInputType.none,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromARGB(255, 184, 35, 73)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7.0),
                                borderSide: BorderSide(color: Color.fromARGB(255, 184, 35, 73))
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(7.0)),
                              ),
                              labelStyle: TextStyle(color: Colors.black),
                              labelText: 'Email',
                              errorText: _errorMessage.isNotEmpty ? _errorMessage : null,
                            ),
                            // validator: (value) {
                            //   if (value!.isEmpty) {
                            //     return 'Email Cannot Be Empty';
                            //   }
                            //   return null;
                            // },
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Container(
                          width: size.width / 1.3,
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: _isHidePassword,
                            autofocus: false,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromARGB(255, 184, 35, 73), width: 0.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7.0),
                                borderSide: BorderSide(color: Color.fromARGB(255, 184, 35, 73))
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(7.0)),
                              ),
                              labelStyle: TextStyle(color: Colors.black),
                              labelText: 'Password',
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  _togglePasswordVisibility();
                                },
                                child: Icon(
                                  _isHidePassword ? Icons.visibility_off : Icons.visibility,
                                  color: _isHidePassword ? Colors.grey : Color.fromARGB(255, 184, 35, 73),
                                ),
                              ),
                              isDense: true,
                              errorText: _errorMessage.isNotEmpty ? _errorMessage : null,
                            ),
                            // validator: (value) {
                            //   if (value!.isEmpty) {
                            //     return 'Password Cannot Be Empty';
                            //   }
                            //   return null;
                            // },
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Container(
                          width: size.width / 2.9,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 184, 35, 73),
                            borderRadius: BorderRadius.circular(9.5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 0,
                                blurRadius: 1.5,
                                offset: Offset(0, 2)
                              )
                            ]
                          ),
                          child: TextButton(
                            onPressed: _login,
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: size.height * 0.05),
                          child: Text.rich(
                            TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black
                              ),
                              children: [
                                TextSpan(
                                  text: "Sign Up",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 184, 35, 73),
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                  ..onTap =() {
                                    Navigator.push(
                                      context, 
                                      MaterialPageRoute(
                                        builder: (_){
                                          return RegisterPage();
                                      }),
                                    );
                                  }
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ),
      ),
    );
  }
}