import 'package:cloud_certify/pages/upload_to_certify/upload_to_certify_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_certify/pages/common/my_colors.dart';
import 'package:cloud_certify/pages/Certify/widget_banner.dart';
import 'package:cloud_certify/pages/Certify/personal/widget_timeline_wrapper.dart';
import 'academic/widget_timeline_wrapper2.dart';
import 'business/widget_timeline_wrapper3.dart';
import 'package:cloud_certify/pages/Certify/widget_title.dart';

class TrackingShipment extends StatefulWidget {
  const TrackingShipment({Key? key}) : super(key: key);

  @override
  _TrackingShipmentState createState() => _TrackingShipmentState();
}

class _TrackingShipmentState extends State<TrackingShipment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          "Certify your docs",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: MyColors.blackText),
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // WidgetBanner(),
          // WidgetTitle(),
          WidgetTimelineWrapper(),
          WidgetTimelineWrapper2(),
          WidgetTimelineWrapper3(),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UploadToCertify()));
            },
            child: Text('Upload Docs'),
          )
        ],
      ),
    );
  }
}
