import 'package:flutter/material.dart';
import 'package:cloud_certify/pages/common/my_colors.dart';
import 'package:cloud_certify/pages/home/widget_banner.dart';
import 'package:cloud_certify/pages/home/widget_straggered_grid_view.dart';
import 'package:cloud_certify/pages/home/widget_title.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            WidgetBanner(),
            WidgetTitle(),
            WidgetStraggeredGridView(),
          ],
        ),
      ),
    );
  }
}
