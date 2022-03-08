import 'package:flutter/material.dart';
import 'package:cloud_certify/pages/common/my_colors.dart';
import 'package:cloud_certify/pages/common/my_font_size.dart';

class WidgetBanner extends StatefulWidget {
  const WidgetBanner({Key? key}) : super(key: key);

  @override
  _WidgetBannerState createState() => _WidgetBannerState();
}

class _WidgetBannerState extends State<WidgetBanner> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
          child: Image.asset("assets/images/banner1.jpg"),
        ),
        Padding(
          padding: EdgeInsets.only(top: 60, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      SizedBox(height: 3),
                    ],
                  )),
                  Container(
                    width: 40,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(1000),
                      child: Image.asset(
                        "assets/images/logo.png",
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Cloud Certity",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: MyColors.blackText,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Certify your documents in the comfort of your home",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: MyColors.blackText,
                  fontSize: MyFontSize.medium1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
