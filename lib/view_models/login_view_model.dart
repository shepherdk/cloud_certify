import 'package:cloud_certify/core/auth_manager.dart';
import 'package:cloud_certify/core/cache_manager.dart';
import 'package:cloud_certify/helpers/custom_exceptions.dart';
import 'package:cloud_certify/models/login_request_model.dart';
import 'package:cloud_certify/models/login_response_model.dart';
import 'package:cloud_certify/models/profile_model.dart';
import 'package:cloud_certify/pages/home/homescreen.dart';
import 'package:cloud_certify/services/create_profile_service.dart';
import 'package:cloud_certify/services/login_service.dart';
import 'package:cloud_certify/view_models/create_profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginViewModel with ChangeNotifier {
  //store user id and token in sharedprefs
  //save user model, id, token will be available by virtue
  //of provider.
  //just access provide.of context loginviewmodel id
  //_busy = true, then change to false after request completed
  var userDetails;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> loginUser(
      {required String userName,
      required String password,
      required BuildContext context}) async {
    setLoading(true);
    print(isLoading);
    print('Loading');

    String errorMsg = 'Something went wrong...';
    //process login and get response
    LoginService loginService = LoginService();

    await loginService
        .login(LoginRequestModel(userName: userName, password: password))

        //then what???
        .then((value) async {
      var status_code = value["statusCode"];

      if (status_code == 200) {
        var responseModel = LoginResponseModel.fromJson(value);

        this.userDetails = responseModel.responseBody;

        ///
        ///
        await CreateProfileService()
            .getProfileByEmail(email: responseModel.responseBody!.emailAddress)
            .then((value) {
          var status_code = value["statusCode"];

          if (status_code == 200) {
            print('Success - email already has a profile assoc with it');
            ProfileModel responseModel =
                ProfileModel.fromJson(value["responseBody"]);
            context.read<AuthManager>().setHasProfile(true); //money
            context.read<CreateProfileViewModel>().profileDetails =
                responseModel;
            print('Saved details ehehe ${responseModel.workTelephone}');
          } else {
            print('Not 200 ok; user doesnt have a profile with that email');
          }
        }).onError<FetchDataException>((error, stackTrace) {
          print('Error occured: $error');
          return;
        }).onError((error, stackTrace) {
          print('Some other type of error(has profile not true) $error');
          //in this case hasProfile is false
        });
        ////done processing create profile service
        ///
        ///

        //save id in cache
        CacheManager()
            .save(CacheManagerKey.USERID.toString(), userDetails.id.toString())
            .then((value) => print('$value: Saved id : ${userDetails.id}'));
        displayNotice('Login Success', context, color: Colors.black87);

        Future.delayed(Duration(seconds: 2)).then((value) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        });
      } else {
        print('Error 200! = ${value["message"]}');

        if (status_code == 400) errorMsg = 'Incorrect username or password';

        displayNotice('Error $errorMsg', context, color: Colors.red);
      }
    })
        //error
        .onError((error, stackTrace) {
      displayNotice(errorMsg, context, color: Colors.red);
      print('Error 1 : ${error}');
    });

    setLoading(false);
    print('Loading Done');
    return;
  }
}

void displayNotice(String s, context, {Color color = Colors.black}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: Duration(seconds: 6),
    content: Text(s),
    backgroundColor: color,
  ));
}
