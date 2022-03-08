class ProfileModel {
  int? id;
  int? version;
  String? title;
  String? name;
  String? surname;
  String? userName;
  String? gender;
  String? dateOfBirth;
  String? emailAddress;
  String? workTelephone;
  String? mobileNumber;
  String? idNumber;
  PhysicalAddress? physicalAddress;
  PhysicalAddress? postalAddress;

  ProfileModel(
      {this.id,
      this.version,
      this.title,
      this.name,
      this.surname,
      this.userName,
      this.gender,
      this.dateOfBirth,
      this.emailAddress,
      this.workTelephone,
      this.mobileNumber,
      this.idNumber,
      this.physicalAddress,
      this.postalAddress});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    version = json['version'];
    title = json['title'];
    name = json['name'];
    surname = json['surname'];
    userName = json['userName'];
    gender = json['gender'];
    dateOfBirth = json['dateOfBirth'];
    emailAddress = json['emailAddress'];
    workTelephone = json['workTelephone'];
    mobileNumber = json['mobileNumber'];
    idNumber = json['idNumber'];
    physicalAddress = json['physicalAddress'] != null
        ? new PhysicalAddress.fromJson(json['physicalAddress'])
        : null;
    postalAddress = json['postalAddress'] != null
        ? new PhysicalAddress.fromJson(json['postalAddress'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['version'] = this.version;
    data['title'] = this.title;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['userName'] = this.userName;
    data['gender'] = this.gender;
    data['dateOfBirth'] = this.dateOfBirth;
    data['emailAddress'] = this.emailAddress;
    data['workTelephone'] = this.workTelephone;
    data['mobileNumber'] = this.mobileNumber;
    data['idNumber'] = this.idNumber;
    if (this.physicalAddress != null) {
      data['physicalAddress'] = this.physicalAddress!.toJson();
    }
    if (this.postalAddress != null) {
      data['postalAddress'] = this.postalAddress!.toJson();
    }
    return data;
  }
}

class PhysicalAddress {
  String? street;
  String? suburb;
  String? city;

  PhysicalAddress({this.street, this.suburb, this.city});

  PhysicalAddress.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    suburb = json['suburb'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['street'] = this.street;
    data['suburb'] = this.suburb;
    data['city'] = this.city;
    return data;
  }
}
