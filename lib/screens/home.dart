import 'package:flutter/material.dart';
import 'package:login_and_signup_pages/constant/colors.dart';
import 'package:login_and_signup_pages/screens/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login_and_signup_pages/screens/login.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: custom_green,
        title: Text('My App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Text("Welcome $finalEmail !"),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () async {
                final SharedPreferences log_pref =
                    await SharedPreferences.getInstance();
                log_pref.remove('email');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LogIN_Screen()));
              },
              color: Colors.red,
              child: Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}