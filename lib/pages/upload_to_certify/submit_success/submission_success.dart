import 'package:cloud_certify/pages/home/homescreen.dart';
import 'package:cloud_certify/pages/upload_to_certify/paynow/paynow.dart';
import 'package:cloud_certify/view_models/certify_view_model.dart';
import 'package:cloud_certify/view_models/pay_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubmissionSuccess extends StatelessWidget {
  const SubmissionSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var refNum = context.watch<CertifyViewModel>().certifyDetails.referenceNum;
    bool isLoading = context.watch<PayViewModel>().isLoading;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 32),
              Icon(
                Icons.check_circle_outline_outlined,
                size: 120,
                color: Colors.green,
              ),
              SizedBox(height: 64),
              Text('Certify Request Success. Order Ref: $refNum'),
              SizedBox(height: 24),
              isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton.icon(
                      onPressed: () async {
                        await context.read<PayViewModel>().pay(context);
                      },
                      //send post to paymentservice and redirect_to confirmation. post payment(cert id)
                      icon: Icon(Icons.payment),
                      label: Text('Ecocash Pay'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
