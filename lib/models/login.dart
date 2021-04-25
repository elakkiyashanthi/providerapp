class Register {
  String _message;
  String _token;
  String _refreshToken;
  User _user;

  Register({String message, String token, String refreshToken, User user}) {
    this._message = message;
    this._token = token;
    this._refreshToken = refreshToken;
    this._user = user;
  }

  String get message => _message;
  set message(String message) => _message = message;
  String get token => _token;
  set token(String token) => _token = token;
  String get refreshToken => _refreshToken;
  set refreshToken(String refreshToken) => _refreshToken = refreshToken;
  User get user => _user;
  set user(User user) => _user = user;

  Register.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    _token = json['token'];
    _refreshToken = json['refreshToken'];
    _user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this._message;
    data['token'] = this._token;
    data['refreshToken'] = this._refreshToken;
    if (this._user != null) {
      data['user'] = this._user.toJson();
    }
    return data;
  }
}

class User {
  String _name;
  String _lname;
  String _phCo;
  String _img;
  Null _reCo;
  Rate _rate;
  Null _address;
  Null _city;
  Null _state;
  Null _pin;
  List<int> _cords;
  Location _location;
  List<Null> _timing;
  List<DevicesLog> _devicesLog;
  Null _contactNo;
  Null _web;
  String _tag;
  String _cAt;
  String _access;
  bool _block;
  Null _reason;
  String _reTok;
  bool _act;
  String _sId;
  int _ph;
  String _id;

  User(
      {String name,
        String lname,
        String phCo,
        String img,
        Null reCo,
        Rate rate,
        Null address,
        Null city,
        Null state,
        Null pin,
        List<int> cords,
        Location location,
        List<Null> timing,
        List<DevicesLog> devicesLog,
        Null contactNo,
        Null web,
        String tag,
        String cAt,
        String access,
        bool block,
        Null reason,
        String reTok,
        bool act,
        String sId,
        int ph,
        String id}) {
    this._name = name;
    this._lname = lname;
    this._phCo = phCo;
    this._img = img;
    this._reCo = reCo;
    this._rate = rate;
    this._address = address;
    this._city = city;
    this._state = state;
    this._pin = pin;
    this._cords = cords;
    this._location = location;
    this._timing = timing;
    this._devicesLog = devicesLog;
    this._contactNo = contactNo;
    this._web = web;
    this._tag = tag;
    this._cAt = cAt;
    this._access = access;
    this._block = block;
    this._reason = reason;
    this._reTok = reTok;
    this._act = act;
    this._sId = sId;
    this._ph = ph;
    this._id = id;
  }

  String get name => _name;
  set name(String name) => _name = name;
  String get lname => _lname;
  set lname(String lname) => _lname = lname;
  String get phCo => _phCo;
  set phCo(String phCo) => _phCo = phCo;
  String get img => _img;
  set img(String img) => _img = img;
  Null get reCo => _reCo;
  set reCo(Null reCo) => _reCo = reCo;
  Rate get rate => _rate;
  set rate(Rate rate) => _rate = rate;
  Null get address => _address;
  set address(Null address) => _address = address;
  Null get city => _city;
  set city(Null city) => _city = city;
  Null get state => _state;
  set state(Null state) => _state = state;
  Null get pin => _pin;
  set pin(Null pin) => _pin = pin;
  List<int> get cords => _cords;
  set cords(List<int> cords) => _cords = cords;
  Location get location => _location;
  set location(Location location) => _location = location;
  List<Null> get timing => _timing;
  set timing(List<Null> timing) => _timing = timing;
  List<DevicesLog> get devicesLog => _devicesLog;
  set devicesLog(List<DevicesLog> devicesLog) => _devicesLog = devicesLog;
  Null get contactNo => _contactNo;
  set contactNo(Null contactNo) => _contactNo = contactNo;
  Null get web => _web;
  set web(Null web) => _web = web;
  String get tag => _tag;
  set tag(String tag) => _tag = tag;
  String get cAt => _cAt;
  set cAt(String cAt) => _cAt = cAt;
  String get access => _access;
  set access(String access) => _access = access;
  bool get block => _block;
  set block(bool block) => _block = block;
  Null get reason => _reason;
  set reason(Null reason) => _reason = reason;
  String get reTok => _reTok;
  set reTok(String reTok) => _reTok = reTok;
  bool get act => _act;
  set act(bool act) => _act = act;
  String get sId => _sId;
  set sId(String sId) => _sId = sId;
  int get ph => _ph;
  set ph(int ph) => _ph = ph;
  String get id => _id;
  set id(String id) => id = id;

