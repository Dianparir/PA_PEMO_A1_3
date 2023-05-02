import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:pa_pemo_a1_3_beauty_spa/login_fix.dart';
// import 'authentitification_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool? data = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(253, 254, 219, 227),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: size.height / 9, bottom: 10.0),
                child: Text(
                  "Create Your Account",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "name",
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "email",
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                child: TextFormField(
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    hintText: "birth",
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "gender",
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "phone number",
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                child: TextFormField(
                  keyboardType: TextInputType.none,
                  decoration: InputDecoration(
                    hintText: "password",
                  ),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.only(top: 5.0, left: 5.0),
                title: Text(
                  "I agree to all Term, Privacy Policy and and Fees",
                  style: TextStyle(
                    fontSize: 14
                  ),
                ),
                leading: Checkbox(
                  value: data,
                  onChanged: (bool? value) {
                    setState(() {
                    data = value;
                  });
                }),
              ),
              Container(
                margin: EdgeInsets.only(bottom: size.height * 0.02),
                width: size.width / 2.9,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 184, 35, 73),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                  ),
                  child: Text("Sign Up")
                ),
              ),
              Text.rich(
                TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(
                    color: Colors.black
                  ),
                  children: [
                    TextSpan(
                      text: "Sign In",
                      style: TextStyle(
                        color: Color.fromARGB(255, 184, 35, 73),
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                       ..onTap =() {
                         Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (_){
                              return LoginPage();
                          }),
                        );
                      }
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}