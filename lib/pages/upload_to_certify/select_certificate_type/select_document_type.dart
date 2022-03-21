import 'package:cloud_certify/pages/upload_to_certify/select_certificate_type/select_body.dart';
import 'package:flutter/material.dart';

class SelectCertificateType extends StatelessWidget {
  const SelectCertificateType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Type'),
      ),
      body: SelectBody(),
    );
  }
}
