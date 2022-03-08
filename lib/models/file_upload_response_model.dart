class FileUploadResponseModel {
  String? fileName;
  String? fileDownloadUri;
  String? fileType;
  int? size;

  FileUploadResponseModel(
      {this.fileName, this.fileDownloadUri, this.fileType, this.size});

  FileUploadResponseModel.fromJson(Map<String, dynamic> json) {
    fileName = json['fileName'];
    fileDownloadUri = json['fileDownloadUri'];
    fileType = json['fileType'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fileName'] = this.fileName;
    data['fileDownloadUri'] = this.fileDownloadUri;
    data['fileType'] = this.fileType;
    data['size'] = this.size;
    return data;
  }
}
