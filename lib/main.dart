import 'package:cloud_certify/core/auth_manager.dart';
import 'package:cloud_certify/view_models/certify_view_model.dart';
import 'package:cloud_certify/view_models/create_profile_view_model.dart';
import 'package:cloud_certify/view_models/login_view_model.dart';
import 'package:cloud_certify/view_models/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'pages/login/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => LoginViewModel()),
      ChangeNotifierProvider(create: (context) => RegisterViewModel()),
      ChangeNotifierProvider(create: (context) => CreateProfileViewModel()),
      ChangeNotifierProvider(create: (context) => CertifyViewModel()),
      ChangeNotifierProvider(create: (context) => AuthManager()),
    ],
    child: LoginUiApp(),
  ));
}

class LoginUiApp extends StatelessWidget {
  Color _primaryColor = HexColor('#DC54FE');
  Color _accentColor = HexColor('#8A02AE');

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Cloud Certify',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: _primaryColor,
        accentColor: _accentColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,
      ),
      home: SplashScreen(title: 'Cloud Certify App'),
    );
  }
}
