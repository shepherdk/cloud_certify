import 'package:cloud_certify/pages/login/login_page.dart';
import 'package:cloud_certify/services/reset_password_service.dart';
import 'package:cloud_certify/view_models/login_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPasswordViewModel with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> reset(
      {required String email,
      required String password,
      required BuildContext context}) async {
    setLoading(true);
    try {
      var _response;

      await ResetPasswordService()
          .reset(password: password, email: email)
          .then((resp) => _response = resp);
      print(_response.toString());
      var status_code = _response["statusCode"];
      if (status_code == 200) {
        var responseString = _response["responseBody"].toString();
        displayNotice(responseString.toString(), context);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    } catch (e) {
      print('failed');
      displayNotice(e.toString(), context);
    }
    setLoading(false);
  }
}
