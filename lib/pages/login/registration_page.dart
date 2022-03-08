import 'package:cloud_certify/view_models/register_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_certify/pages/widgets/theme_helper.dart';
import 'package:cloud_certify/pages/widgets/header_widget.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

import 'profile_page.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;

  TextEditingController _emailAddressController = TextEditingController();
  TextEditingController _mobileNumberController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  //Focus Nodes
  final _emailAddressFocusNode = FocusNode();
  final _mobileNumberFocusNode = FocusNode();
  final _nameFocusNode = FocusNode();
  final _surnameFocusNode = FocusNode();
  final _userNameFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    bool isLoading = context.watch<RegisterViewModel>().isLoading;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 150,
              child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // GestureDetector(
                        //   child: Stack(
                        //     children: [
                        //       Container(
                        //         padding: EdgeInsets.all(10),
                        //         decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(100),
                        //           border:
                        //               Border.all(width: 5, color: Colors.white),
                        //           color: Colors.white,
                        //           boxShadow: [
                        //             BoxShadow(
                        //               color: Colors.black12,
                        //               blurRadius: 20,
                        //               offset: const Offset(5, 5),
                        //             ),
                        //           ],
                        //         ),
                        //         child: Icon(
                        //           Icons.person,
                        //           color: Colors.grey.shade300,
                        //           size: 80.0,
                        //         ),
                        //       ),
                        //       Container(
                        //         padding: EdgeInsets.fromLTRB(80, 80, 0, 0),
                        //         child: Icon(
                        //           Icons.add_circle,
                        //           color: Colors.grey.shade700,
                        //           size: 25.0,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 32.0),
                          child: Text(
                            'Create an account',
                            style:
                                TextStyle(fontSize: 24.0, color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: TextFormField(
                            controller: _nameController,
                            focusNode: _nameFocusNode,
                            decoration: ThemeHelper().textInputDecoration(
                                'First Name', 'Enter your first name'),
                            validator: (value) {
                              return (value == null || value.isEmpty)
                                  ? 'Please Enter Your First Name'
                                  : null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: TextFormField(
                            controller: _surnameController,
                            focusNode: _surnameFocusNode,
                            decoration: ThemeHelper().textInputDecoration(
                                'Last Name', 'Enter your last name'),
                            validator: (value) {
                              return (value == null || value.isEmpty)
                                  ? 'Please Enter Last Name'
                                  : null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: _emailAddressController,
                            focusNode: _emailAddressFocusNode,
                            decoration: ThemeHelper().textInputDecoration(
                                "E-mail address", "Enter your email"),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if (!(val!.isEmpty) &&
                                  !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                      .hasMatch(val)) {
                                return "Enter a valid email address";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: _mobileNumberController,
                            focusNode: _mobileNumberFocusNode,
                            decoration: ThemeHelper().textInputDecoration(
                                "Mobile Number", "Enter your mobile number"),
                            keyboardType: TextInputType.phone,
                            validator: (val) {
                              if (!(val!.isEmpty) &&
                                  !RegExp(r"^(\d+)*$").hasMatch(val)) {
                                return "Enter a valid phone number";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        // SizedBox(height: 20.0),
                        // Container(
                        //   child: TextFormField(
                        //     controller: _userNameController,
                        //     focusNode: _userNameFocusNode,
                        //     decoration: ThemeHelper().textInputDecoration(
                        //         "Username", "Choose a username"),
                        //     validator: (val) {
                        //       if (val!.isEmpty) {
                        //         return "Please enter a username";
                        //       }
                        //       return null;
                        //     },
                        //   ),
                        //   decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        // ),
                        SizedBox(height: 15.0),
                        FormField<bool>(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: checkboxValue,
                                        onChanged: (value) {
                                          setState(() {
                                            checkboxValue = value!;
                                            state.didChange(value);
                                          });
                                        }),
                                    Text(
                                      "I accept all terms and conditions.",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Theme.of(context).errorColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                          validator: (value) {
                            if (!checkboxValue) {
                              return 'You need to accept terms and conditions';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 20.0),
                        isLoading
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: CircularProgressIndicator(
                                    color: Colors.black),
                              )
                            : Container(
                                decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 10, 40, 10),
                                    child: Text(
                                      "Register".toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      await context
                                          .read<RegisterViewModel>()
                                          .regUser(
                                              name: _nameController.text,
                                              surname: _surnameController.text,
                                              emailAddress:
                                                  _emailAddressController.text,
                                              mobileNumber:
                                                  _mobileNumberController.text,
                                              userName: _nameController.text
                                                  .toLowerCase(),
                                              context: context)
                                          .then((value) => print(
                                              '--- done account creation print. Registration ends here ---'));
                                    }
                                  },
                                  // onPressed: () {
                                  //   //Signup....
                                  //   print(''' $_nameController.text,
                                  //         $_surnameController.text
                                  //         $_emailAddressController.text,
                                  //         $_mobileNumberController.text,
                                  //         $_userNameController.text''');
                                  //   if (_formKey.currentState!.validate()) {
                                  //     Navigator.of(context).pushAndRemoveUntil(
                                  //         MaterialPageRoute(
                                  //             builder: (context) => ProfilePage()),
                                  //         (Route<dynamic> route) => false);
                                  //   }
                                  // },
                                ),
                              ),
                        SizedBox(height: 30.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
