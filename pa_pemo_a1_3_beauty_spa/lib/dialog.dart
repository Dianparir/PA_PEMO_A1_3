import 'package:flutter/material.dart';
import 'package:pa_pemo_a1_3_beauty_spa/bottom_nav_bar.dart';

Future<dynamic> CustomAlert(BuildContext context, String pesan) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Log out",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          content: Text(
            pesan,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child:
                    Text("No", style: Theme.of(context).textTheme.bodySmall)),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/landingPage');
              },
              child: Text(
                "Yes",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        );
      });
}

Future<dynamic> CustomAlertBooking(BuildContext context, String pesan, Null Function() param2) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Submit",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          content: Text(
            pesan,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child:
                    Text("No", style: Theme.of(context).textTheme.bodySmall)),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (_) {
                    return BottomNavItem();
                }));
                // Navigator.of(context).pop();
                if (param2 != null) {
                  param2();
                }
              },
              child: Text(
                "Yes",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        );
      });
}


