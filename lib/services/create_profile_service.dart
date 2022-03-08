import 'dart:convert';
import 'dart:io';
import 'package:cloud_certify/core/auth_manager.dart';
import 'package:cloud_certify/core/cache_manager.dart';
import 'package:cloud_certify/helpers/constants.dart';
import 'package:cloud_certify/helpers/custom_exceptions.dart';
import 'package:cloud_certify/models/create_profile_request_model.dart';
import 'package:http/http.dart' as http;

class CreateProfileService {
  final String createProfileUrl = apiBaseUrlOath + 'profile/create/';
  final String getProfileUrl = apiBaseUrlOath + 'profile/email/';

  Future<dynamic> getProfileByEmail({required String? email}) async {
    var safeEmail = Uri.encodeComponent(email!);
    var getByEmailUrl = '$getProfileUrl$safeEmail/';
    print("Calling API: $getByEmailUrl");
    print("Calling parameters: $email");

    var responseJson;
    try {
      final response = await http.get(
        Uri.parse(getByEmailUrl),
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
    print('.......ending get profile by email service');
    return responseJson;
  }

  Future<dynamic> createProfile(CreateProfileRequestModel model) async {
    print("Calling API: $createProfileUrl");
    print("Calling parameters: ${model.imageId}");

    var responseJson;
    try {
      final response = await http.post(
        Uri.parse(createProfileUrl),
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
    print('.......ending create profile service');
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
