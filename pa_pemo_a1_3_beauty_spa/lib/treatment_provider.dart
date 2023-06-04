import 'package:flutter/foundation.dart';
import 'package:pa_pemo_a1_3_beauty_spa/treatment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TreatmentProvider with ChangeNotifier {
  final List<Treatments> _Treatmens = [
    Treatments(
        treatment_name: "Facial Treatment",
        pngSrc: "assets/facial.png",
        price: 50000),
    Treatments(
        treatment_name: "Body Massage and Spa",
        pngSrc: "assets/body-massage.png",
        price: 200000),
    Treatments(
        treatment_name: "Waxing", pngSrc: "assets/waxing.png", price: 100000),
    Treatments(
        treatment_name: "Aromatherapy",
        pngSrc: "assets/aromatherapy.png",
        price: 275000),
    Treatments(
        treatment_name: "Manicure and Pedicure",
        pngSrc: "assets/manicure-padicure.png",
        price: 150000),
    Treatments(
        treatment_name: "Nail Care Treatment",
        pngSrc: "assets/nail-care.png",
        price: 150000),
    Treatments(
        treatment_name: "Hair Spa and Hair Mask",
        pngSrc: "assets/hair-spa.png",
        price: 60000),
  ];

  List<Treatments> get items {
    return [..._Treatmens];
  }

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
}
