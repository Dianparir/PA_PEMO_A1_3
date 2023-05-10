import 'package:flutter/material.dart';

class DetailTreatmentPage extends StatefulWidget {
  const DetailTreatmentPage({super.key});

  @override
  State<DetailTreatmentPage> createState() => _DetailTreatmentPageState();
}

class _DetailTreatmentPageState extends State<DetailTreatmentPage> {
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
                  iconSize: 20,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            height: heightScreen,
            width: widthScreen,
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse viverra, nisi at eleifend vestibulum, tellus nulla placerat nibh, vitae sodales enim purus a libero. Nullam rutrum augue ligula. Integer suscipit felis dignissim ante faucibus, sit amet convallis urna elementum. Vestibulum gravida tortor eu erat fringilla accumsan. Aenean quis ullamcorper libero. Aliquam bibendum sem non ligula interdum, ut sagittis lectus aliquam. Donec dictum, neque et rhoncus scelerisque, mauris orci faucibus ex, at euismod orci orci sed risus. Sed mattis turpis id molestie viverra. Morbi convallis, ipsum eget cursus placerat, odio ligula blandit dolor, eget pretium felis orci non ligula.',
              maxLines: 20,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            height: 50,
            width: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/bookingPage');
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color.fromRGBO(255, 98, 151, 1) // foreground
                  ),
              child: ListTile(
                trailing:
                    Icon(Icons.create, color: Color.fromARGB(178, 182, 62, 62)),
                title: Text(
                  "Booking Now",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
