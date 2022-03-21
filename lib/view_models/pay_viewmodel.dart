import 'package:cloud_certify/pages/upload_to_certify/paynow/paynow.dart';
import 'package:cloud_certify/services/payment_service.dart';
import 'package:cloud_certify/view_models/certify_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PayViewModel extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Future<void> pay(BuildContext context) async {
    setIsLoading(true);
    try {
      var _certId = context.read<CertifyViewModel>().certifyDetails.id;
      print('Cert id = $_certId');
      var response = await PayService().pay(certId: _certId);
      print(response.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Payment success...')));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PayNow()));
    } catch (e) {
      print('Error $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    }
    setIsLoading(false);
  }
}
