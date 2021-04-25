import 'dart:convert';

import 'package:providerapp/models/profile.dart';
import 'package:providerapp/resources/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'dart:math';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

const kGoogleApiKey = "AIzaSyCTyCb06T6VpIAr07qOHZJQfYLy3oVHqn4";

class DetailPage extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();
}

GlobalKey<ScaffoldState> homeScaffoldKey = GlobalKey<ScaffoldState>();
GlobalKey<ScaffoldState>  searchScaffoldKey = GlobalKey<ScaffoldState>();

class MapScreenState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  File _image;

  Future<Profile> profileDetails;
  String path = '';
  final FocusNode myFocusNode = FocusNode();
   TextEditingController controller = TextEditingController();
  FocusNode _focusNode = new FocusNode();
  TextEditingController _namecontroller = new TextEditingController();
  TextEditingController _phonecontroller= new TextEditingController();
  TextEditingController _emailcontroller = new TextEditingController();
  TextEditingController _websitecontroller = new TextEditingController();
  TextEditingController _addresscontroller = new TextEditingController();
  TextEditingController _tagcontroller = new TextEditingController();
  TextEditingController _contactcontroller = new TextEditingController();
  final _repository = APIRepository();
  dynamic lat, lng;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callList();
  }

  Future<void> callList() async {
    try {
      setState(() {
        _repository.getCompanyProfile().then((value) {
          _namecontroller.text = value.user.name;
          _emailcontroller.text = value.user.mail;
          _phonecontroller.text = value.user.ph.toString();
          _websitecontroller.text = value.user.web;
          _tagcontroller.text = value.user.tag;
          _addresscontroller.text = value.user.address;
          _contactcontroller.text = value.user.contactNo;
          path = value.user.img;
          lng = value.user.cords.first;
          lat = value.user.cords.last;
          print(path);
        });
      });
    } catch (err) {
      print(err);
    }
  }

  _imgFromCamera() async {
    final image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);
    _repository.FileUpload("fwwwwwwwww", image).then((value) {
      setState(() {
        path = value.path;
        _image = image;
      });
    }).catchError((onError) {
      print("error");
    });
  }

  //galley
  _imgFromGallery() async {
    final image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);
    _repository.FileUpload("fwwwwwwwww", image).then((value) {
      setState(() {
        path = value.path;
        _image = image;
      });
    }).catchError((onError) {
      print("error");
    });
  }

  //show options
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  final _formKey = GlobalKey<FormState>();
  Mode _mode = Mode.overlay;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        key: homeScaffoldKey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            centerTitle: true,
            title: Text('About Company',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    fontFamily: 'sans-serif-light',
                    color: Colors.black)),
          ),
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 5,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Form(
              key: _formKey,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                          width: 120.0,
                          height: 100.0,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(75, 45, 0, 0),
                            child: CircleAvatar(
                              // backgroundColor: Colors.blue,
                              radius: 1.0,
                              child: GestureDetector(
                                onTap: () {
                                  _showPicker(context);
                                },
                                child: new Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                              image: path != ''
                                  ? NetworkImage(
                                      'http://35.240.193.71:3002/${path}',
                                      // width: 600,
                                      // height: 240,
                                      // fit: BoxFit.fill,
                                    )
                                  : ExactAssetImage('assets/as.png'),
                              fit: BoxFit.cover,
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _namecontroller,
                    decoration: InputDecoration(
                      hintText: "Name",
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter name';
                      }
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(

                    keyboardType: TextInputType.emailAddress,
                    controller: _emailcontroller,
                    decoration: InputDecoration(
                      hintText: "Email",
                    ),
                    // maxLines: 3,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter Email';
                      }
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: _phonecontroller,
                    decoration: InputDecoration(
                      hintText: "Mobile No",
                    ),
                    // maxLines: 3,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter Phone Number';
                      }
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: _contactcontroller,
                    decoration: InputDecoration(
                      hintText: "Contact No",
                    ),
                    // maxLines: 3,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter Contact Number';
                      }
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(

                    child: TextFormField(
                      readOnly: true,

                      controller: _addresscontroller,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: _handlePressButton,
                          icon: Icon(Icons.clear),
                        ),
                        hintText: "Address",
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.url,
                    controller: _websitecontroller,
                    decoration: InputDecoration(
                      hintText: "Web Site",
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _tagcontroller,
                    decoration: InputDecoration(
                      hintText: "Tag",
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter _Tag';
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 16.0),
                    child: RaisedButton(
                      // color: Colors.blue,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          submitoffer();
                        }
                      },
                      child: Text('Update'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  submitoffer() {
    var map = new Map<String, dynamic>();
    map['name'] = _namecontroller.text;
    map['email'] = _emailcontroller.text;
    map['address'] = _addresscontroller.text;
    map['web'] = _websitecontroller.text;
    map['lng'] = lng.toString();
    map['lat'] = lat.toString();
    map['tag'] = _tagcontroller.text;
    map['img'] = path;
    map["contactNo"] = _contactcontroller.text;
    print(map);
    _repository.updateCompanyProfile(map).then((value) {
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
      print(onError);
      var map = json.decode(onError.message);
      if (map["message"] != '') {
        var mesg = map["message"];
        Fluttertoast.showToast(
            msg: mesg,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.black87,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        print("onErrorrr2");
      }
    });
  }

  void onError(PlacesAutocompleteResponse response) {
    homeScaffoldKey.currentState.showSnackBar(
      SnackBar(content: Text(response.errorMessage)),
    );
  }

  Future<void> _handlePressButton() async {
    // show input autocomplete with selected mode
    // then get the Prediction selected
    Prediction p = await PlacesAutocomplete.show(
      context: context,
      apiKey: kGoogleApiKey,
      onError: onError,
      mode: _mode,
      language: "en",
      components: [Component(Component.country, "in")],
    );
    displayPrediction(p, homeScaffoldKey.currentState).then((value) => {
          print(value),
          _addresscontroller.text = value["address"].toString(),
          lat = value["lattitude"],
          lng = value["longtitude"],
        });
    // print("${desc}");
  }
}

Future<Map<String, dynamic>> displayPrediction(
    Prediction p, ScaffoldState scaffold) async {
  if (p != null) {
    // get detail (lat/lng)
    GoogleMapsPlaces _places = GoogleMapsPlaces(
      apiKey: kGoogleApiKey,
      apiHeaders: await GoogleApiHeaders().getHeaders(),
    );
    PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(p.placeId);
    final lat = detail.result.geometry.location.lat;
    final lng = detail.result.geometry.location.lng;
    var map = new Map<String, dynamic>();
    map['address'] = p.description;
    map['lattitude'] = lat;
    map['longtitude'] = lng;

    return map;
    // scaffold.showSnackBar(
    //   SnackBar(content: Text("${p.description} - $lat/$lng")),
    // );
  }
}

class Uuid {
  final Random _random = Random();

  String generateV4() {
    // Generate xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx / 8-4-4-4-12.
    final int special = 8 + _random.nextInt(4);

    return '${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}-'
        '${_bitsDigits(16, 4)}-'
        '4${_bitsDigits(12, 3)}-'
        '${_printDigits(special, 1)}${_bitsDigits(12, 3)}-'
        '${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}';
  }

  String _bitsDigits(int bitCount, int digitCount) =>
      _printDigits(_generateBits(bitCount), digitCount);

  int _generateBits(int bitCount) => _random.nextInt(1 << bitCount);

  String _printDigits(int value, int count) =>
      value.toRadixString(16).padLeft(count, '0');
}
