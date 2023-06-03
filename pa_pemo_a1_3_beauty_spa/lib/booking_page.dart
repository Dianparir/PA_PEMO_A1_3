import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home_page.dart';
import 'dialog.dart';

class BookingPage extends StatefulWidget {
  final Treatments treatment;
  BookingPage({required this.treatment});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final TextEditingController treatmentNameController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();
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
  String tgl = tanggalController.text.trim();
  String? jam = _selectedTime;

  // Mengambil email pengguna yang sudah login
    User? user = FirebaseAuth.instance.currentUser;
    String? userEmail;

    if (user != null) {
      userEmail = user.email;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Tidak dapat menambahkan pesanan karena tidak ada pengguna yang sudah login.')),
      );
      return;
    }

  FirebaseFirestore.instance.collection("schedule").add({
    'treatment_name': treatment_name,
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
                        labelText: "${widget.treatment.treatment_name}",
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
                    child: TextFormField(
                      controller: tanggalController,
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
                            items: jamTreatment.map<DropdownMenuItem<String>>((String value) {
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
