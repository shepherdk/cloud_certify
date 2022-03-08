class CreateProfileRequestModel {
  String? dateOfBirth;
  String? emailAddress;
  String? gender;
  String? idNumber;
  String? imageId;
  String? mobileNumber;
  String? name;
  PhysicalAddress? physicalAddress;
  PhysicalAddress? postalAddress;
  String? surname;
  String? title;
  String? userName;
  String? workTelephone;

  CreateProfileRequestModel(
      {this.dateOfBirth,
      this.emailAddress,
      this.gender,
      this.idNumber,
      this.imageId,
      this.mobileNumber,
      this.name,
      this.physicalAddress,
      this.postalAddress,
      this.surname,
      this.title,
      this.userName,
      this.workTelephone});

  CreateProfileRequestModel.fromJson(Map<String, dynamic> json) {
    dateOfBirth = json['dateOfBirth'];
    emailAddress = json['emailAddress'];
    gender = json['gender'];
    idNumber = json['idNumber'];
    imageId = json['imageId'];
    mobileNumber = json['mobileNumber'];
    name = json['name'];
    physicalAddress = json['physicalAddress'] != null
        ? new PhysicalAddress.fromJson(json['physicalAddress'])
        : null;
    postalAddress = json['postalAddress'] != null
        ? new PhysicalAddress.fromJson(json['postalAddress'])
        : null;
    surname = json['surname'];
    title = json['title'];
    userName = json['userName'];
    workTelephone = json['workTelephone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dateOfBirth'] = this.dateOfBirth;
    data['emailAddress'] = this.emailAddress;
    data['gender'] = this.gender;
    data['idNumber'] = this.idNumber;
    data['imageId'] = this.imageId;
    data['mobileNumber'] = this.mobileNumber;
    data['name'] = this.name;
    if (this.physicalAddress != null) {
      data['physicalAddress'] = this.physicalAddress!.toJson();
    }
    if (this.postalAddress != null) {
      data['postalAddress'] = this.postalAddress!.toJson();
    }
    data['surname'] = this.surname;
    data['title'] = this.title;
    data['userName'] = this.userName;
    data['workTelephone'] = this.workTelephone;
    return data;
  }
}

class PhysicalAddress {
  String? city;
  String? street;
  String? suburb;

  PhysicalAddress({this.city, this.street, this.suburb});

  PhysicalAddress.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    street = json['street'];
    suburb = json['suburb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['street'] = this.street;
    data['suburb'] = this.suburb;
    return data;
  }
}
