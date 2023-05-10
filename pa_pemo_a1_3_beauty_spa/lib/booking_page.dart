<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'dialog.dart';

class BookingPage extends StatefulWidget {
  //  BookingPage({super.key, required this.nama_Treatment});

  // final String nama_Treatment;

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  bool? data = false;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Ink(
                  decoration: const ShapeDecoration(
                    color: Color.fromRGBO(255, 64, 129, 1),
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                    ),
                    color: Colors.white,
                    iconSize: 15,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 35,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: widthScreen / 1.3,
                  child: TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 184, 35, 73)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 184, 35, 73))),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      ),
                      labelStyle: Theme.of(context).textTheme.bodySmall,
                      labelText: 'Full Name',
                      icon: const Icon(Icons.person_outline),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please input your name';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  width: widthScreen / 1.3,
                  child: TextFormField(
                    controller: dateController,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 184, 35, 73)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 184, 35, 73))),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      ),
                      labelStyle: Theme.of(context).textTheme.bodySmall,
                      labelText: 'Date',
                      icon: const Icon(Icons.today),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please select a date';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  width: widthScreen / 1.3,
                  child: TextFormField(
                    controller: timeController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 184, 35, 73)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 184, 35, 73))),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      ),
                      labelStyle: Theme.of(context).textTheme.bodySmall,
                      labelText: 'Time',
                      icon: const Icon(
                        Icons.schedule,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please select a time';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  width: widthScreen / 2.9,
                  height: 35,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(178, 182, 62, 62),
                      borderRadius: BorderRadius.circular(9.5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 1.5,
                            offset: Offset(0, 2))
                      ]),
                  child: TextButton(
                    onPressed: () {
                      CustomAlertBooking(
                          context, "Are you sure you want to log out?");
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
=======
import 'package:flutter/material.dart';

import 'package:paa/home_page.dart';
import 'package:paa/dialog.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  bool? data = false;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Ink(
                  decoration: const ShapeDecoration(
                    color: Color.fromRGBO(255, 64, 129, 1),
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                    ),
                    color: Colors.white,
                    iconSize: 15,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 35,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: widthScreen / 1.3,
                  child: TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 184, 35, 73)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 184, 35, 73))),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      ),
                      labelStyle: Theme.of(context).textTheme.bodySmall,
                      labelText: 'Full Name',
                      icon: const Icon(Icons.person_outline),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please input your name';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  width: widthScreen / 1.3,
                  child: TextFormField(
                    controller: dateController,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 184, 35, 73)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 184, 35, 73))),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      ),
                      labelStyle: Theme.of(context).textTheme.bodySmall,
                      labelText: 'Date',
                      icon: const Icon(Icons.today),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please select a date';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  width: widthScreen / 1.3,
                  child: TextFormField(
                    controller: timeController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 184, 35, 73)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 184, 35, 73))),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      ),
                      labelStyle: Theme.of(context).textTheme.bodySmall,
                      labelText: 'Time',
                      icon: const Icon(
                        Icons.schedule,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please select a time';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  width: widthScreen / 2.9,
                  height: 35,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(178, 182, 62, 62),
                      borderRadius: BorderRadius.circular(9.5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 1.5,
                            offset: Offset(0, 2))
                      ]),
                  child: TextButton(
                    onPressed: () {
                      CustomAlertBooking(
                          context, "Are you sure you want to log out?");
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
>>>>>>> bb1df48493f5aacdbf2801223904062a0f9c84ab
