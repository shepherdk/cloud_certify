import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_certify/pages/Certify/business/widget_option.dart';
import 'widget_title.dart';

class CertifyMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CertifyMenuState();
  }
}

class _CertifyMenuState extends State<CertifyMenu> {
  double _drawerIconSize = 24;
  double _drawerFontSize = 17;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Certify (business docs)",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          elevation: 0.5,
          iconTheme: IconThemeData(color: Colors.white),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                  Theme.of(context).primaryColor,
                  Theme.of(context).accentColor,
                ])),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(
                top: 16,
                right: 16,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              WidgetTitle(),
              WidgetOptions(),
            ],
          ),
        ),
      ),
    );
  }
}
