//store file id's in provider...before submission
//will also need profile id...store it in provider on profile creation, or look it up and save it on login.
//store the profile, certifyresponse, in provider...
//view model [portal] decides whether to send to home or login, on lookup [user id/profile id]
//if user id is present = isLogged = true, profileId is present = hasProfile = true.
//if hasProfile = false => redirectTo profileCreate on certify click.
//store usermodel[isLogged? homepage(find it in prefs) : loginPage(on login its there) ]
//and profileModel [hasProfile = true] in memory on login
//protect profile page by checking if hasProfile

import 'dart:convert';
import 'package:cloud_certify/core/auth_manager.dart';
import 'package:cloud_certify/core/cache_manager.dart';
import 'package:cloud_certify/models/create_profile_request_model.dart';
import 'package:cloud_certify/models/create_profile_response_model.dart'
    as createProfileResponseModel;
import 'package:cloud_certify/pages/home/homescreen.dart';
import 'package:cloud_certify/services/create_profile_service.dart';
import 'package:cloud_certify/view_models/login_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateProfileViewModel with ChangeNotifier {
  var profileDetails; //super important. used to submit certify/add
  var _profileImageId = '0';
  bool _isLoading = false;

  get isLoading => _isLoading;
  get profileImageId => _profileImageId;

  setLoading(isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  setProfileImageId(profileImageId) {
    _profileImageId = profileImageId;
    notifyListeners();
  }

  ///create profile here!
  Future<void> createProfile(
      {required String nationalId,
      required String dob,
      required String gender,
      required String postalAddress,
      required String title,
      required BuildContext context}) async {
    setLoading(true);

    var userDetails = context.read<LoginViewModel>().userDetails;
    // PhysicalAddress homeAddress = PhysicalAddress()
    print(jsonEncode(CreateProfileRequestModel(
      dateOfBirth: dob,
      gender: gender,
      postalAddress:
          PhysicalAddress(city: postalAddress, street: '', suburb: ''),
      physicalAddress:
          PhysicalAddress(city: postalAddress, street: '', suburb: ''),
      title: title,
      idNumber: nationalId,
      imageId: profileImageId,
      emailAddress: userDetails.emailAddress,
      mobileNumber: userDetails.mobileNumber,
      name: userDetails.name,
      surname: userDetails.surname,
      userName: userDetails.userName,
    ).toJson())
        .toString());
    //
    await CreateProfileService()
        .createProfile(CreateProfileRequestModel(
      dateOfBirth: dob,
      gender: gender,
      postalAddress:
          PhysicalAddress(city: postalAddress, street: '', suburb: ''),
      physicalAddress:
          PhysicalAddress(city: postalAddress, street: '', suburb: ''),
      title: title,
      idNumber: nationalId,
      imageId: profileImageId,
      emailAddress: userDetails.emailAddress,
      mobileNumber: userDetails.mobileNumber,
      workTelephone: userDetails.mobileNumber,
      name: userDetails.name,
      surname: userDetails.surname,
      userName: userDetails.userName,
    ))
        //and then
        .then((value) async {
      var status_code = value["statusCode"];

      if (status_code == 200) {
        var responseModel =
            createProfileResponseModel.CreateProfileResponseModel.fromJson(
                value);

        //profile save
        this.profileDetails = responseModel.responseBody;
        //update hasProfile to true
        context.read<AuthManager>().setHasProfile(true);
        //profile id saved to cache, lookup this id before cert
        CacheManager()
            .save(CacheManagerKey.PROFILEID.toString(),
                profileDetails.id.toString())
            .then((value) =>
                print('$value: Saved profile id : ${profileDetails.id}'));
        displayNotice('Profile Creation Success', context,
            color: Colors.black87);

        Future.delayed(Duration(seconds: 2)).then((value) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        });
      }
    }).onError((error, stackTrace) {
      displayNotice('Something went wrong. $error', context, color: Colors.red);
      print('Error 1 : ${error}');
    });

    setLoading(false);
  }
}
