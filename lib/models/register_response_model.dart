class RegisterResponseModel {
  int? statusCode;
  String? message;
  String? responseBody;

  RegisterResponseModel({this.statusCode, this.message, this.responseBody});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    responseBody = json['responseBody'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    data['responseBody'] = this.responseBody;
    return data;
  }
}
