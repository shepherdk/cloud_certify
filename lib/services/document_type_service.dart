import 'dart:convert';
import 'dart:io';
import 'package:cloud_certify/helpers/constants.dart';
import 'package:cloud_certify/helpers/custom_exceptions.dart';
import 'package:http/http.dart' as http;
//certificate type

class DocumentTypeService {
  final String docUrl = apiBaseUrlOath + 'doc-type/get/all';

  Future<dynamic> fetchAll() async {
    print("Calling API: $docUrl");
    print("Calling parameters: none");

    var responseJson;
    try {
      final response = await http.get(
        Uri.parse(docUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      print('Done...');
      responseJson = _generateResponse(response);
    } on SocketException {
      print('No network connection');
      throw FetchDataException('No Internet connection');
    }
    print('.......ending doc type service');
    return responseJson;
  }
}

dynamic _generateResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = jsonDecode(response.body);
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode: ${response.statusCode}');
  }
}
