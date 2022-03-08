import 'package:flutter/material.dart';
import 'package:cloud_certify/pages/common/my_colors.dart';
import 'package:cloud_certify/pages/common/my_style.dart';
import 'package:cloud_certify/pages/widgets/custom_card.dart';

class WidgetBanner extends StatefulWidget {
  const WidgetBanner({Key? key}) : super(key: key);

  @override
  _WidgetBannerState createState() => _WidgetBannerState();
}

class _WidgetBannerState extends State<WidgetBanner> {
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      shadow: true,
      width: double.infinity,
      bgColor: MyColors.softGrey,
      borderRadius: BorderRadius.circular(15),
      padding: EdgeInsets.all(25),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 40),
            child: CustomCard(
                shadow: true,
                width: double.infinity,
                bgColor: MyColors.green,
                borderRadius: BorderRadius.circular(15),
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(1000),
                      child: Image.asset(
                        "assets/images/amblem.png",
                        height: 55,
                        width: 55,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 40),
                  ],
                )),
          ),
          Positioned(
            left: 50,
            right: 50,
            bottom: 0,
            child: CustomCard(
                shadow: true,
                width: double.infinity,
                bgColor: MyColors.yellow,
                borderRadius: BorderRadius.circular(15),
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      "Services",
                      style: MyStyle.textParagraphBlack.copyWith(),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Certify your documents",
                      style: MyStyle.textParagraphBlack
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
