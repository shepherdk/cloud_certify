class RegisterRequestModel {
  String? emailAddress;
  String? mobileNumber;
  String? name;
  int? roleId;
  String? surname;
  String? userName;

  RegisterRequestModel(
      {this.emailAddress,
      this.mobileNumber,
      this.name,
      this.roleId,
      this.surname,
      this.userName});

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    emailAddress = json['emailAddress'];
    mobileNumber = json['mobileNumber'];
    name = json['name'];
    roleId = json['roleId'];
    surname = json['surname'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emailAddress'] = this.emailAddress;
    data['mobileNumber'] = this.mobileNumber;
    data['name'] = this.name;
    data['roleId'] = this.roleId;
    data['surname'] = this.surname;
    data['userName'] = this.userName;
    return data;
  }
}
