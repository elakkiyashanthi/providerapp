class Upload {
  String message;
  String path;

  Upload({this.message, this.path});

  Upload.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['path'] = this.path;
    return data;
  }
}