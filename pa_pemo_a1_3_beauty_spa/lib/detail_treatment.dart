import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pa_pemo_a1_3_beauty_spa/booking_page.dart';
import 'package:pa_pemo_a1_3_beauty_spa/home_page.dart';
import 'package:pa_pemo_a1_3_beauty_spa/treatment.dart';
import 'package:pa_pemo_a1_3_beauty_spa/treatment_provider.dart';
import 'package:provider/provider.dart';

class DetailTreatments extends StatefulWidget {
  final Treatments treatment;
  DetailTreatments({Key? key, required this.treatment}) : super(key: key);

  @override
  State<DetailTreatments> createState() => _DetailTreatmentsState();
}

class _DetailTreatmentsState extends State<DetailTreatments> {
  String description_tratments = '';
  String price = '';

  @override
  void initState() {
    super.initState();
    getDetailsTreatment(widget.treatment.treatment_name);
  }

  Future<void> getDetailsTreatment(String treatment_name) async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("treatments")
        .where("treatment_name", isEqualTo: treatment_name)
        .limit(1)
        .get();

    if (snapshot.size > 0) {
      final DocumentSnapshot document = snapshot.docs[0];
      setState(() {
        description_tratments = document.get("description_treatments");
        price = document.get("price");
      });
    }
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
        child: ListView(children: [
          Container(
            alignment: Alignment.topLeft,
            height: heightScreen,
            width: widthScreen / 1.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(200),
                  bottomRight: Radius.circular(200)),
              color: Color.fromARGB(255, 236, 123, 176),
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
                        icon: Icon(
                          Icons.arrow_back_ios,
                        ),
                        color: Colors.white,
                        iconSize: 20,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Text(
                      widget.treatment.treatment_name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(widget.treatment.pngSrc),
                    radius: 100,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 5, top: 5),
                  child: Text(
                    '$description_tratments',
                    maxLines: 20,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 5, top: 5),
                  child: Text(
                    'Price: Rp$price',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            ' Booking Now   ',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        Icon(
                          Icons.forward,
                          size: 25,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    Ink(
                      decoration: const ShapeDecoration(
                        color: Color.fromRGBO(253, 80, 146, 1),
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.assignment_add,
                        ),
                        color: Colors.white,
                        iconSize: 20,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return BookingPage(
                              treatment: widget.treatment,
                              // price: price
                            );
                          }));
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
