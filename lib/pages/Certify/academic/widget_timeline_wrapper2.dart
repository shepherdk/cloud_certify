import 'package:flutter/material.dart';
import 'package:cloud_certify/pages/common/my_colors.dart';
import 'package:cloud_certify/pages/Certify/academic/widget_timeline2.dart';

class WidgetTimelineWrapper2 extends StatefulWidget {
  const WidgetTimelineWrapper2({Key? key}) : super(key: key);

  @override
  _WidgetTimelineWrapper2State createState() => _WidgetTimelineWrapper2State();
}

class _WidgetTimelineWrapper2State extends State<WidgetTimelineWrapper2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        children: [
          WidgetTimeline2(
            icon: Icons.school,
            bgcolor: MyColors.softGrey,
            title1: "Academic Documents",
            showCard: true,
          ),
        ],
      ),
    );
  }
}
