import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pa_pemo_a1_3_beauty_spa/booking_page.dart';

class DetailTreatmentPage extends StatelessWidget {
   DetailTreatmentPage({super.key, required this.name_treatment});
   final String name_treatment;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: (){
          // BookingPage(namaTreatment: name_treatment,);
        },
        child: Container()),
    );
  }
}