import 'package:cloud_certify/core/auth_manager.dart';
import 'package:cloud_certify/pages/create_profile/create_profile_screen.dart';
import 'package:cloud_certify/view_models/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cloud_certify/pages/common/my_colors.dart';
import 'package:cloud_certify/pages/common/my_font_size.dart';
import 'package:cloud_certify/pages/Certify/certify.dart';
import 'package:cloud_certify/pages/widgets/custom_card.dart';
import 'package:cloud_certify/pages/login/profile_page.dart';
import 'package:provider/provider.dart';

class WidgetStraggeredGridView extends StatefulWidget {
  const WidgetStraggeredGridView({Key? key}) : super(key: key);

  @override
  _WidgetStraggeredGridViewState createState() =>
      _WidgetStraggeredGridViewState();
}

class _WidgetStraggeredGridViewState extends State<WidgetStraggeredGridView> {
  @override
  Widget build(BuildContext context) {
    var hasProfile = context.read<AuthManager>().hasProfile;

    return Padding(
      padding: EdgeInsets.all(20),
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: [
          CustomCard(
            onTap: () {
              if (hasProfile == false)
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: Duration(seconds: 6),
                  content: Text('Please complete your profile first'),
                  backgroundColor: Colors.black,
                ));
              ;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => (hasProfile == true)
                          ? TrackingShipment()
                          : CreateProfileScreen()));
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
                  "Certify",
                  style: TextStyle(
                      color: MyColors.blackText,
                      fontSize: MyFontSize.medium1,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Click to upload the documents you want to certify",
                  style: TextStyle(
                    color: MyColors.blackText.withOpacity(.8),
                    fontSize: MyFontSize.small3,
                  ),
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
                  "My Profile",
                  style: TextStyle(
                      color: MyColors.blackText,
                      fontSize: MyFontSize.medium1,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Settings and all your personal details, please click the here.",
                  style: TextStyle(
                    color: MyColors.blackText.withOpacity(.8),
                    fontSize: MyFontSize.small3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
