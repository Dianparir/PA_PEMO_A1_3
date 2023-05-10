import 'package:flutter/material.dart';
import 'dialog.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        height: heightScreen,
        width: widthScreen,
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              height: heightScreen / 5,
              width: widthScreen,
              color: Color.fromARGB(255, 243, 127, 166),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.account_circle, size: 100),
                  SizedBox(width: 20),
                  Text("Nama User", style: TextStyle(fontSize: 30)),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(
                'My Profile',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/profilePage');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: Text(
                'Settings',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/settingsPage');
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title:
                  Text("Log Out", style: Theme.of(context).textTheme.bodySmall),
              onTap: () {
                CustomAlert(context, "Are you sure you want to log out?");
                //Navigator.pushNamed(context, '/loginPage');
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: Text(
                'About',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/aboutPage');
              },
            ),
          ],
        ),
      ),
    );
  }
}
