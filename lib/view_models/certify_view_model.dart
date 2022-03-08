//store file id's in provider...before submission
//will also need profile id...store it in provider on profile creation, or look it up and save it on login.
//store the profile, certifyresponse, in provider...
//view model [portal] decides whether to send to home or login, on lookup [user id/profile id]
//if user id is present = isLogged = true, profileId is present = hasProfile = true.
//if hasProfile = false => redirectTo profileCreate on certify click.
//store usermodel[isLogged? homepage(find it in prefs) : loginPage(on login its there) ]
//and profileModel [hasProfile = true] in memory on login

import 'package:cloud_certify/models/certify_request_model.dart';
import 'package:cloud_certify/models/certify_response_model.dart';
import 'package:cloud_certify/pages/upload_to_certify/submit_success/submission_success.dart';
import 'package:cloud_certify/services/certify_service.dart';
import 'package:cloud_certify/view_models/create_profile_view_model.dart';
import 'package:cloud_certify/view_models/login_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CertifyViewModel with ChangeNotifier {
  CertifyResponseModel certifyDetails =
      CertifyResponseModel(); //model to store certificate
  var _originalFileId;
  var _copyFileId;
  bool _isLoading = false;

  get isLoading => _isLoading;
  get originalFileId => _originalFileId;
  get copyFileId => _copyFileId;

  setLoading(isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  setOriginalFileId(originalFileId) {
    _originalFileId = originalFileId;
    notifyListeners();
  }

  setCopyFileId(copyFileId) {
    _copyFileId = copyFileId;
    notifyListeners();
  }

  ///create profile here!
  Future<void> certifySubmit(
      {required String receiptMethod, required BuildContext context}) async {
    setLoading(true);

    var profileId = context.read<CreateProfileViewModel>().profileDetails.id;

    await CertifyService()
        .certfiy((CertifyRequestModel(
            profileId: profileId,
            fileId: originalFileId,
            fileType: 'CERTIFICATES',
            paymentMethod: 'ECOCASH',
            receiptMethod: receiptMethod)))
        //then wha??
        .then((value) {
      var status_code = value["statusCode"];

      if (status_code == 200) {
        var responseModel =
            CertifyResponseModel.fromJson(value["responseBody"]);

        this.certifyDetails = responseModel;
        print(certifyDetails.referenceNum);

        displayNotice('Documents submitted successfully', context,
            color: Colors.black87);

        Future.delayed(Duration(seconds: 2)).then((value) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SubmissionSuccess()));
        });
      }
    }).onError((error, stackTrace) {
      displayNotice('Something went wrong. $error', context, color: Colors.red);
      print('Error CertifyViewModel : ${error}');
    });

    setLoading(false);
  }
}
