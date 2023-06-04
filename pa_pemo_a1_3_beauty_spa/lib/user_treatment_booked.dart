import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class UserBookedPage extends StatefulWidget {
  @override
  _UserBookedPageState createState() => _UserBookedPageState();
}

class _UserBookedPageState extends State<UserBookedPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User _user;

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser!;
  }

  @override
  Widget build(BuildContext context) {
    int total = 0;
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    return Scaffold(
      body: ListView(children: [
      Container(
        alignment: Alignment.topCenter,
        height: heightScreen,
        width: widthScreen / 1.5,
        padding: EdgeInsets.all(30),
        margin: EdgeInsets.only(left: widthScreen/16, right: widthScreen/16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(200), topRight: Radius.circular(200)),
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
                    backgroundImage: AssetImage("assets/beauty_spa_logo2.png"),
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
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('schedule')
                    .where('email', isEqualTo: _user.email)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                    return Text('No data available');
                  }

                  return ListView(children: [
                    Expanded(
                      child: Column(
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data() as Map<String, dynamic>;

                          String treatmentName = data['treatment_name'];
                          int treatmentPrice = data['harga'];
                          String tgl = data['date'];
                          String jam = data['time'];

                          total = total + treatmentPrice;

                          return Container(
                            margin: EdgeInsets.only(bottom: 20),
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.topLeft,
                            width: widthScreen / 1.3,
                            height: 110,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 3, color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Column(
                              children: [
                                Text('Treatment Name: $treatmentName'),
                                Text('Treatment Price: $treatmentPrice'
                                    .toString()),
                                Text('Tanggal: $tgl'),

                                Text('Jam: $jam'),
                                if (tgl.compareTo(formattedDate) < 0)
                                  Text('EXPIRED'),
                                // Text('Total: $total'.toString()),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 110),
                      child: Text(
                        "Total : $total".toString(),
                        style: Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ]);
                },
              ),
            ),
          ],
        ),
      ),
    ]));
  }
}
