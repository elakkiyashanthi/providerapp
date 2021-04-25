import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import '../resources/api_repository.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class LogOrSignUpScreen extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<LogOrSignUpScreen> {
  String phone;
  TextEditingController _controller = new TextEditingController();
  final _repository = APIRepository();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // SmsAutoFill().unregisterListener();
    // cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print( 'Backbutton pressed (device or appbar button), do whatever you want.');

        exit(0);
      },
      child: Scaffold(
        // resizeToAvoidBottomPadding: false,
        body: SafeArea(
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
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
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, top: 40.0, right: 16.0),
                      child: Text(
                        "We need to text you  the OTP to authenticate  your account.",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Image(
                        image: AssetImage('assets/otp-icon.png'),
                        height: 120.0,
                        width: 120.0,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: new Container(),
                          flex: 1,
                        ),
                        Flexible(
                          child: new TextFormField(
                            textAlign: TextAlign.center,
                            autofocus: false,
                            enabled: false,
                            initialValue: "+91",
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.black),
                          ),
                          flex: 3,
                        ),
                        Flexible(
                          child: new Container(),
                          flex: 1,
                        ),
                        Flexible(
                          child: TextField(
                            decoration: new InputDecoration(
                              counterText: "",
                              counterStyle: TextStyle(fontSize: 0),
                              hintText: "Enter Mobile No",
                              // border: InputBorder.none,
                              hintStyle: TextStyle(
                                  color: Colors.black, fontSize: 15.0),
                            ),
                            keyboardType: TextInputType.number,
                            maxLength: 10,
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.black),
                            controller: _controller,
                            onChanged: (text) {
                              phone = text;
                            },
                          ),
                          flex: 9,
                        ),
                        Flexible(
                          child: new Container(),
                          flex: 1,
                        ),
                        Flexible(
                          child: new Container(),
                          flex: 1,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0, bottom: 40.0),
                      child: new RaisedButton(
                          onPressed: () {
                            // print("_controller.text${_controller.text}");
                            sendPhoneDataToServer();
                            // Navigator.of(context).pushNamed('/OtpScreen');
                          },
                          child: Text("Get OTP"),
                          textColor: Colors.white,
                          color: Colors.blue,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0))),
                    )
                  ])
            ],
          ),
        ),
      ),
    );
  }

  sendPhoneDataToServer() {
    print("sendPhoneDataToServer");
    var newPhone = _controller.text;
    var map = new Map<String, dynamic>();
    map['phone'] = newPhone.toString();
    map['phoneCode'] = '91';
    _repository.sendOtpToNo(map).then((value) {
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
        '/OtpScreen',
        arguments: OTPRouteArguments(phoneno: _controller.text),
      );
      _controller.clear();
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
