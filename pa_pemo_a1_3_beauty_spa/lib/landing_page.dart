import 'package:flutter/material.dart';
import 'package:pa_pemo_a1_3_beauty_spa/login_fix.dart';

class landingPage extends StatelessWidget {
  const landingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 254, 254, 254),
        body: Container(
          margin: EdgeInsets.all(20.0),
          alignment: Alignment.center,
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: size.height * 0.03),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 39,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(211, 252, 217, 222),
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Text(
                        " B.",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      "spa",
                      style: TextStyle(
                        fontSize: 20
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: size.height / 2,
                margin: EdgeInsets.only(top: 50.0),
                child: Image.asset(
                  "assets/landing-page-pic0.png",
                  // height: size.height / 2,
                  // width: size.width / 2,
                ),
              ),
              SizedBox(
                height: size.height * 0.065,
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      "Helping you to take care of your Body",
                      style: TextStyle(
                        fontSize: 20
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Be your own kind of a beautiful and create a new looks",
                      style: TextStyle(
                        fontSize: 12
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 125,
                      height: 40,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 0,
                              blurRadius: 1.5,
                              offset: Offset(0, 3)
                            )
                          ],
                          borderRadius: BorderRadius.circular(100),
                          color: Color.fromARGB(107, 249, 193, 191),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (_){
                                  // return RegisterPage();
                                  return LoginPage();
                              }),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(220, 249, 193, 191),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Next",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  letterSpacing: 1
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.arrow_right_alt, 
                                color: Colors.black,
                                size: 25,
                              ),
                            ],
                          )
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: size.height * 0.07),
                    )
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}