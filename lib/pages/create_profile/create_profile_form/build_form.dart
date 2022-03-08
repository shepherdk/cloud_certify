import 'package:cloud_certify/view_models/certify_view_model.dart';
import 'package:cloud_certify/view_models/create_profile_view_model.dart';
import 'package:cloud_certify/view_models/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildForm extends StatefulWidget {
  BuildForm({Key? key}) : super(key: key);

  @override
  _BuildFormState createState() => _BuildFormState();
}

class _BuildFormState extends State<BuildForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nationalIdController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _postalAddressController = TextEditingController();
  TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var userDetails = context.read<LoginViewModel>().userDetails;
    bool isLoading = context.watch<CreateProfileViewModel>().isLoading;
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          SizedBox(height: 20),
          Text(
            'Please complete your profile',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 26),
          TextFormField(
            enabled: false,
            decoration: InputDecoration(
              labelText: '${userDetails.name} ${userDetails.surname}',
              labelStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  borderSide: BorderSide(
                    color: Colors.blueGrey,
                    width: 3,
                  )),
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            validator: validateInput,
            controller: _nationalIdController,
            decoration: InputDecoration(
              //
              labelText: 'National ID 081231234F12',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  borderSide: BorderSide(
                    color: Colors.blueGrey,
                    width: 3,
                  )),
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            validator: validateInput,
            controller: _dobController,
            decoration: InputDecoration(
              //
              labelText: 'Date of birth dd-mm-yyyy',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  borderSide: BorderSide(
                    color: Colors.blueGrey,
                    width: 3,
                  )),
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            validator: validateInput,
            controller: _genderController,
            decoration: InputDecoration(
              labelText: 'Gender MALE/FEMALE',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  borderSide: BorderSide(
                    color: Colors.blueGrey,
                    width: 3,
                  )),
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            validator: validateInput,
            controller: _titleController,
            decoration: InputDecoration(
                labelText: 'Title MR/MRS/MISS',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                      width: 3,
                    ))),
          ),
          SizedBox(height: 20),
          TextFormField(
            validator: validateInput,
            controller: _postalAddressController,
            decoration: InputDecoration(
                labelText: 'Postal Address',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                      width: 3,
                    ))),
          ),
          SizedBox(height: 26),
          isLoading
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(color: Colors.black),
                    ],
                  ),
                )
              : ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')),
                      );
                      await context
                          .read<CreateProfileViewModel>()
                          .createProfile(
                              nationalId: _nationalIdController.text,
                              dob: _dobController.text,
                              gender: _genderController.text,
                              postalAddress: _postalAddressController.text,
                              title: _titleController.text,
                              context: context)
                          .then((value) =>
                              print('--- done profile creation ---'));
                    }
                  },
                  child: Text('Submit'),
                ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  String? validateInput(value) {
    if (value == null || value.isEmpty) {
      return 'Please fill in details';
    }
    return null;
  }
}
