class CertifyRequestModel {
  String? fileId;
  String? paymentMethod;
  String? receiptMethod;

  CertifyRequestModel({this.fileId, this.paymentMethod, this.receiptMethod});

  CertifyRequestModel.fromJson(Map<String, dynamic> json) {
    fileId = json['fileId'];
    paymentMethod = json['paymentMethod'];
    receiptMethod = json['receiptMethod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fileId'] = this.fileId;
    data['paymentMethod'] = this.paymentMethod;
    data['receiptMethod'] = this.receiptMethod;
    return data;
  }
}
