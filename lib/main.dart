import 'package:providerapp/ui/addOffer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './ui/phoneVerify.dart';
import 'ui/detail_page.dart';
import 'ui/homepage_screen.dart';
import 'ui/logout_screen.dart';
import 'ui/otpverifyScreen.dart';
import 'ui/splashScreen.dart';

void main() => runApp(MaterialApp(
      title: 'company',
      // theme: myTheme,
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/LogoutScreen': (BuildContext context) => LogoutScreen(),
        '/HomePage': (BuildContext context) => HomePage(),
        '/splashScreen': (BuildContext context) => WelcomePage(),
        '/OtpScreen': (BuildContext context) => OTPScreen(),
        '/phoneScreen': (BuildContext context) => LogOrSignUpScreen(),
        '/detailPage': (BuildContext context) => DetailPage(),

        '/addOffer': (BuildContext context) => AddOffer(),
        // '/editOffer':(BuildContext context)=> EditOffer(),
      },
      home: WelcomePage(),
    ));

class OTPRouteArguments {
  final String phoneno;
  OTPRouteArguments({this.phoneno});
}

class OfferRouteArguments {
  final String image;
  final String title;
  final String desc;
  final String validty;
  final String companyId;
  final String sid;
  final String cat;

  OfferRouteArguments(
      {this.image,
      this.title,
      this.desc,
      this.validty,
      this.companyId,
      this.sid,
      this.cat});
}
