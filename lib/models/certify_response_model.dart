class CertifyResponseModel {
  int? id;
  int? version;
  String? fileType;
  String? paymentMethod;
  String? receiptMethod;
  String? referenceNum;

  CertifyResponseModel(
      {this.id,
      this.version,
      this.fileType,
      this.paymentMethod,
      this.receiptMethod,
      this.referenceNum});

  CertifyResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    version = json['version'];
    fileType = json['fileType'];
    paymentMethod = json['paymentMethod'];
    receiptMethod = json['receiptMethod'];
    referenceNum = json['referenceNum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['version'] = this.version;
    data['fileType'] = this.fileType;
    data['paymentMethod'] = this.paymentMethod;
    data['receiptMethod'] = this.receiptMethod;
    data['referenceNum'] = this.referenceNum;
    return data;
  }
}
