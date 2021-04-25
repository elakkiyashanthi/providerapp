
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutScreen extends StatelessWidget {
  BuildContext context;



  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Container(
      color: Colors.transparent,
      child: AlertDialog(
        // backgroundColor: Colors.indigo,
        title: new Text("Logout Screen"),
        content: new Text("Are You Share You Want to Exit"),
        actions: <Widget>[
          FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/HomePage');
              }),
          FlatButton(
              child: Text('Ok'),
              onPressed: () {
                disposeAllTheDetails();
                Navigator.pushReplacementNamed(context, '/splashScreen');

                // Navigator.pushReplacement(context,
                //     MaterialPageRoute(builder: (context) => SplashScreen()));
              }),
          // Navigator.of(context).pop();
          // })
        ],
      ),
    );
  }

  Future<void> disposeAllTheDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLoggedIn", false);

  }
}
