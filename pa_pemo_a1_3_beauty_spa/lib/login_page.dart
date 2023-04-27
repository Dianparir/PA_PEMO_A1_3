import 'package:flutter/material.dart';
import 'package:pa_pemo_a1_3_beauty_spa/home_page.dart';
import 'package:pa_pemo_a1_3_beauty_spa/landing_page.dart';
import 'package:pa_pemo_a1_3_beauty_spa/register.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: Color.fromARGB(255, 252, 198, 203),
        body: Container(
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
          child: Stack(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: size.height * 0.2, bottom: size.height * 0.2),
                  // height: size.height / 2,
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
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: size.height * 0.08),
                        child: Text(
                          "SIGN IN",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 40.0),
                        width: size.width / 1.3,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 0,
                              blurRadius: 1.5,
                              offset: Offset(0, 2)
                            )
                          ]
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Username",
                            border: InputBorder.none,
                            icon: Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: Icon(Icons.account_circle),
                            )
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 40.0),
                        width: size.width / 1.3,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 0,
                              blurRadius: 1.5,
                              offset: Offset(0, 2)
                            )
                          ]
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Password",
                            border: InputBorder.none,
                            icon: Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: Icon(Icons.key),
                            )
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 40.0, bottom: size.height * 0.02),
                        width: size.width / 2.9,
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
                            // Navigator.pop(context);
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (_){
                                  return homePage();
                              }),
                            );
                          }, 
                          child: Text(
                            "Masuk",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}