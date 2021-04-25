class Config {
  SettingConfig settingConfig;
  FeaturesSettings featuresSettings;
  AlertMessages alertMessages;

  Config({this.settingConfig, this.featuresSettings, this.alertMessages});

  Config.fromJson(Map<String, dynamic> json) {
    settingConfig = json['settingConfig'] != null
        ? new SettingConfig.fromJson(json['settingConfig'])
        : null;
    featuresSettings = json['featuresSettings'] != null
        ? new FeaturesSettings.fromJson(json['featuresSettings'])
        : null;
    alertMessages = json['alertMessages'] != null
        ? new AlertMessages.fromJson(json['alertMessages'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.settingConfig != null) {
      data['settingConfig'] = this.settingConfig.toJson();
    }
    if (this.featuresSettings != null) {
      data['featuresSettings'] = this.featuresSettings.toJson();
    }
    if (this.alertMessages != null) {
      data['alertMessages'] = this.alertMessages.toJson();
    }
    return data;
  }
}

class SettingConfig {
  String baseURL;
  String appName;
  String buildVersion;
  AppVersion appVersion;
  Company company;
  Defaults defaults;
  Units units;

  SettingConfig(
      {this.baseURL,
        this.appName,
        this.buildVersion,
        this.appVersion,
        this.company,
        this.defaults,
        this.units});

  SettingConfig.fromJson(Map<String, dynamic> json) {
    baseURL = json['baseURL'];
    appName = json['appName'];
    buildVersion = json['buildVersion'];
    appVersion = json['appVersion'] != null
        ? new AppVersion.fromJson(json['appVersion'])
        : null;
    company =
    json['company'] != null ? new Company.fromJson(json['company']) : null;
    defaults = json['defaults'] != null
        ? new Defaults.fromJson(json['defaults'])
        : null;
    units = json['units'] != null ? new Units.fromJson(json['units']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['baseURL'] = this.baseURL;
    data['appName'] = this.appName;
    data['buildVersion'] = this.buildVersion;
    if (this.appVersion != null) {
      data['appVersion'] = this.appVersion.toJson();
    }
    if (this.company != null) {
      data['company'] = this.company.toJson();
    }
    if (this.defaults != null) {
      data['defaults'] = this.defaults.toJson();
    }
    if (this.units != null) {
      data['units'] = this.units.toJson();
    }
    return data;
  }
}

class AppVersion {
  Android android;
  Android ios;

  AppVersion({this.android, this.ios});

  AppVersion.fromJson(Map<String, dynamic> json) {
    android =
    json['android'] != null ? new Android.fromJson(json['android']) : null;
    ios = json['ios'] != null ? new Android.fromJson(json['ios']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.android != null) {
      data['android'] = this.android.toJson();
    }
    if (this.ios != null) {
      data['ios'] = this.ios.toJson();
    }
    return data;
  }
}

class Android {
  String currentVersion;
  String newUpdateType;

  Android({this.currentVersion, this.newUpdateType});

  Android.fromJson(Map<String, dynamic> json) {
    currentVersion = json['currentVersion'];
    newUpdateType = json['newUpdateType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentVersion'] = this.currentVersion;
    data['newUpdateType'] = this.newUpdateType;
    return data;
  }
}

class Company {
  String contactNo;
  String address;
  String mail;

  Company({this.contactNo, this.address, this.mail});

  Company.fromJson(Map<String, dynamic> json) {
    contactNo = json['contactNo'];
    address = json['address'];
    mail = json['mail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contactNo'] = this.contactNo;
    data['address'] = this.address;
    data['mail'] = this.mail;
    return data;
  }
}

class Defaults {
  String language;
  String currency;
  String currencySymbol;
  String state;
  String city;
  String country;
  String phoneCode;
  int phoneDigits;
  String distanceUnit;
  String timeUnit;
  String utcOffset;

  Defaults(
      {this.language,
        this.currency,
        this.currencySymbol,
        this.state,
        this.city,
        this.country,
        this.phoneCode,
        this.phoneDigits,
        this.distanceUnit,
        this.timeUnit,
        this.utcOffset});

  Defaults.fromJson(Map<String, dynamic> json) {
    language = json['language'];
    currency = json['currency'];
    currencySymbol = json['currencySymbol'];
    state = json['state'];
    city = json['city'];
    country = json['country'];
    phoneCode = json['phoneCode'];
    phoneDigits = json['phoneDigits'];
    distanceUnit = json['distance_unit'];
    timeUnit = json['time_unit'];
    utcOffset = json['utcOffset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['language'] = this.language;
    data['currency'] = this.currency;
    data['currencySymbol'] = this.currencySymbol;
    data['state'] = this.state;
    data['city'] = this.city;
    data['country'] = this.country;
    data['phoneCode'] = this.phoneCode;
    data['phoneDigits'] = this.phoneDigits;
    data['distance_unit'] = this.distanceUnit;
    data['time_unit'] = this.timeUnit;
    data['utcOffset'] = this.utcOffset;
    return data;
  }
}

class Units {
  String distance;
  String distanceNotation;
  String time;
  String timeNotation;
  String currency;

  Units(
      {this.distance,
        this.distanceNotation,
        this.time,
        this.timeNotation,
        this.currency});

  Units.fromJson(Map<String, dynamic> json) {
    distance = json['distance'];
    distanceNotation = json['distanceNotation'];
    time = json['time'];
    timeNotation = json['timeNotation'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['distance'] = this.distance;
    data['distanceNotation'] = this.distanceNotation;
    data['time'] = this.time;
    data['timeNotation'] = this.timeNotation;
    data['currency'] = this.currency;
    return data;
  }
}

class FeaturesSettings {
  List<String> userRoles;
  User user;
  Admin admin;

  FeaturesSettings({this.userRoles, this.user, this.admin});

  FeaturesSettings.fromJson(Map<String, dynamic> json) {
    userRoles = json['userRoles'].cast<String>();
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    admin = json['admin'] != null ? new Admin.fromJson(json['admin']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userRoles'] = this.userRoles;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.admin != null) {
      data['admin'] = this.admin.toJson();
    }
    return data;
  }
}

class User {
  String verifyVia;
  String loginVia;
  int resendVerifySMSAfter;
  bool referal;

  User(
      {this.verifyVia, this.loginVia, this.resendVerifySMSAfter, this.referal});

  User.fromJson(Map<String, dynamic> json) {
    verifyVia = json['verifyVia'];
    loginVia = json['loginVia'];
    resendVerifySMSAfter = json['resendVerifySMSAfter'];
    referal = json['referal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['verifyVia'] = this.verifyVia;
    data['loginVia'] = this.loginVia;
    data['resendVerifySMSAfter'] = this.resendVerifySMSAfter;
    data['referal'] = this.referal;
    return data;
  }
}

class Admin {
  String verifyVia;
  String loginVia;
  int resendVerifySMSAfter;

  Admin({this.verifyVia, this.loginVia, this.resendVerifySMSAfter});

  Admin.fromJson(Map<String, dynamic> json) {
    verifyVia = json['verifyVia'];
    loginVia = json['loginVia'];
    resendVerifySMSAfter = json['resendVerifySMSAfter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['verifyVia'] = this.verifyVia;
    data['loginVia'] = this.loginVia;
    data['resendVerifySMSAfter'] = this.resendVerifySMSAfter;
    return data;
  }
}

class AlertMessages {
  String iNTERNALSERVERERROR;
  String aPINOTFOUND;
  String aDDFAILED;
  String uPDATEFAILED;
  String iNVALIDDISTANCE;
  String aPPTOKENERR;
  String aCCESSTOKENERR;
  String rEFRESHTOKENERR;
  String aCCESSTOKENPERMISSIONERR;
  String uSERNOTFOUND;
  String dETAILNOTFOUND;
  String uSEREXISTS;
  String iNVALIDPASSWORD;
  String oTPINVALID;
  String oTPFAILED;
  String sERVICEUNAVAILABLE;
  String pEAKHOUR;
  String lEANHOUR;
  String nIGHTHOUR;
  String vALIDATIONERROR;
  String nOTVALIDDOC;
  String dOCEXISTS;
  String tAXIEXISTS;
  String dOCNEEDED;
  String fILENEEDED;
  String dRIVERNOTVERIFIED;
  String vEHICLENOTVERIFIED;
  String dEFAULTALREADYSET;
  String nODRIVERFOUND;
  String dRIVERSBUSY;
  String tRIPREQUEST;
  String cLEARTRIPTIMEOUT;
  String cLEARTRIPCANCELED;
  String rEQUESTPROCESSING;
  String rEQUESTPROCESSED;
  String rEQUESTACCEPTEDRIDER;
  String rEQUESTACCEPTEDDRIVER;
  String rEQUESTDECLINEDDRIVER;
  String rEQUESTCANCELED;
  String rEQUESTDECLINEFAIL;
  String rEQUESTCANCELFAIL;
  String rEQUESTNOTFOUND;
  String bOOKINGNOTFOUND;
  String rEQUESTUPDATEERR;
  String rEQUESTSTATUSALREADYUPDATED;
  String sTARTOTPINVALID;
  String fEEDBACKERR;
  String bOOKINGCANCELERR;
  String bOOKINGCANCELNA;
  String bOOKINGCANCELEDBYRIDER;
  String rEQUESTINVALIDSTATUS;
  String eRRGETTINGFARE;

  AlertMessages(
      {this.iNTERNALSERVERERROR,
        this.aPINOTFOUND,
        this.aDDFAILED,
        this.uPDATEFAILED,
        this.iNVALIDDISTANCE,
        this.aPPTOKENERR,
        this.aCCESSTOKENERR,
        this.rEFRESHTOKENERR,
        this.aCCESSTOKENPERMISSIONERR,
        this.uSERNOTFOUND,
        this.dETAILNOTFOUND,
        this.uSEREXISTS,
        this.iNVALIDPASSWORD,
        this.oTPINVALID,
        this.oTPFAILED,
        this.sERVICEUNAVAILABLE,
        this.pEAKHOUR,
        this.lEANHOUR,
        this.nIGHTHOUR,
        this.vALIDATIONERROR,
        this.nOTVALIDDOC,
        this.dOCEXISTS,
        this.tAXIEXISTS,
        this.dOCNEEDED,
        this.fILENEEDED,
        this.dRIVERNOTVERIFIED,
        this.vEHICLENOTVERIFIED,
        this.dEFAULTALREADYSET,
        this.nODRIVERFOUND,
        this.dRIVERSBUSY,
        this.tRIPREQUEST,
        this.cLEARTRIPTIMEOUT,
        this.cLEARTRIPCANCELED,
        this.rEQUESTPROCESSING,
        this.rEQUESTPROCESSED,
        this.rEQUESTACCEPTEDRIDER,
        this.rEQUESTACCEPTEDDRIVER,
        this.rEQUESTDECLINEDDRIVER,
        this.rEQUESTCANCELED,
        this.rEQUESTDECLINEFAIL,
        this.rEQUESTCANCELFAIL,
        this.rEQUESTNOTFOUND,
        this.bOOKINGNOTFOUND,
        this.rEQUESTUPDATEERR,
        this.rEQUESTSTATUSALREADYUPDATED,
        this.sTARTOTPINVALID,
        this.fEEDBACKERR,
        this.bOOKINGCANCELERR,
        this.bOOKINGCANCELNA,
        this.bOOKINGCANCELEDBYRIDER,
        this.rEQUESTINVALIDSTATUS,
        this.eRRGETTINGFARE});

  AlertMessages.fromJson(Map<String, dynamic> json) {
    iNTERNALSERVERERROR = json['INTERNAL_SERVER_ERROR'];
    aPINOTFOUND = json['API_NOT_FOUND'];
    aDDFAILED = json['ADD_FAILED'];
    uPDATEFAILED = json['UPDATE_FAILED'];
    iNVALIDDISTANCE = json['INVALID_DISTANCE'];
    aPPTOKENERR = json['APP_TOKEN_ERR'];
    aCCESSTOKENERR = json['ACCESS_TOKEN_ERR'];
    rEFRESHTOKENERR = json['REFRESH_TOKEN_ERR'];
    aCCESSTOKENPERMISSIONERR = json['ACCESS_TOKEN_PERMISSION_ERR'];
    uSERNOTFOUND = json['USER_NOT_FOUND'];
    dETAILNOTFOUND = json['DETAIL_NOT_FOUND'];
    uSEREXISTS = json['USER_EXISTS'];
    iNVALIDPASSWORD = json['INVALID_PASSWORD'];
    oTPINVALID = json['OTP_INVALID'];
    oTPFAILED = json['OTP_FAILED'];
    sERVICEUNAVAILABLE = json['SERVICE_UNAVAILABLE'];
    pEAKHOUR = json['PEAK_HOUR'];
    lEANHOUR = json['LEAN_HOUR'];
    nIGHTHOUR = json['NIGHT_HOUR'];
    vALIDATIONERROR = json['VALIDATION_ERROR'];
    nOTVALIDDOC = json['NOT_VALID_DOC'];
    dOCEXISTS = json['DOC_EXISTS'];
    tAXIEXISTS = json['TAXI_EXISTS'];
    dOCNEEDED = json['DOC_NEEDED'];
    fILENEEDED = json['FILE_NEEDED'];
    dRIVERNOTVERIFIED = json['DRIVER_NOT_VERIFIED'];
    vEHICLENOTVERIFIED = json['VEHICLE_NOT_VERIFIED'];
    dEFAULTALREADYSET = json['DEFAULT_ALREADY_SET'];
    nODRIVERFOUND = json['NO_DRIVER_FOUND'];
    dRIVERSBUSY = json['DRIVERS_BUSY'];
    tRIPREQUEST = json['TRIP_REQUEST'];
    cLEARTRIPTIMEOUT = json['CLEAR_TRIP_TIMEOUT'];
    cLEARTRIPCANCELED = json['CLEAR_TRIP_CANCELED'];
    rEQUESTPROCESSING = json['REQUEST_PROCESSING'];
    rEQUESTPROCESSED = json['REQUEST_PROCESSED'];
    rEQUESTACCEPTEDRIDER = json['REQUEST_ACCEPTED_RIDER'];
    rEQUESTACCEPTEDDRIVER = json['REQUEST_ACCEPTED_DRIVER'];
    rEQUESTDECLINEDDRIVER = json['REQUEST_DECLINED_DRIVER'];
    rEQUESTCANCELED = json['REQUEST_CANCELED'];
    rEQUESTDECLINEFAIL = json['REQUEST_DECLINE_FAIL'];
    rEQUESTCANCELFAIL = json['REQUEST_CANCEL_FAIL'];
    rEQUESTNOTFOUND = json['REQUEST_NOT_FOUND'];
    bOOKINGNOTFOUND = json['BOOKING_NOT_FOUND'];
    rEQUESTUPDATEERR = json['REQUEST_UPDATE_ERR'];
    rEQUESTSTATUSALREADYUPDATED = json['REQUEST_STATUS_ALREADY_UPDATED'];
    sTARTOTPINVALID = json['START_OTP_INVALID'];
    fEEDBACKERR = json['FEEDBACK_ERR'];
    bOOKINGCANCELERR = json['BOOKING_CANCEL_ERR'];
    bOOKINGCANCELNA = json['BOOKING_CANCEL_NA'];
    bOOKINGCANCELEDBYRIDER = json['BOOKING_CANCELED_BY_RIDER'];
    rEQUESTINVALIDSTATUS = json['REQUEST_INVALID_STATUS'];
    eRRGETTINGFARE = json['ERR_GETTING_FARE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['INTERNAL_SERVER_ERROR'] = this.iNTERNALSERVERERROR;
    data['API_NOT_FOUND'] = this.aPINOTFOUND;
    data['ADD_FAILED'] = this.aDDFAILED;
    data['UPDATE_FAILED'] = this.uPDATEFAILED;
    data['INVALID_DISTANCE'] = this.iNVALIDDISTANCE;
    data['APP_TOKEN_ERR'] = this.aPPTOKENERR;
    data['ACCESS_TOKEN_ERR'] = this.aCCESSTOKENERR;
    data['REFRESH_TOKEN_ERR'] = this.rEFRESHTOKENERR;
    data['ACCESS_TOKEN_PERMISSION_ERR'] = this.aCCESSTOKENPERMISSIONERR;
    data['USER_NOT_FOUND'] = this.uSERNOTFOUND;
    data['DETAIL_NOT_FOUND'] = this.dETAILNOTFOUND;
    data['USER_EXISTS'] = this.uSEREXISTS;
    data['INVALID_PASSWORD'] = this.iNVALIDPASSWORD;
    data['OTP_INVALID'] = this.oTPINVALID;
    data['OTP_FAILED'] = this.oTPFAILED;
    data['SERVICE_UNAVAILABLE'] = this.sERVICEUNAVAILABLE;
    data['PEAK_HOUR'] = this.pEAKHOUR;
    data['LEAN_HOUR'] = this.lEANHOUR;
    data['NIGHT_HOUR'] = this.nIGHTHOUR;
    data['VALIDATION_ERROR'] = this.vALIDATIONERROR;
    data['NOT_VALID_DOC'] = this.nOTVALIDDOC;
    data['DOC_EXISTS'] = this.dOCEXISTS;
    data['TAXI_EXISTS'] = this.tAXIEXISTS;
    data['DOC_NEEDED'] = this.dOCNEEDED;
    data['FILE_NEEDED'] = this.fILENEEDED;
    data['DRIVER_NOT_VERIFIED'] = this.dRIVERNOTVERIFIED;
    data['VEHICLE_NOT_VERIFIED'] = this.vEHICLENOTVERIFIED;
    data['DEFAULT_ALREADY_SET'] = this.dEFAULTALREADYSET;
    data['NO_DRIVER_FOUND'] = this.nODRIVERFOUND;
    data['DRIVERS_BUSY'] = this.dRIVERSBUSY;
    data['TRIP_REQUEST'] = this.tRIPREQUEST;
    data['CLEAR_TRIP_TIMEOUT'] = this.cLEARTRIPTIMEOUT;
    data['CLEAR_TRIP_CANCELED'] = this.cLEARTRIPCANCELED;
    data['REQUEST_PROCESSING'] = this.rEQUESTPROCESSING;
    data['REQUEST_PROCESSED'] = this.rEQUESTPROCESSED;
    data['REQUEST_ACCEPTED_RIDER'] = this.rEQUESTACCEPTEDRIDER;
    data['REQUEST_ACCEPTED_DRIVER'] = this.rEQUESTACCEPTEDDRIVER;
    data['REQUEST_DECLINED_DRIVER'] = this.rEQUESTDECLINEDDRIVER;
    data['REQUEST_CANCELED'] = this.rEQUESTCANCELED;
    data['REQUEST_DECLINE_FAIL'] = this.rEQUESTDECLINEFAIL;
    data['REQUEST_CANCEL_FAIL'] = this.rEQUESTCANCELFAIL;
    data['REQUEST_NOT_FOUND'] = this.rEQUESTNOTFOUND;
    data['BOOKING_NOT_FOUND'] = this.bOOKINGNOTFOUND;
    data['REQUEST_UPDATE_ERR'] = this.rEQUESTUPDATEERR;
    data['REQUEST_STATUS_ALREADY_UPDATED'] = this.rEQUESTSTATUSALREADYUPDATED;
    data['START_OTP_INVALID'] = this.sTARTOTPINVALID;
    data['FEEDBACK_ERR'] = this.fEEDBACKERR;
    data['BOOKING_CANCEL_ERR'] = this.bOOKINGCANCELERR;
    data['BOOKING_CANCEL_NA'] = this.bOOKINGCANCELNA;
    data['BOOKING_CANCELED_BY_RIDER'] = this.bOOKINGCANCELEDBYRIDER;
    data['REQUEST_INVALID_STATUS'] = this.rEQUESTINVALIDSTATUS;
    data['ERR_GETTING_FARE'] = this.eRRGETTINGFARE;
    return data;
  }
}
