import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pa_pemo_a1_3_beauty_spa/treatment.dart';
import 'home_page.dart';
import 'dialog.dart';
import 'package:intl/intl.dart';

class BookingPage extends StatefulWidget {
  final Treatments treatment;
  BookingPage({required this.treatment});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final TextEditingController treatmentNameController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController _datecontroller = TextEditingController();
  String? _selectedTime;

  List<String> jamTreatment = <String>[
    "07.00-10.00",
    "09.00-12.00",
    "13.00-15.00",
    "15.00-17.00",
    "19.00-21.00"
  ];

  void saveScheduleToFirestore() {
    String treatment_name = widget.treatment.treatment_name;
    int treatment_price = widget.treatment.price;
    String tgl = _datecontroller.text;

    String? jam = _selectedTime;

    // Mengambil email pengguna yang sudah login
    User? user = FirebaseAuth.instance.currentUser;
    String? userEmail;

    if (user != null) {
      userEmail = user.email;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Tidak dapat menambahkan pesanan karena tidak ada pengguna yang sudah login.')),
      );
      return;
    }

    FirebaseFirestore.instance.collection("schedule").add({
      'treatment_name': treatment_name,
      'harga': treatment_price,
      'date': tgl,
      'time': jam,
      'email': userEmail,
      'timestamp': FieldValue.serverTimestamp(),
    }).then((value) {
      print('Data pesanan berhasil ditambahkan ke Firestore.');
    }).catchError((error) {
      print('Gagal menambahkan data pesanan ke Firestore: $error');
    });
  }

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
                  Text("Beauty Spa's Booking Page",
                      style: Theme.of(context).textTheme.titleSmall),
                  SizedBox(height: 35),
                  Container(
                    width: widthScreen / 1.3,
                    child: TextFormField(
                      controller: treatmentNameController,
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
                        hintText: "${widget.treatment.treatment_name}",
                        icon: const Icon(Icons.person_outline),
                      ),
                      readOnly: true,
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Container(
                    width: widthScreen / 1.3,
                    child: TextField(
                        // controller: tanggalController,
                        // keyboardType: TextInputType.datetime,
                        // decoration: InputDecoration(
                        //   enabledBorder: const OutlineInputBorder(
                        //     borderSide: BorderSide(
                        //         color: Color.fromARGB(255, 184, 35, 73)),
                        //   ),
                        //   focusedBorder: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(100),
                        //       borderSide: const BorderSide(
                        //           color: Color.fromARGB(255, 184, 35, 73))),
                        //   border: const OutlineInputBorder(
                        //     borderRadius: BorderRadius.all(Radius.circular(100)),
                        //   ),
                        //   labelStyle: Theme.of(context).textTheme.bodySmall,
                        //   labelText: 'Date',
                        //   icon: const Icon(Icons.today),
                        // ),
                        controller: _datecontroller,
                        // keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          labelText: 'Birth',
                          icon: Icon(Icons.calendar_today),
                        ),
                        readOnly:
                            true, //set it true, so that user will not able to edit text
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(
                                  2000), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            print(
                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(
                                formattedDate); //formatted date output using intl package =>  2021-03-16
                            //you can implement different kind of Date Format here according to your requirement

                            setState(() {
                              _datecontroller.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          } else {
                            print("Date is not selected");
                          }
                        }),
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
                          width: widthScreen / 1.5,
                          height: 55,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: Color.fromARGB(255, 184, 35, 73)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: DropdownButton<String>(
                            value: _selectedTime,
                            icon: const Icon(Icons.arrow_drop_down),
                            elevation: 16,
                            style: TextStyle(color: Colors.black),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                _selectedTime = value!;
                              });
                            },
                            items: jamTreatment
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
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
                        CustomAlertBooking(context,
                            "Are you sure you want to booking this treatment?");
                        saveScheduleToFirestore();
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
          ],
        ),
      ),
    );
  }
}
