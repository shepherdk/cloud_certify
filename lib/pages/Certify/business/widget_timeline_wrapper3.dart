import 'package:flutter/material.dart';
import 'package:cloud_certify/pages/common/my_colors.dart';
import 'package:cloud_certify/pages/Certify/business/widget_timeline3.dart';

class WidgetTimelineWrapper3 extends StatefulWidget {
  const WidgetTimelineWrapper3({Key? key}) : super(key: key);

  @override
  _WidgetTimelineWrapper3State createState() => _WidgetTimelineWrapper3State();
}

class _WidgetTimelineWrapper3State extends State<WidgetTimelineWrapper3> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        children: [
          WidgetTimeline3(
            icon: Icons.business,
            bgcolor: MyColors.softGrey,
            title1: "Business Documents",
            showCard: true,
          ),
        ],
      ),
    );
  }
}
