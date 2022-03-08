import 'package:cloud_certify/pages/create_profile/create_profile_form/build_form.dart';
import 'package:flutter/material.dart';

class CreatProfileForm extends StatelessWidget {
  const CreatProfileForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
        child: BuildForm(),
      ),
      // resizeToAvoidBottomInset: false,
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Create Profile'),
    );
  }
}
