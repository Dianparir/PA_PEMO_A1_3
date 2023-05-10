import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'home_page.dart';
import 'dialog.dart';

List<String> list = <String>[
  "07.00-10.00",
  "09.00-12.00",
  "13.00-15.00",
  "15.00-17.00",
  "19.00-21.00"
];

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  // BookingPage({super.key, required this.nama_Treatment});

  // final String nama_Treatment;

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  bool? data = false;

  // late String _valTime; //simpan value data time
  // List _listTime = [
  //   "07.00-10.00",
  //   "09.00-12.00",
  //   "13.00-15.00",
  //   "15.00-17.00",
  //   "19.00-21.00"
  // ]; //Array time

  String dropdownValue = list.first;

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
            Container(
              alignment: Alignment.topCenter,
              height: heightScreen,
              width: widthScreen / 1.5,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(200),
                    topRight: Radius.circular(200)),
                color: Color.fromARGB(255, 255, 183, 213),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Ink(
                        decoration: const ShapeDecoration(
                          color: Color.fromRGBO(253, 80, 146, 1),
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios,
                          ),
                          color: Colors.white,
                          iconSize: 20,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      //Text('Booking'),
                      Container(
                        alignment: Alignment.topCenter,
                        child: const CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/beauty_spa_logo2.png"),
                          radius: 50,
                        ),
                      ),
                      Ink(
                        decoration: const ShapeDecoration(
                          color: Colors.white,
                          shape: CircleBorder(),
                        ),
                        child: const Icon(
                          Icons.spa,
                          color: Color.fromRGBO(253, 80, 146, 1),
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: widthScreen / 1.3,
                    child: TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 184, 35, 73)),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 184, 35, 73))),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
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
                  const SizedBox(
                    height: 35,
                  ),
                  Container(
                    width: widthScreen / 1.3,
                    child: TextFormField(
                      controller: dateController,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 184, 35, 73)),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 184, 35, 73))),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
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
                  const SizedBox(
                    height: 35,
                  ),
                  Container(
                    width: widthScreen / 1.3,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.schedule,
                          size: 25,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: widthScreen / 1.46,
                          height: 55,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: Color.fromARGB(255, 184, 35, 73)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            icon: const Icon(Icons.arrow_drop_down),
                            elevation: 16,
                            style: const TextStyle(color: Colors.black),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                dropdownValue = value!;
                              });
                            },
                            items: list
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),

                          // TextFormField(
                          //   controller: timeController,
                          //   keyboardType: TextInputType.text,
                          //   decoration: InputDecoration(
                          //     enabledBorder: OutlineInputBorder(
                          //       borderSide: BorderSide(
                          //           color: Color.fromARGB(255, 184, 35, 73)),
                          //     ),
                          //     focusedBorder: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(100),
                          //         borderSide: BorderSide(
                          //             color: Color.fromARGB(255, 184, 35, 73))),
                          //     border: OutlineInputBorder(
                          //       borderRadius: BorderRadius.all(Radius.circular(100)),
                          //     ),
                          //     labelStyle: Theme.of(context).textTheme.bodySmall,
                          //     labelText: 'Time',
                          //     icon: const Icon(
                          //       Icons.schedule,
                          //     ),
                          //   ),
                          //   validator: (value) {
                          //     if (value!.isEmpty) {
                          //       return 'please select a time';
                          //     }
                          //     return null;
                          //   },
                          // ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Container(
                    width: widthScreen / 2.9,
                    height: 35,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(178, 182, 62, 62),
                        borderRadius: BorderRadius.circular(9.5),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 0,
                              blurRadius: 1.5,
                              offset: const Offset(0, 2))
                        ]),
                    child: TextButton(
                      onPressed: () {
                        CustomAlertBooking(
                            context, "Are you sure you want to log out?");
                      },
                      child: const Text(
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
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     Ink(
            //       decoration: const ShapeDecoration(
            //         color: Color.fromRGBO(255, 64, 129, 1),
            //         shape: CircleBorder(),
            //       ),
            //       child: IconButton(
            //         icon: Icon(
            //           Icons.arrow_back_ios,
            //         ),
            //         color: Colors.white,
            //         iconSize: 15,
            //         onPressed: () {
            //           Navigator.pop(context);
            //         },
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(
              height: 35,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container(
                //   width: widthScreen / 1.3,
                //   child: TextFormField(
                //     controller: nameController,
                //     keyboardType: TextInputType.name,
                //     decoration: InputDecoration(
                //       enabledBorder: OutlineInputBorder(
                //         borderSide:
                //             BorderSide(color: Color.fromARGB(255, 184, 35, 73)),
                //       ),
                //       focusedBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(7.0),
                //           borderSide: BorderSide(
                //               color: Color.fromARGB(255, 184, 35, 73))),
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(7.0)),
                //       ),
                //       labelStyle: Theme.of(context).textTheme.bodySmall,
                //       labelText: 'Full Name',
                //       icon: const Icon(Icons.person_outline),
                //     ),
                //     validator: (value) {
                //       if (value!.isEmpty) {
                //         return 'Please input your name';
                //       }
                //       return null;
                //     },
                //   ),
                // ),
                // SizedBox(
                //   height: 35,
                // ),
                // Container(
                //   width: widthScreen / 1.3,
                //   child: TextFormField(
                //     controller: dateController,
                //     keyboardType: TextInputType.datetime,
                //     decoration: InputDecoration(
                //       enabledBorder: OutlineInputBorder(
                //         borderSide:
                //             BorderSide(color: Color.fromARGB(255, 184, 35, 73)),
                //       ),
                //       focusedBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(7.0),
                //           borderSide: BorderSide(
                //               color: Color.fromARGB(255, 184, 35, 73))),
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(7.0)),
                //       ),
                //       labelStyle: Theme.of(context).textTheme.bodySmall,
                //       labelText: 'Date',
                //       icon: const Icon(Icons.today),
                //     ),
                //     validator: (value) {
                //       if (value!.isEmpty) {
                //         return 'please select a date';
                //       }
                //       return null;
                //     },
                //   ),
                // ),
                // SizedBox(
                //   height: 35,
                // ),
                // Container(
                //   width: widthScreen / 1.3,
                //   child: TextFormField(
                //     controller: timeController,
                //     keyboardType: TextInputType.text,
                //     decoration: InputDecoration(
                //       enabledBorder: OutlineInputBorder(
                //         borderSide:
                //             BorderSide(color: Color.fromARGB(255, 184, 35, 73)),
                //       ),
                //       focusedBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(7.0),
                //           borderSide: BorderSide(
                //               color: Color.fromARGB(255, 184, 35, 73))),
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(7.0)),
                //       ),
                //       labelStyle: Theme.of(context).textTheme.bodySmall,
                //       labelText: 'Time',
                //       icon: const Icon(
                //         Icons.schedule,
                //       ),
                //     ),
                //     validator: (value) {
                //       if (value!.isEmpty) {
                //         return 'please select a time';
                //       }
                //       return null;
                //     },
                //   ),
                // ),
                // SizedBox(
                //   height: 35,
                // ),
                // Container(
                //   width: widthScreen / 2.9,
                //   height: 35,
                //   decoration: BoxDecoration(
                //       color: Color.fromARGB(178, 182, 62, 62),
                //       borderRadius: BorderRadius.circular(9.5),
                //       boxShadow: [
                //         BoxShadow(
                //             color: Colors.black.withOpacity(0.2),
                //             spreadRadius: 0,
                //             blurRadius: 1.5,
                //             offset: Offset(0, 2))
                //       ]),
                //   child: TextButton(
                //     onPressed: () {
                //       CustomAlertBooking(
                //           context, "Are you sure you want to log out?");
                //     },
                //     child: Text(
                //       "Submit",
                //       style: TextStyle(
                //           color: Colors.white,
                //           fontWeight: FontWeight.bold,
                //           fontSize: 16),
                //     ),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
