class RegisterRequestModel {
  String? emailAddress;
  String? mobileNumber;
  String? name;
  String? password;
  String? surname;
  String? userName;

  RegisterRequestModel(
      {this.emailAddress,
      this.mobileNumber,
      this.name,
      this.password,
      this.surname,
      this.userName});

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    emailAddress = json['emailAddress'];
    mobileNumber = json['mobileNumber'];
    name = json['name'];
    password = json['password'];
    surname = json['surname'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emailAddress'] = this.emailAddress;
    data['mobileNumber'] = this.mobileNumber;
    data['name'] = this.name;
    data['password'] = this.password;
    data['surname'] = this.surname;
    data['userName'] = this.userName;
    return data;
  }
}
