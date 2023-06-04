import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pa_pemo_a1_3_beauty_spa/detail_treatment.dart';
import 'package:pa_pemo_a1_3_beauty_spa/treatment_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool switchOn = false; //dark and light theme

  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;

    var _TreatmensProvider = Provider.of<TreatmentProvider>(context);

    var _Treatmens = _TreatmensProvider.items;
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
                    bool treatment_exists =
                        await _TreatmensProvider.getDetailsTreatment(
                            treatment.treatment_name);
                    if (treatment_exists) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailTreatments(treatment: treatment)),
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
                                    bottomRight: Radius.circular(5)),
                                image: DecorationImage(
                                    image: AssetImage(
                                      _Treatmens[index].pngSrc,
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(_Treatmens[index].treatment_name),
                            ),
                          ],
                        ),
                      )),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
