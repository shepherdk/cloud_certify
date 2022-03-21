import 'package:cloud_certify/models/forgot_password_request_model.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_certify/helpers/constants.dart';
import 'package:cloud_certify/helpers/custom_exceptions.dart';
import 'dart:convert';
import 'dart:io';

class ResetPasswordService {
  final String resetPasswordUrl =
      apiBaseUrlUser + 'users/reset-credentials?emailAddress=';

  Future<dynamic> reset(
      {required String? password, required String? email}) async {
    var safeEmail = Uri.encodeComponent(email!);
    String safeUrl = '$resetPasswordUrl$safeEmail';
    print("Calling API: $safeUrl");
    print("Calling parameters: $email $password");

    var responseJson;
    try {
      final response = await http.put(
        Uri.parse(safeUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'password': password!,
        }),
      );
      print('Done... ${response.body.toString()}');
      responseJson = _generateResponse(response);
    } on SocketException {
      print('No network connection');
      throw FetchDataException('No Internet connection');
    }
    print('.......ending post reset password service');

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
      throw UnauthorisedException(response.body.toString());

    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode: ${response.statusCode}');
  }
}
