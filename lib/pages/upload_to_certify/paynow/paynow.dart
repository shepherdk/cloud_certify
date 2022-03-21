import 'package:cloud_certify/pages/upload_to_certify/paynow/paynow_body.dart';
import 'package:flutter/material.dart';

class PayNow extends StatelessWidget {
  const PayNow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Process Payment'),
      // ),
      //need another page with a list of items and their prices...
      body: PayNowBody(),
    );
  }
}
