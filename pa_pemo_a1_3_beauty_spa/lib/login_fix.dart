import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pa_pemo_a1_3_beauty_spa/home_page.dart';
import 'package:pa_pemo_a1_3_beauty_spa/landing_page.dart';
import 'package:pa_pemo_a1_3_beauty_spa/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  bool _isHidePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                              labelText: 'Username',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Nama Tidak Boleh Kosong';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Container(
                          width: size.width / 1.3,
                          child: TextFormField(
                            obscureText: _isHidePassword,
                            autofocus: false,
                            initialValue: '',
                            // keyboardType: TextInputType.none,
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
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password Tidak Boleh Kosong';
                              }
                              return null;
                            },
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
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Navigator.pop(context);
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(
                                    builder: (_){
                                      return homePage();
                                  }),
                                );
                              }
                            }, 
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