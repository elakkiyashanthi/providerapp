class Offer {
  String message;
  Data data;

  Offer({this.message, this.data});

  Offer.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String image;
  String title;
  String desc;
  String validty;
  String cAt;
  String sId;
  String companyId;
  int iV;

  Data(
      {this.image,
        this.title,
        this.desc,
        this.validty,
        this.cAt,
        this.sId,
        this.companyId,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    desc = json['desc'];
    validty = json['validty'];
    cAt = json['cAt'];
    sId = json['_id'];
    companyId = json['companyId'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['validty'] = this.validty;
    data['cAt'] = this.cAt;
    data['_id'] = this.sId;
    data['companyId'] = this.companyId;
    data['__v'] = this.iV;
    return data;
  }
}
