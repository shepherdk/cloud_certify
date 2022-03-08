import 'package:cloud_certify/pages/Certify/personal/ID/id_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cloud_certify/pages/common/my_colors.dart';
import 'package:cloud_certify/pages/common/my_font_size.dart';
import 'package:cloud_certify/pages/Certify/certify.dart';
import 'package:cloud_certify/pages/widgets/custom_card.dart';
import 'package:cloud_certify/pages/login/profile_page.dart';

class WidgetOptions extends StatefulWidget {
  const WidgetOptions({Key? key}) : super(key: key);

  @override
  _WidgetOptionsState createState() => _WidgetOptionsState();
}

class _WidgetOptionsState extends State<WidgetOptions> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: [
          CustomCard(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TrackingShipment()));
            },
            shadow: true,
            width: double.infinity,
            bgColor: MyColors.softGrey,
            borderRadius: BorderRadius.circular(15),
            padding: EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCard(
                    shadow: true,
                    height: 50,
                    width: 50,
                    bgColor: MyColors.yellow,
                    borderRadius: BorderRadius.circular(100),
                    child: Center(
                      child: Icon(Icons.document_scanner),
                    )),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Birth Certificate",
                  style: TextStyle(
                      color: MyColors.blackText,
                      fontSize: MyFontSize.medium1,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          // number 2
          CustomCard(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            shadow: true,
            width: double.infinity,
            bgColor: MyColors.softGrey,
            borderRadius: BorderRadius.circular(15),
            padding: EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCard(
                  shadow: false,
                  height: 50,
                  width: 50,
                  bgColor: MyColors.yellow,
                  borderRadius: BorderRadius.circular(100),
                  child: Center(
                    child: Icon(Icons.document_scanner),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Passport",
                  style: TextStyle(
                      color: MyColors.blackText,
                      fontSize: MyFontSize.medium1,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          //number 3
          CustomCard(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => IDMenu()));
            },
            shadow: true,
            width: double.infinity,
            bgColor: MyColors.softGrey,
            borderRadius: BorderRadius.circular(15),
            padding: EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCard(
                  shadow: true,
                  height: 50,
                  width: 50,
                  bgColor: MyColors.yellow,
                  borderRadius: BorderRadius.circular(100),
                  child: Center(
                    child: Icon(Icons.document_scanner),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "National Identity Card",
                  style: TextStyle(
                      color: MyColors.blackText,
                      fontSize: MyFontSize.medium1,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          //number 3
          CustomCard(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            shadow: true,
            width: double.infinity,
            bgColor: MyColors.softGrey,
            borderRadius: BorderRadius.circular(15),
            padding: EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCard(
                  shadow: true,
                  height: 50,
                  width: 50,
                  bgColor: MyColors.yellow,
                  borderRadius: BorderRadius.circular(100),
                  child: Center(
                    child: Icon(Icons.document_scanner),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Marriage Certificate",
                  style: TextStyle(
                      color: MyColors.blackText,
                      fontSize: MyFontSize.medium1,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
