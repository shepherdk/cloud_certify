import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:cloud_certify/helpers/constants.dart';
import 'package:cloud_certify/helpers/custom_exceptions.dart';
import 'package:cloud_certify/models/register_request_model.dart';

class RegisterService {
  final String registerUrl = apiBaseUrlUser + 'users/signUp/';

  Future<dynamic> signup(RegisterRequestModel model) async {
    print("Calling API: $registerUrl");
    print("Calling parameters: ${model.userName}");

    var responseJson;
    try {
      final response = await http.post(
        Uri.parse(registerUrl),
        body: jsonEncode(model.toJson()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );

      responseJson = _generateResponse(response);

      print('sign up request completed!!!');
    } on SocketException {
      print('No network connection');
      throw FetchDataException('No Internet connection');
    }
    print('.....ending register service');
    return responseJson;
  }

  dynamic _generateResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body);
        http.MultipartRequest;
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
}
