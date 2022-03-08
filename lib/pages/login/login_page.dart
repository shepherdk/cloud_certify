import 'package:cloud_certify/pages/home/home.dart';
import 'package:cloud_certify/pages/home/homescreen.dart';
import 'package:cloud_certify/view_models/login_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cloud_certify/pages/widgets/theme_helper.dart';
import 'package:provider/provider.dart';
import 'forgot_password_page.dart';
import 'profile_page.dart';
import 'registration_page.dart';
import 'package:cloud_certify/pages/widgets/header_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double _headerHeight = 250;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _userNameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    bool isLoading = context.watch<LoginViewModel>().isLoading;
    String buttonText = 'SIGN IN';
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true,
                  Icons.image), //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(
                      20, 10, 20, 10), // This will be the login form
                  child: Column(
                    children: [
                      Text(
                        'Welcome To Cloud Certify',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 30.0),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                child: TextFormField(
                                  controller: _userNameController,
                                  focusNode: _userNameFocusNode,
                                  decoration: ThemeHelper().textInputDecoration(
                                      'User Name', 'Enter your user name'),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Please enter a username";
                                    }
                                    return null;
                                  },
                                ),
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 30.0),
                              Container(
                                child: TextFormField(
                                  controller: _passwordController,
                                  focusNode: _passwordFocusNode,
                                  obscureText: true,
                                  decoration: ThemeHelper().textInputDecoration(
                                      'Password', 'Enter your password'),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Please enter your password";
                                    }
                                    return null;
                                  },
                                ),
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 32.0),
                              isLoading
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40),
                                      child: CircularProgressIndicator(
                                          color: Colors.black),
                                    )
                                  : Container(
                                      decoration: ThemeHelper()
                                          .buttonBoxDecoration(context),
                                      child: ElevatedButton(
                                        style: ThemeHelper().buttonStyle(),
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              40, 10, 40, 10),
                                          child: Text(
                                            buttonText.toUpperCase(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                        onPressed: () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            await context
                                                .read<LoginViewModel>()
                                                .loginUser(
                                                    userName:
                                                        _userNameController
                                                            .text,
                                                    password:
                                                        _passwordController
                                                            .text,
                                                    context: context)
                                                .then((value) => print(
                                                    '--- done processing login ---'));
                                          }
                                        },
                                        // onPressed: () {
                                        //   //After successful login we will redirect to profile page. Let's create profile page now
                                        //   Navigator.pushReplacement(
                                        //       context,
                                        //       MaterialPageRoute(
                                        //           builder: (context) =>
                                        //               HomeScreen()));
                                        // },
                                      ),
                                    ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                //child: Text('Don\'t have an account? Create'),
                                child: Text.rich(TextSpan(children: [
                                  TextSpan(text: "Don\'t have an account? "),
                                  TextSpan(
                                    text: 'Create',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RegistrationPage()));
                                      },
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).accentColor),
                                  ),
                                ])),
                              ),
                            ],
                          )),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
