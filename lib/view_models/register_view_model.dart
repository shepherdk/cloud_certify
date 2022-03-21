import 'package:cloud_certify/models/register_request_model.dart';
import 'package:cloud_certify/models/register_response_model.dart';
import 'package:cloud_certify/pages/login/login_page.dart';
import 'package:cloud_certify/services/register_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterViewModel with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> regUser(
      {required String name,
      required String surname,
      required String emailAddress,
      required String mobileNumber,
      required String userName,
      required String password,
      required BuildContext context}) async {
    setLoading(true);

    print('$name $surname $emailAddress $mobileNumber $userName');

    RegisterService regService = RegisterService();
    await regService
        .signup(RegisterRequestModel(
            name: name,
            surname: surname,
            emailAddress: emailAddress,
            mobileNumber: mobileNumber,
            userName: userName,
            password: password))
        .then((value) {
      var status_code = value["statusCode"];

      if (status_code == 200) {
        var responseModel = RegisterResponseModel.fromJson(value);

        print(responseModel.toString());

        displayNotice('Successfully created account, please sign in', context,
            color: Colors.black87);

        Future.delayed(Duration(seconds: 2)).then((value) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        });
      } else {
        print('Error $status_code = ${value["message"]}');

        displayNotice('Error ${value["message"]}', context, color: Colors.red);
      }
    }).onError((error, stackTrace) {
      // use status codes to give useful errors messages.
      displayNotice('Something went wrong: $error', context, color: Colors.red);
      print('Error 1 : ${error}');
    });

    setLoading(false);
    print('Done sign up view model');
    return;
  }

  void displayNotice(String s, context, {Color color = Colors.black}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 6),
      content: Text(s),
      backgroundColor: color,
    ));
  }
}
