<<<<<<< HEAD
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

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

Future<dynamic> CustomAlertBooking(BuildContext context, String pesan) {
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
              onPressed: () {},
              child: Text(
                "Yes",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        );
      });
}
=======
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

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

Future<dynamic> CustomAlertBooking(BuildContext context, String pesan) {
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
              onPressed: () {},
              child: Text(
                "Yes",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        );
      });
}
>>>>>>> bb1df48493f5aacdbf2801223904062a0f9c84ab
