import 'package:cloud_certify/pages/create_profile/upload_id_screen/components/body.dart';
import 'package:flutter/material.dart';

class UploadIdScreen extends StatelessWidget {
  const UploadIdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Body(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Create Profile'),
    );
  }
}
