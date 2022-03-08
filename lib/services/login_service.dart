import 'dart:convert';
import 'dart:io';
import 'package:cloud_certify/core/auth_manager.dart';
import 'package:cloud_certify/core/cache_manager.dart';
import 'package:cloud_certify/helpers/constants.dart';
import 'package:cloud_certify/helpers/custom_exceptions.dart';
import 'package:cloud_certify/models/login_request_model.dart';
import 'package:http/http.dart' as http;

class LoginService {
  final String loginUrl = apiBaseUrlUser + 'users/login/';
  final String getUserUrl = apiBaseUrlUser + 'users/one/';

  Future<dynamic> login(LoginRequestModel model) async {
    print("Calling API: $loginUrl");
    print("Calling parameters: ${model.userName}");

    var responseJson;
    try {
      final response = await http.post(
        Uri.parse(loginUrl),
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
    print('.......ending login service');
    return responseJson;
  }

  Future<dynamic> getUser(int id) async {
    print("Calling API: $getUserUrl");
    print("Calling parameters: ${id}");

    var responseJson;
    try {
      final response = await http.get(
        Uri.parse(loginUrl + '$id/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      print('Done...getting user');
      responseJson = _generateResponse(response);
    } on SocketException {
      print('No network connection');
      throw FetchDataException('No Internet connection');
    }
    print('.......ending login service');
    return responseJson;
  }
}

dynamic _generateResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = jsonDecode(response.body);
      // String? authToken = response.headers['authorization'];
      // //save to sharedprefs...
      // CacheManager()
      //     .save(CacheManagerKey.TOKEN.toString(), authToken!)
      //     .then((value) => print('$value - Saved token $authToken'));
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
