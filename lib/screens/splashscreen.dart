import 'package:flutter/material.dart';
import 'package:login_and_signup_pages/screens/home.dart';
import 'package:login_and_signup_pages/screens/login.dart';
import 'package:login_and_signup_pages/services/preferences.service.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? finalEmail;
int x = 0;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getValidationData().whenComplete(() async {
      Future.delayed(
          Duration(seconds: 3),
          () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      finalEmail == null ? LogIN_Screen() : MyHomePage())));
    });
    super.initState();
  }

  Future getValidationData() async {
    PrefrencesService.logpref = await SharedPreferences.getInstance();
    var obtainedEmail = PrefrencesService.logpref?.getString('email');
    finalEmail = obtainedEmail;
    print(finalEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: 400,
          height: 370,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/Hello.png'),
            fit: BoxFit.contain,
            colorFilter:
                ColorFilter.mode(Colors.grey.shade100, BlendMode.modulate),
          )),
        ),
      ),
    );
  }
}
