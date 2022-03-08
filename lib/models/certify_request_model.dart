class CertifyRequestModel {
  String? fileId;
  String? fileType;
  String? paymentMethod;
  int? profileId;
  String? receiptMethod;

  CertifyRequestModel(
      {this.fileId,
      this.fileType,
      this.paymentMethod,
      this.profileId,
      this.receiptMethod});

  CertifyRequestModel.fromJson(Map<String, dynamic> json) {
    fileId = json['fileId'];
    fileType = json['fileType'];
    paymentMethod = json['paymentMethod'];
    profileId = json['profileId'];
    receiptMethod = json['receiptMethod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fileId'] = this.fileId;
    data['fileType'] = this.fileType;
    data['paymentMethod'] = this.paymentMethod;
    data['profileId'] = this.profileId;
    data['receiptMethod'] = this.receiptMethod;
    return data;
  }
}
