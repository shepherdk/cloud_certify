import 'package:cloud_certify/pages/upload_to_certify/file_demo.dart';
import 'package:cloud_certify/pages/upload_to_certify/upload_original/upload_original.dart';
import 'package:flutter/material.dart';

class UploadToCertify extends StatelessWidget {
  const UploadToCertify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UploadOriginal();
    // return FilePickerDemo();
    // return Scaffold(
    //   appBar: _buildAppBar(),
    //   body: Container(
    //     child: Center(
    //       child: Text('Upload docs to certify them!'),
    //     ),
    //   ),
    // );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Upload Docs'),
    );
  }
}
