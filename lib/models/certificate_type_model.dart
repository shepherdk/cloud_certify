import 'dart:convert';

List<DocumentTypeModel> documentTypeModelFromJson(String str) =>
    List<DocumentTypeModel>.from(
        json.decode(str).map((x) => DocumentTypeModel.fromJson(x)));

String documentTypeModelToJson(List<DocumentTypeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DocumentTypeModel {
  int? version;
  int? id;
  String? fileType;
  double? price;

  DocumentTypeModel({this.version, this.id, this.fileType, this.price});

  DocumentTypeModel.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    id = json['id'];
    fileType = json['fileType'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['version'] = this.version;
    data['id'] = this.id;
    data['fileType'] = this.fileType;
    data['price'] = this.price;
    return data;
  }
}
