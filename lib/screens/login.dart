import 'package:flutter/material.dart';
import 'package:login_and_signup_pages/screens/sign_up.dart';
import '../constant/colors.dart';

class LogIN_Screen extends StatefulWidget {
  const LogIN_Screen({Key? key}) : super(key: key);

  @override
  State<LogIN_Screen> createState() => _LogIN_ScreenState();
}

class _LogIN_ScreenState extends State<LogIN_Screen> {
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode1.addListener(() {
      setState(() {});
    });
    _focusNode2.addListener(() {
      setState(() {});
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              image(),
              SizedBox(height: 20),
              textfield_email(email, _focusNode1, 'Email', Icons.email),
              SizedBox(height: 10),
              textfield_email(password, _focusNode2, 'Password', Icons.lock),
              SizedBox(height: 8),
              account(),
              SizedBox(height: 20),
              loginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Padding account() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Don't have an account?",
            style: TextStyle(color: Colors.grey[700], fontSize: 14),
          ),
          SizedBox(width: 5),
          GestureDetector(
            onTap: () { Navigator.push( context,  MaterialPageRoute(builder: (context) => Sign_up_Screen()));},
            child: Text(
              "Sign Up",
              style: TextStyle(
                  color: custom_green,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Padding loginButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: custom_green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
            ),
          ),
        ),
    );
  }

  Widget textfield_email(TextEditingController _controller,
      FocusNode _focusNode,
      String typename,
      IconData iconss) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller: _controller,
          focusNode: _focusNode,
          style: TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
            prefixIcon: Icon(iconss),
            prefixIconColor:
            _focusNode.hasFocus ? custom_green : Color(0xffc5c5c5),
            contentPadding:
            EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: typename,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Color(0xffc5c5c5),
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: custom_green,
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding image() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        width: double.infinity,
        height: 400,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/Login-amico_min.png'), fit: BoxFit.contain, colorFilter: ColorFilter.mode(Colors.grey.shade100,BlendMode.modulate),

            ) ),
      ),
    );
  }
}