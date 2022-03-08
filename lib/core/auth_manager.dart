import 'package:cloud_certify/core/cache_manager.dart';
import 'package:cloud_certify/models/user_details_model.dart';
import 'package:cloud_certify/services/login_service.dart';
import 'package:cloud_certify/view_models/login_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

enum CacheManagerKey { TOKEN, USERID, PROFILEID }

class AuthManager with ChangeNotifier {
  bool _isLogged = false;
  bool _hasProfile = false;

  bool get isLogged => _isLogged;
  bool get hasProfile => _hasProfile;

  setIsLogged(bool isLogged) {
    _isLogged = isLogged;
    notifyListeners();
  }

  setHasProfile(bool hasProfile) {
    _hasProfile = hasProfile;
    notifyListeners();
  }

  //login our user
  //save token and user id on login
  Future<void> login(String bearerAuth, String userId) async {
    await CacheManager().save(CacheManagerKey.TOKEN.toString(), bearerAuth);
    await CacheManager().save(CacheManagerKey.USERID.toString(), userId);
    setIsLogged(true);
  }

  Future<void> logOut() async {
    await CacheManager().delete(CacheManagerKey.TOKEN.toString());
    await CacheManager().delete(CacheManagerKey.USERID.toString());
    await CacheManager().delete(CacheManagerKey.PROFILEID.toString());
    setIsLogged(false);
  }

  Future<bool> isAuthenticated() async {
    final token = await CacheManager().read(CacheManagerKey.TOKEN.toString());
    final userId = await CacheManager().read(CacheManagerKey.USERID.toString());
    if ((token != null) && (userId != null)) {
      print('User logged in id $userId token $token');
      return true;
    }
    print('User not logged in. no token found');
    return false;
  }

  Future<bool> profileExists() async {
    //do a get to check profile
    return false;
  }

  Future<void> getProfileDetails(int profileId) async {
    //retrieve profile details of our user, if profile id is in cache
    //save in provider
    //use email in provider (userDetails) to check if user has a profile
  }

  Future<void> getUserDetails(BuildContext context) async {
    //retrieve user details if user id is in sharedprefs cache
    //save them in provider

    try {
      var userId = await CacheManager().read(CacheManagerKey.USERID.toString());
      int myUserId = int.parse(userId!);

      await LoginService().getUser(myUserId).then((value) {
        var status_code = value["statusCode"];

        if (status_code == 200) {
          UserDetailsModel responseModel =
              UserDetailsModel.fromJson(value["responseBody"]);
          context.read<LoginViewModel>().userDetails =
              responseModel; //set user details here

        } else {
          print('Details not found go to login');
        }
      }).onError((error, stackTrace) {
        print('Details not stored on device; go to login screen');
      });

      ///error on parsing int
    } catch (e) {
      print('user id not found in Cache manager $e');
      print('Go to login!');
    }
  }
}
