import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pa_pemo_a1_3_beauty_spa/detail_treatment.dart';

class Treatments {
  final String treatment_name;
  final String pngSrc;
  Treatments({
    required this.treatment_name, 
    required this.pngSrc,
  });
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool switchOn = false; //dark and light theme
  final List <Treatments> _Treatmens = [
    Treatments(treatment_name: "Facial Treatment", pngSrc: "assets/facial.png"),
    Treatments(treatment_name: "Body Massage and Spa", pngSrc: "assets/body-massage.png"),
    Treatments(treatment_name: "Waxing", pngSrc: "assets/waxing.png"),
    Treatments(treatment_name: "Aromatherapy", pngSrc: "assets/aromatherapy.png"),
    Treatments(treatment_name: "Manicure and Pedicure", pngSrc: "assets/manicure-padicure.png"),
    Treatments(treatment_name: "Nail Care Treatment", pngSrc: "assets/nail-care.png"),
    Treatments(treatment_name: "Hair Spa and Hair Mask", pngSrc: "assets/hair-spa.png"),
  ];

  Future<dynamic> getDetailsTreatment(String treatment_name) async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
    .collection("treatments")
    .where("treatment_name", isEqualTo: treatment_name)
    .limit(1)
    .get();

    return snapshot.size > 0;

    // if (snapshot.size > 0) {
    //   final DocumentSnapshot document = snapshot.docs[0];
    //   return document.get('description_treatments');
    // }

    // final database = FirebaseFirestore.instance;
    // final treatmensRef = database.collection("treatments");

    // final QuerySnapshot snapshot = await treatmensRef.get();
    // final List<DocumentSnapshot> documents = snapshot.docs();
    // final Map<dynamic, dynamic> data = snapshot.docs();
  }

  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            alignment: Alignment.topCenter,
            // padding: const EdgeInsets.all(10),
            // alignment: Alignment.center,
            height: heightScreen,
            width: widthScreen,
            padding: const EdgeInsets.all(20),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 2.45,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: _Treatmens.length,
              itemBuilder: (context, index) {
                final treatment = _Treatmens[index];
                return GestureDetector(
                  onTap: () async {
                    bool treatment_exists = await getDetailsTreatment(treatment.treatment_name);
                    if (treatment_exists){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailTreatments(
                          treatment: treatment
                        )),
                      );
                    }
                    
                  },
                  child: Hero(
                    tag: _Treatmens[index],
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            // alignment: Alignment.topCenter,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5)
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                  _Treatmens[index].pngSrc,
                                ),
                                fit: BoxFit.cover
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(_Treatmens[index].treatment_name),
                          ),
                        ],
                      ),
                    )
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
