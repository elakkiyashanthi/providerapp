import 'dart:async';
import 'dart:convert';
import 'package:providerapp/models/offer.dart';
import 'package:providerapp/models/upload.dart';
import 'package:http_parser/http_parser.dart';
import 'dart:io';
import '../models/message.dart';
import '../models/profile.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/login.dart';
import '../models/config.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Client client = Client();
  final _baseUrl = "http://35.240.193.71:3002/api";

  Future<Config> CommonConfig() async {
    final response = await client
        .get("$_baseUrl/common", headers: {"x-app-token": "0a6b944d"});
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return Config.fromJson(json.decode(response.body));
    } else {
      // print(json.decode(response.body));
      // If that call was not successful, throw an error.
      throw Exception((response.body));
    }
  }

  Future<Profile> getCompanyProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getString("id");
    print("$_baseUrl/company/$id/profile");
    final response = await client.get(
      "$_baseUrl/company/$id/profile",
      headers: {"x-app-token": "0a6b944d"},
    );
    if (response.statusCode == 200) {
      print(response.body);
      // If the call to the server was successful, parse the JSON
      return Profile.fromJson(json.decode(response.body));
    } else {
      // print(json.decode(response.body));
      // If that call was not successful, throw an error.
      throw Exception((response.body));
    }
  }

  Future<Profile> UpdateCompanyProfile(data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getString("id");
    print("$_baseUrl/company/$id/profile");
    final response = await client.put("$_baseUrl/company/$id/profile",
        headers: {"x-app-token": "0a6b944d"}, body: data);
    if (response.statusCode == 200) {
      print(response.body);
      // If the call to the server was successful, parse the JSON
      return Profile.fromJson(json.decode(response.body));
    } else {
      // print(json.decode(response.body));
      // If that call was not successful, throw an error.
      throw Exception((response.body));
    }
  }

  Future<Offer> getCompanyOfferProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getString("id");
    print("$_baseUrl/company/getCompanyOffer/$id");
    final response = await client.get(
      "$_baseUrl/company/getCompanyOffer/$id",
      headers: {"x-app-token": "0a6b944d"},
    );
    if (response.statusCode == 200) {
      print(response.body);
      // If the call to the server was successful, parse the JSON
      return Offer.fromJson(json.decode(response.body));
    } else {
      // print(json.decode(response.body));
      // If that call was not successful, throw an error.
      throw Exception((response.body));
    }
  }

  Future<fbNotification> sendOtpToNo(data) async {
    final response = await client.post("$_baseUrl/common/sendVerificationCode",
        headers: {"x-app-token": "0a6b944d"}, body: data);
    if (response.statusCode == 200) {
      // print(response.body);
      // If the call to the server was successful, parse the JSON
      return fbNotification.fromJson(json.decode(response.body));
    } else {
      // print(json.decode(response.body));
      // If that call was not successful, throw an error.
      throw Exception((response.body));
    }
  }

  Future<Offer> addOffer(data) async {
    final response = await client.post("$_baseUrl/company/addOffer",
        headers: {"x-app-token": "0a6b944d"}, body: data);
    if (response.statusCode == 200) {
      // print(response.body);
      // If the call to the server was successful, parse the JSON
      return Offer.fromJson(json.decode(response.body));
    } else {
      // print(json.decode(response.body));
      // If that call was not successful, throw an error.
      throw Exception((response.body));
    }
  }

  Future<Offer> updateOffer(data) async {
    final response = await client.put("$_baseUrl/company/updateOffer",
        headers: {"x-app-token": "0a6b944d"}, body: data);
    if (response.statusCode == 200) {
      // print(response.body);
      // If the call to the server was successful, parse the JSON
      return Offer.fromJson(json.decode(response.body));
    } else {
      // print(json.decode(response.body));
      // If that call was not successful, throw an error.
      throw Exception((response.body));
    }
  }

  Future<Register> verifyOTPNo(data) async {
    final response = await client.post(
        "$_baseUrl/company/loginOrSignupViaOTPCompany",
        headers: {"x-app-token": "0a6b944d"},
        body: data);
    if (response.statusCode == 200) {
      print(response.body);
      // print(response.body);
      // If the call to the server was successful, parse the JSON
      return Register.fromJson(json.decode(response.body));
    } else {
      // print(json.decode(response.body));
      // If that call was not successful, throw an error.
      throw Exception((response.body));
    }
  }

  Future<Upload> FileUpload(String text, File file) async {
    try {
      //create multipart request for POST or PATCH method
      var request = http.MultipartRequest(
          "PATCH",
          Uri.parse(
              "http://35.240.193.71:3002/api/company/uploadImage?fileFor=companyImage"));
      request.files.add(await http.MultipartFile.fromPath('file', file.path,
          contentType: MediaType('image', 'jpg')));
      var response = await request.send();
      //Get the response from the server
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      return Upload.fromJson(json.decode(responseString));
    } catch (err) {
      throw Exception((err));
    }
  }

// http://35.240.193.71:3002/api/company/addOffer
}
