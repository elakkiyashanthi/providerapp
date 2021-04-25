class Profile {
  String message;
  User user;

  Profile({this.message, this.user});

  Profile.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  String mail;
  String name;
  String lname;
  String phCo;
  String img;
  Null reCo;
  Rate rate;
  String address;
  Null city;
  Null state;
  Null pin;
  List<dynamic> cords;
  Location location;
  List<Null> timing;
  List<DevicesLog> devicesLog;
  String contactNo;
  String web;
  String tag;
  String cAt;
  String access;
  bool block;
  Null reason;
  String reTok;
  bool act;
  String sId;
  int ph;
  int iV;

  User(
      {
        this.mail,this.name,
        this.lname,
        this.phCo,
        this.img,
        this.reCo,
        this.rate,
        this.address,
        this.city,
        this.state,
        this.pin,
        this.cords,
        this.location,
        this.timing,
        this.devicesLog,
        this.contactNo,
        this.web,
        this.tag,
        this.cAt,
        this.access,
        this.block,
        this.reason,
        this.reTok,
        this.act,
        this.sId,
        this.ph,
        this.iV});

  User.fromJson(Map<String, dynamic> json) {
    mail=json["mail"];
    name = json['name'];
    lname = json['lname'];
    phCo = json['phCo'];
    img = json['img'];
    reCo = json['reCo'];
    rate = json['rate'] != null ? new Rate.fromJson(json['rate']) : null;
    address = json['address'];
    city = json['city'];
    state = json['state'];
    pin = json['pin'];
    cords = json['cords'].cast<dynamic>();
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    if (json['timing'] != null) {
      timing = new List<Null>();
      json['timing'].forEach((v) {
        // timing.add(new Null.fromJson(v));
      });
    }
    if (json['devicesLog'] != null) {
      devicesLog = new List<DevicesLog>();
      json['devicesLog'].forEach((v) {
        devicesLog.add(new DevicesLog.fromJson(v));
      });
    }
    contactNo = json['contactNo'];
    web = json['web'];
    tag = json['tag'];
    cAt = json['cAt'];
    access = json['access'];
    block = json['block'];
    reason = json['reason'];
    reTok = json['reTok'];
    act = json['act'];
    sId = json['_id'];
    ph = json['ph'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mail']=this.mail;
    data['name'] = this.name;
    data['lname'] = this.lname;
    data['phCo'] = this.phCo;
    data['img'] = this.img;
    data['reCo'] = this.reCo;
    if (this.rate != null) {
      data['rate'] = this.rate.toJson();
    }
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pin'] = this.pin;
    data['cords'] = this.cords;
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    if (this.timing != null) {
      // data['timing'] = this.timing.map((v) => v.toJson()).toList();
    }
    if (this.devicesLog != null) {
      data['devicesLog'] = this.devicesLog.map((v) => v.toJson()).toList();
    }
    data['contactNo'] = this.contactNo;
    data['web'] = this.web;
    data['tag'] = this.tag;
    data['cAt'] = this.cAt;
    data['access'] = this.access;
    data['block'] = this.block;
    data['reason'] = this.reason;
    data['reTok'] = this.reTok;
    data['act'] = this.act;
    data['_id'] = this.sId;
    data['ph'] = this.ph;
    data['__v'] = this.iV;
    return data;
  }
}

class Rate {
  int star;
  int nos;

  Rate({this.star, this.nos});

  Rate.fromJson(Map<String, dynamic> json) {
    star = json['star'];
    nos = json['nos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['star'] = this.star;
    data['nos'] = this.nos;
    return data;
  }
}

class Location {
  String type;
  List<int> coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class DevicesLog {
  Null id;
  bool logged;
  String sId;

  DevicesLog({this.id, this.logged, this.sId});

  DevicesLog.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logged = json['logged'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['logged'] = this.logged;
    data['_id'] = this.sId;
    return data;
  }
}
