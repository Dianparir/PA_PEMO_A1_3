import 'package:flutter/material.dart';
import 'package:pa_pemo_a1_3_beauty_spa/main.dart';

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
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: size.height * 0.05, left: size.width * 0.05),
                child: Text(
                  "B.apps",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.2),
                child: Image.asset(
                  "assets/landing-page-pic0.png",
                  // height: size.height / 2,
                  // width: size.width / 2,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.75, left: size.width * 0.10),
                child: Column(
                  children: [
                    Text(
                      "Helping you to teke care of your Body",
                      style: TextStyle(
                        fontSize: 20
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Be your own kind of a beautiful and create a new look",
                      style: TextStyle(
                        fontSize: 12
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: size.width * 0.37, left: size.width * 0.27),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (_){
                                return contoh();
                            }),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 249, 193, 191),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)
                          ),
                        ),
                        child: Row(
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