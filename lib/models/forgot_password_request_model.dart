class ForgotPasswordRequestModel {
  String? password;

  ForgotPasswordRequestModel({this.password});

  ForgotPasswordRequestModel.fromJson(Map<String, dynamic> json) {
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    return data;
  }
}
