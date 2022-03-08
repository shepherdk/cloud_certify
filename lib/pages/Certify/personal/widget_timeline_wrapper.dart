import 'package:flutter/material.dart';
import 'package:cloud_certify/pages/common/my_colors.dart';
import 'package:cloud_certify/pages/Certify/personal/widget_timeline.dart';

class WidgetTimelineWrapper extends StatefulWidget {
  const WidgetTimelineWrapper({Key? key}) : super(key: key);

  @override
  _WidgetTimelineWrapperState createState() => _WidgetTimelineWrapperState();
}

class _WidgetTimelineWrapperState extends State<WidgetTimelineWrapper> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        children: [
          WidgetTimeline(
            icon: Icons.person,
            bgcolor: MyColors.softGrey,
            title1: "Personal Documents",
            showCard: true,
          ),
        ],
      ),
    );
  }
}
