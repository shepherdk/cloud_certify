class UserDetailsModel {
  int? version;
  int? id;
  String? name;
  String? surname;
  String? emailAddress;
  String? userName;
  String? mobileNumber;
  String? password;
  List<Role>? role;
  bool? active;

  UserDetailsModel(
      {this.version,
      this.id,
      this.name,
      this.surname,
      this.emailAddress,
      this.userName,
      this.mobileNumber,
      this.password,
      this.role,
      this.active});

  UserDetailsModel.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    id = json['id'];
    name = json['name'];
    surname = json['surname'];
    emailAddress = json['emailAddress'];
    userName = json['userName'];
    mobileNumber = json['mobileNumber'];
    password = json['password'];
    if (json['role'] != null) {
      role = <Role>[];
      json['role'].forEach((v) {
        role!.add(new Role.fromJson(v));
      });
    }
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['version'] = this.version;
    data['id'] = this.id;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['emailAddress'] = this.emailAddress;
    data['userName'] = this.userName;
    data['mobileNumber'] = this.mobileNumber;
    data['password'] = this.password;
    if (this.role != null) {
      data['role'] = this.role!.map((v) => v.toJson()).toList();
    }
    data['active'] = this.active;
    return data;
  }
}

class Role {
  int? id;
  String? name;

  Role({this.id, this.name});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
