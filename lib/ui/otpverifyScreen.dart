import 'dart:convert';
import 'dart:io';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../resources/api_repository.dart';
import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'package:device_info/device_info.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OTPScreen extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<OTPScreen> {
  final _repository = APIRepository();
  int timeInsec = 60;
  String otpCode;
  String phoneNo;

  @override
  void initState() {
    super.initState();

    setState(() {
      otpCode = "1111";
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final OTPRouteArguments args = ModalRoute.of(context).settings.arguments;
    print("In oTp verification${args.phoneno}");
    phoneNo = args.phoneno;
    final textStyle = TextStyle(fontSize: 18);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            // color: Colors.blueGrey,
            padding: const EdgeInsets.all(20.0),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: RichText(
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
                            style: TextStyle(color: Colors.blue, fontSize: 30),
                          ),
                        ]),
                  ),
                ),
                // Image.network(
                //     'https://image.freepik.com/free-vector/security-otp-one-time-password-smartphone-shield_9904-104.jpg'),
                // // SizedBox(height: 20,),
                // Icon(Icons.sms,size:60,color: Colors.amberAccent,),
                SizedBox(height: 50),

                Text("Enter the Code Sent To  +91 $phoneNo",
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
                SizedBox(height: 80),

                OtpTextField(
                  enabledBorderColor: Colors.black87,
                  focusedBorderColor: Colors.blue,
                  numberOfFields: 4,
                  cursorColor: Color(0xFF512DA8),
                  borderColor: Colors.blueAccent,
                  showFieldAsBox:
                      true, //set to true to show as box or false to show as dash
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  onSubmit: (String verificationCode) {
                    sendPhoneDataToServer(verificationCode);
                    // showDialog(
                    //     context: context,
                    //     builder: (context){
                    //       return AlertDialog(
                    //         title: Text("Verification Code"),
                    //         content: Text('Code entered is $verificationCode'),
                    //       );
                    //     }
                    // );
                  }, // end onSubmit
                ),
                SizedBox(
                  height: 30,
                ),
                ArgonTimerButton(
                  initialTimer: timeInsec,
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.45,
                  onTap: (startTimer, btnState) async {
                    if (btnState == ButtonState.Idle) {
                      startTimer(timeInsec);
                      print('End');
                      await resend();
                    }
                  },
                  child: Text(
                    "Resend OTP",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  loader: (timeLeft) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      margin: EdgeInsets.all(5),
                      alignment: Alignment.center,
                      width: 40,
                      height: 40,
                      child: Text(
                        "$timeLeft",
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                      ),
                    );
                  },
                  borderRadius: 5.0,
                  color: Colors.blue,
                ),
                // TimerButton(
                //   label: "Try Again",
                //   timeOutInSeconds: timeInsec,
                //   onPressed: () {
                //     resend();
                //   },
                //   buttonType: ButtonType.OutlineButton,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  sendPhoneDataToServer(data) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      prefs.setString("deviceid", androidInfo.androidId.toString());
      var map = new Map<String, dynamic>();
      map['phone'] = phoneNo.toString();
      map['phoneCode'] = '91';
      map['deviceId'] = androidInfo.androidId;
      map['code'] = '1111';
      print(map);
      _repository.verifyOTPNo(map).then((value) {
        prefs.setBool("isLoggedIn", true);
        print(value.user.id);
        print(value.user.ph);
        print("value.user.ph");
        prefs.setString("id", value.user.id.toString());
        prefs.setString("token", value.token.toString());
        Fluttertoast.showToast(
            msg: value.message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.black87,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.pushNamed(
          context,
          '/HomePage',
        );
      }).catchError((onError) {
        // print(onError);
        print(onError);
        var map = json.decode(onError.message);
        if (map["message"] != '') {
          var mesg = map["message"];
          if (map["code"] == "VALIDATION_ERROR") {
            var validError = map["errors"].values.toList();
            mesg = validError[0];
          }
        } else {
          print("onErrorrr2");
        }
      });
    }
  }

  Future<void> resend() {
    var map = new Map<String, dynamic>();
    map['phone'] = phoneNo.toString();
    map['phoneCode'] = '91';
    _repository.sendOtpToNo(map).then((value) {
      print("In Resen ${value.message}");
      setState(() {
        timeInsec = 60;
      });
      Fluttertoast.showToast(
          msg: value.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.black87,
          textColor: Colors.white,
          fontSize: 16.0);
    }).catchError((onError) {
      // print(onError);
      print(onError.message);
      var map = json.decode(onError.message);
      if (map["message"] != '') {
        var mesg = map["message"];
        if (map["code"] == "VALIDATION_ERROR") {
          var validError = map["errors"].values.toList();
          mesg = validError[0];
        }
      } else {
        print("onErrorrr2");
      }
    });
  }
}