  User.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _lname = json['lname'];
    _phCo = json['phCo'];
    _img = json['img'];
    _reCo = json['reCo'];
    _rate = json['rate'] != null ? new Rate.fromJson(json['rate']) : null;
    _address = json['address'];
    _city = json['city'];
    _state = json['state'];
    _pin = json['pin'];
    _cords = json['cords'].cast<int>();
    _location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    if (json['timing'] != null) {
      _timing = new List<Null>();
      json['timing'].forEach((v) {
       // _timing.add(new Null.fromJson(v));
      });
    }
    if (json['devicesLog'] != null) {
      _devicesLog = new List<DevicesLog>();
      json['devicesLog'].forEach((v) {
        _devicesLog.add(new DevicesLog.fromJson(v));
      });
    }
    _contactNo = json['contactNo'];
    _web = json['web'];
    _tag = json['tag'];
    _cAt = json['cAt'];
    _access = json['access'];
    _block = json['block'];
    _reason = json['reason'];
    _reTok = json['reTok'];
    _act = json['act'];
    _sId = json['_id'];
    _ph = json['ph'];
    _id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['lname'] = this._lname;
    data['phCo'] = this._phCo;
    data['img'] = this._img;
    data['reCo'] = this._reCo;
    if (this._rate != null) {
      data['rate'] = this._rate.toJson();
    }
    data['address'] = this._address;
    data['city'] = this._city;
    data['state'] = this._state;
    data['pin'] = this._pin;
    data['cords'] = this._cords;
    if (this._location != null) {
      data['location'] = this._location.toJson();
    }
    // if (this._timing != null) {
    //   data['timing'] = this._timing.map((v) => v.toJson()).toList();
    // }
    if (this._devicesLog != null) {
      data['devicesLog'] = this._devicesLog.map((v) => v.toJson()).toList();
    }
    data['contactNo'] = this._contactNo;
    data['web'] = this._web;
    data['tag'] = this._tag;
    data['cAt'] = this._cAt;
    data['access'] = this._access;
    data['block'] = this._block;
    data['reason'] = this._reason;
    data['reTok'] = this._reTok;
    data['act'] = this._act;
    data['_id'] = this._sId;
    data['ph'] = this._ph;
    data['__v'] = this._id;
    return data;
  }
}

class Rate {
  int _star;
  int _nos;

  Rate({int star, int nos}) {
    this._star = star;
    this._nos = nos;
  }

  int get star => _star;
  set star(int star) => _star = star;
  int get nos => _nos;
  set nos(int nos) => _nos = nos;

  Rate.fromJson(Map<String, dynamic> json) {
    _star = json['star'];
    _nos = json['nos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['star'] = this._star;
    data['nos'] = this._nos;
    return data;
  }
}

class Location {
  String _type;
  List<int> _coordinates;

  Location({String type, List<int> coordinates}) {
    this._type = type;
    this._coordinates = coordinates;
  }

  String get type => _type;
  set type(String type) => _type = type;
  List<int> get coordinates => _coordinates;
  set coordinates(List<int> coordinates) => _coordinates = coordinates;

  Location.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _coordinates = json['coordinates'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this._type;
    data['coordinates'] = this._coordinates;
    return data;
  }
}

class DevicesLog {
  Null _id;
  bool _logged;
  String _sId;

  DevicesLog({Null id, bool logged, String sId}) {
    this._id = id;
    this._logged = logged;
    this._sId = sId;
  }

  Null get id => _id;
  set id(Null id) => _id = id;
  bool get logged => _logged;
  set logged(bool logged) => _logged = logged;
  String get sId => _sId;
  set sId(String sId) => _sId = sId;

  DevicesLog.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _logged = json['logged'];
    _sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['logged'] = this._logged;
    data['_id'] = this._sId;
    return data;
  }
}
