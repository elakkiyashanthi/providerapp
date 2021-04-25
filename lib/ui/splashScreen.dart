import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    //neqqfn();
    checkAlreadyLoggedInOrNot();
  }

  checkAlreadyLoggedInOrNot() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var via = prefs.getString('token');
    print("via$via");
    if (via != null && via != '') {
      //redirect them

      Navigator.pushNamed(
        context,
        '/HomePage',
      );
    } else
      Navigator.pushNamed(
        context,
        '/phoneScreen',
      );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'on',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            // color: Colors.white,
          ),
          children: [
            TextSpan(
              text: 'D',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'way',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(child: _title()),
    );
  }
}
