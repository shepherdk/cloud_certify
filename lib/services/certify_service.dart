import 'dart:convert';
import 'dart:io';
import 'package:cloud_certify/core/auth_manager.dart';
import 'package:cloud_certify/core/cache_manager.dart';
import 'package:cloud_certify/helpers/constants.dart';
import 'package:cloud_certify/helpers/custom_exceptions.dart';
import 'package:cloud_certify/models/certify_request_model.dart';
import 'package:cloud_certify/models/login_request_model.dart';
import 'package:http/http.dart' as http;

class CertifyService {
  final String certifyUrl = apiBaseUrlOath + 'certify/add/';

  Future<dynamic> certfiy(CertifyRequestModel model) async {
    print("Calling API: $certifyUrl");
    print("Calling parameters: ${model.fileId}");

    var responseJson;
    try {
      final response = await http.post(
        Uri.parse(certifyUrl),
        body: jsonEncode(model.toJson()),
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
    print('.......ending certify service');
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
