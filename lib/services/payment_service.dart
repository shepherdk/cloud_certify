import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:cloud_certify/helpers/constants.dart';
import 'package:cloud_certify/helpers/custom_exceptions.dart';

class PayService {
// const String apiBaseUrlOath = 'http://3.237.190.233:8092/api/v1/payment?certificationId=17';

  Future<dynamic> pay({required certId}) async {
    final String payUrl = apiBaseUrlOath + 'payment?certificationId=$certId';
    print("Calling API: $payUrl");
    print("Calling parameters: $certId");

    var responseJson;
    try {
      final response = await http.post(
        Uri.parse(payUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );

      responseJson = _generateResponse(response);

      print('payment  request completed!!!');
    } on SocketException {
      print('No network connection');
      throw FetchDataException('No Internet connection');
    }
    print('.....ending payment service');
    return responseJson;
  }

  dynamic _generateResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        //var responseJson = jsonDecode(response.body);

        return response;
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
