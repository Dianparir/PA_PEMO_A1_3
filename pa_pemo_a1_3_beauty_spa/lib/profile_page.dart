import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 254, 254, 254),
        body: Stack(
          children: [
            Container(
              width: size.width - 2,
              // height: size.height - 2,
              margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0, bottom: size.height * 0.7),
              decoration: BoxDecoration(
                color: Color.fromARGB(87, 207, 186, 188),
                borderRadius: BorderRadius.circular(20.0)
              ),
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.10, left: size.width * 0.79),
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
                      borderRadius: BorderRadius.only(topRight: Radius.circular(500)),
                      color: Colors.white54,
                    ),
                  ),
                  Container(
                    width: 120,
                    height: 60,
                    margin: EdgeInsets.only(left: size.width * 0.54),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(200), bottomRight: Radius.circular(200)),
                      color: Colors.white54,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Positioned(
                        top: 29.0,
                        left: 16.0,
                        child: Container(
                          margin: EdgeInsets.only(left: 15.0, top: size.height * 0.02),
                          width: 35.0,
                          height: 35.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(207, 93, 79, 79)
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_back_ios_new, 
                              size: 14
                            ),
                            color: Colors.white,
                          ),
                        )
                      ),
                      Container(
                        margin: EdgeInsets.only(top: size.height * 0.02),
                        child: Text(
                          "Profile",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 182, 62, 62)
                          ),
                        ),
                      ),
                      Positioned(
                        top: 29.0,
                        right: 16.0,
                        child: Container(
                          alignment: Alignment.topRight,
                          margin: EdgeInsets.only(right: 15.0, top: size.height * 0.02),
                          width: 35.0,
                          height: 35.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(207, 93, 79, 79)
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.more_horiz_sharp,
                              size: 14,
                            ),
                            color: Colors.white,
                          ),
                        )
                      ),
                    ],
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
                  backgroundImage: AssetImage("assets/Male_profile.png"),
                  radius: 50,
                ),
              )
            ),
            // SizedBox(
            //   height: 10,
            // ),
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: size.height * 0.39),
              child: Text(
                "Username",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: size.height * 0.43),
              child: Text(
                "Username@gmail.com",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 14
                ),
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.45),
                  child: Column(
                    children: [
                       Card(
                        child: ListTile(
                          trailing: Icon(
                            Icons.account_circle,
                            color: Color.fromARGB(178, 182, 62, 62)
                          ),
                          title: Text("Username"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          trailing: Icon(
                            Icons.email_outlined,
                            color: Color.fromARGB(178, 182, 62, 62)
                          ),
                          title: Text("Email"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          trailing: Icon(
                            Icons.calendar_month_sharp,
                            color: Color.fromARGB(178, 182, 62, 62)
                          ),
                          title: Text("Birth"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          trailing: Icon(
                            Icons.phone_outlined,
                            color: Color.fromARGB(178, 182, 62, 62)
                          ),
                          title: Text("Phone Number"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          trailing: Icon(
                            Icons.key_sharp,
                            color: Color.fromARGB(178, 182, 62, 62)
                          ),
                          title: Text("Password"),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}