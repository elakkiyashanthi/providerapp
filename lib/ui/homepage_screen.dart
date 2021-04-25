import 'dart:io';
import 'package:providerapp/models/offer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import '../models/profile.dart';
import '../resources/api_repository.dart';
import 'package:image_picker/image_picker.dart';

import 'editOffer.dart';

class HomePage extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<HomePage> {
  Future<Profile> profileDetails;
  Future<Offer> offerdetailsDetails;
  final FocusNode myFocusNode = FocusNode();
  final _repository = APIRepository();

  bool camShow = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    callList();
    callOfferList();
  }

  Future<void> callOfferList() async {
    try {
      setState(() {
        offerdetailsDetails = _repository.getCompanyOffer();
      });
    } catch (err) {
      print(err);
    }
  }

  Future<void> callList() async {
    try {
      setState(() {
        profileDetails = _repository.getCompanyProfile();
      });
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print(
            'Backbutton pressed (device or appbar button), do whatever you want.');
        //trigger leaving and use own data
        // Navigator.pop(context, false);
        //we need to return a future
        exit(0);
      },
      child: SafeArea(
        child: Scaffold(
          // extendBodyBehindAppBar: true,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(45.0),
            child: AppBar(
              centerTitle: true,
              title: Text(" Your Offer  "),
              backgroundColor: Colors.blue,
              elevation: 0.0,
            ),
          ),
          drawer: Container(
              width: MediaQuery.of(context).size.width * 0.65,
              child: FutureBuilder<Profile>(
                future: profileDetails,
                builder: (context, AsyncSnapshot<Profile> snapshot) {
                  if (snapshot.connectionState != ConnectionState.done)
                    return Text("Loading");
                  if (snapshot.hasData) {
                    if (snapshot.data.user != null)
                      return Drawer(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 25,
                            ),
                            DrawerHeader(
                              child: Center(
                                child: Text(
                                  '${snapshot.data.user.name}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  // color: Colors.green,
                                  image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  "http://35.240.193.71:3002/" +
                                      snapshot.data.user.img,
                                  // fit: BoxFit.cover,
                                ),
                                // AssetImage('assets/scene1.png')
                              )),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.person,
                                color: Colors.blue,
                              ),
                              title: Text('Profile'),
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/detailPage',
                                );
                              },
                            ),

                            ListTile(
                              leading: Icon(
                                Icons.qr_code,
                                color: Colors.blue,
                              ),
                              title: Text('Scan Code'),
                              onTap: () => {Navigator.of(context).pop()},
                            ),

                            ListTile(
                              leading: Icon(
                                Icons.exit_to_app,
                                color: Colors.blue,
                              ),
                              title: Text('Logout'),
                              onTap: () async {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.clear();
                                Navigator.pushNamed(
                                  context,
                                  '/splashScreen',
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    else
                      return Center(child: Text("No Data Found"));
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  return Text("Loading");
                },
              )),
          body: FutureBuilder<Offer>(
            future: offerdetailsDetails,
            builder: (context, AsyncSnapshot<Offer> snapshot) {
              if (snapshot.connectionState != ConnectionState.done)
                return Center(child: Text("Loading"));
              if (snapshot.hasData) {
                if (snapshot.data.data.title != null) {
                  return ListView(
                    children: [
                      SizedBox(
                        height: 1,
                      ),
                      Image.network(
                        'http://35.240.193.71:3002/${snapshot.data.data.image}',
                        width: 600,
                        height: 240,
                        fit: BoxFit.fill,
                      ),
                      Container(
                        padding: const EdgeInsets.all(32),
                        child: Row(
                          children: [
                            Expanded(
                              /*1*/
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /*2*/
                                  Container(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Text(
                                      snapshot.data.data.title,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    DateFormat("MMMM-dd-yyyy hh:mm a").format(
                                        DateTime.parse(
                                            snapshot.data.data.validty)),
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditOffer(
                                        snapshot.data.data.image,
                                         snapshot.data.data.title,
                                         snapshot.data.data.desc,
                                         snapshot.data.data.validty,
                                         snapshot.data.data.companyId,
                                        snapshot.data.data.sId,
                                      snapshot.data.data.cAt,
                                    ),
                                  ),
                                );
                                // Navigator.pushNamed(
                                //   context,
                                //   '/editOffer',
                                //   arguments: OfferRouteArguments(
                                //     image: snapshot.data.data.image,
                                //     title: snapshot.data.data.image,
                                //     desc: snapshot.data.data.desc,
                                //     companyId: snapshot.data.data.companyId,
                                //     sid:snapshot.data.data.sId
                                //   ),
                                // );
                              },
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(3, 15, 4, 4),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(32),
                        child: Text(
                          snapshot.data.data.desc,
                          softWrap: true,
                        ),
                      ),
                    ],
                  );
                }
              }
              return Center(
                child: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/addOffer',
                    );
                  },
                  // icon: Icon(Icons.add),
                  label: Text("Add Offer"),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }
}
