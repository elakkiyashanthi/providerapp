import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import '../resources/api_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:date_format/date_format.dart';

class EditOffer extends StatefulWidget {
  final String image;
  final String title;
  final String desc;
  final String validty;
  final String companyId;
  final String sid;
  final String cat;
  EditOffer(this.image, this.title, this.desc, this.validty, this.companyId,
      this.sid,this.cat);
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<EditOffer>
    with SingleTickerProviderStateMixin {
  final _repository = APIRepository();
  File _image;
  bool camShow = false;
  TextEditingController _controller = new TextEditingController();
  TextEditingController dcontroller = new TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);
  String _hour, _minute, _time, dateTime, path = '';
  //camera
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      path = widget.image;
      _controller.text = widget.title;
      dcontroller.text = widget.desc;
      DateTime dt = DateTime.parse(widget.validty.split(" ")[0]);
      selectedDate = dt;
      dateController.text = DateFormat.yMd().format(selectedDate);
      timeController.text = widget.validty;
      _hour = DateTime.parse(widget.validty).hour.toString();
      _minute = DateTime.parse(widget.validty).minute.toString();
      _time = _hour + ' : ' + _minute;
      timeController.text = _time;
      timeController.text = formatDate(
          DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
          [hh, ':', nn, " ", am]).toString();
    });

    // callList();
  }

  // Future<void> callList() async {
  //   try {
  //     setState(() {
  //       profileDetails = _repository.getCompanyProfile();
  //     });
  //   } catch (err) {
  //     print(err);
  //   }
  // }
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // final OfferRouteArguments args = ModalRoute.of(context).settings.arguments;
    //         if(args!=null){
    //           print("${args.image},${args.companyId},${args.sid}");
    //           path=args.image;
    //         }
    print("In Edit http://35.240.193.71:3002/${path}");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true, // this is all you need
          actions: [
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                _showPicker(context);
              },
              child: Icon(
                Icons.camera_alt,
                size: 30,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 40,
            )
          ],
          title: Text("Update Offer", textAlign: TextAlign.center),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                path != ''
                    ? Image.network(
                        'http://35.240.193.71:3002/${path}',
                        width: 600,
                        height: 240,
                        fit: BoxFit.fill,
                      )
                    :
                    // _image != null
                    //     ? Image.file(
                    //   _image,
                    //   width: 250,
                    //   // color: Colors.blueGrey,
                    //   height: 170,
                    //   fit: BoxFit.fill,
                    // )
                    Text("No Image Found"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      // SizedBox(
                      //   height: 20,
                      // ),
                      TextFormField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: "Offer Tittle",
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
                        controller: dcontroller,
                        decoration: InputDecoration(
                          hintText: "Description",
                        ),
                        maxLines: 3,
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
                        controller: dateController,
                        decoration: InputDecoration(
                          labelText: "Enter Offer Validity Date",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Select Date';
                          }
                        },
                        onTap: () async {
                          DateTime date = DateTime(2021);
                          FocusScope.of(context).requestFocus(new FocusNode());

                          date = await showDatePicker(
                            context: context,
                            initialDate: new DateTime.now(),
                            firstDate: new DateTime(2020),
                            lastDate: new DateTime(2030),
                          );
                          if (date != null)
                            setState(() {
                              selectedDate = date;
                              dateController.text =
                                  DateFormat.yMd().format(selectedDate);
                            });

                          // dateController.text = date.toString();
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: timeController,
                        decoration: InputDecoration(
                          labelText: "Enter Offer Validity Time",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Select Time';
                          }
                        },
                        onTap: () async {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          final TimeOfDay picked = await showTimePicker(
                            context: context,
                            initialTime: selectedTime,
                          );
                          if (picked != null) {
                            _hour = selectedTime.hour.toString();
                            _minute = selectedTime.minute.toString();
                            _time = _hour + ' : ' + _minute;
                            // timeController.text = _time;
                            timeController.text = formatDate(
                                DateTime(2019, 08, 1, selectedTime.hour,
                                    selectedTime.minute),
                                [hh, ':', nn, " ", am]).toString();
                          }
                          // timeController.text = picked.toString();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 16.0),
                        child: RaisedButton(
                          color: Colors.blue,
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                                  submitoffer();
                            }
                          },
                          child: Text('Update My Offer'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isNumeric(String s) {
    try {
      return double.parse(s) != null;
    } catch (e) {
      return false;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  submitoffer() async {
    if (path == '') {
      Fluttertoast.showToast(
          msg: "Image is required",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.black87,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var map = new Map<String, dynamic>();
      map['companyId'] = prefs.getString("id").toString();
      map['desc'] = dcontroller.text;
      map['image'] = path;
      map['title'] = _controller.text;
      map['_id'] =widget.sid;
      map['cAt'] =widget.cat;

      map['validty'] = dateController.text + "  " + timeController.text;
      print(map);
      _repository.updateOffer(map).then((value) {
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
  }
}
