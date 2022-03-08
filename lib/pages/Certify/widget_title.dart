import 'package:flutter/material.dart';
import 'package:cloud_certify/pages/common/my_style.dart';

class WidgetTitle extends StatefulWidget {
  const WidgetTitle({Key? key}) : super(key: key);

  @override
  _WidgetTitleState createState() => _WidgetTitleState();
}

class _WidgetTitleState extends State<WidgetTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: Row(
        children: [
          Expanded(
            child: Text("Our services", style: MyStyle.textTitleBlack),
          ),
        ],
      ),
    );
  }
}
