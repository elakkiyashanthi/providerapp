import 'dart:async';
import 'package:providerapp/models/offer.dart';
import 'package:providerapp/models/upload.dart';

import '../models/login.dart';
import '../models/message.dart';
import '../models/profile.dart';

import 'api_provider.dart';
import '../models/config.dart';
import 'dart:io';

class APIRepository {
  final apiProvider = ApiProvider();
  Future<Config> CommonConfig() => apiProvider.CommonConfig();
  Future<fbNotification> sendOtpToNo(data) => apiProvider.sendOtpToNo(data);
  Future<Register> verifyOTPNo(data) => apiProvider.verifyOTPNo(data);
  Future<Offer> getCompanyOffer() => apiProvider.getCompanyOfferProfile();
  Future<Profile> getCompanyProfile() => apiProvider.getCompanyProfile();
  Future<Profile> updateCompanyProfile(data) =>
      apiProvider.UpdateCompanyProfile(data);
  Future<Upload> FileUpload(String text, File file) =>
      apiProvider.FileUpload(text, file);
  Future<Offer> addOffer(data) => apiProvider.addOffer(data);
  Future<Offer> updateOffer(data) => apiProvider.updateOffer(data);
}
