import 'package:cloud_certify/pages/upload_to_certify/select_certificate_type/select_document_type.dart';
import 'package:cloud_certify/pages/upload_to_certify/upload_to_certify_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_certify/pages/common/my_colors.dart';
import 'package:cloud_certify/pages/common/my_font_size.dart';
import 'package:cloud_certify/pages/common/my_style.dart';
import 'package:cloud_certify/pages/widgets/custom_card.dart';
import 'certify_menu.dart';

class WidgetTimeline3 extends StatefulWidget {
  final IconData? icon;
  final Color? bgcolor;
  final String? title1;

  final bool? showCard;

  const WidgetTimeline3(
      {Key? key, this.icon, this.bgcolor, this.title1, this.showCard})
      : super(key: key);

  @override
  _WidgetTimeline3State createState() => _WidgetTimeline3State();
}

class _WidgetTimeline3State extends State<WidgetTimeline3> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          SizedBox(
            width: 50,
            child: Column(
              children: [
                CustomCard(
                    shadow: true,
                    height: 50,
                    width: 50,
                    bgColor: widget.bgcolor!,
                    borderRadius: BorderRadius.circular(100),
                    child: Center(child: Icon(widget.icon))),
                Expanded(
                  child: Container(
                    width: 1,
                    color: MyColors.blackText,
                  ),
                )
              ],
            ),
          ),
          SizedBox(width: 20),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.title1!,
                          style: MyStyle.textTitleBlack
                              .copyWith(fontSize: MyFontSize.medium2)),
                      SizedBox(height: 5),
                    ],
                  )),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              SizedBox(height: 20),
              if (widget.showCard!)
                CustomCard(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectCertificateType()));
                    },
                    shadow: true,
                    bgColor: MyColors.softGrey,
                    borderRadius: BorderRadius.circular(15),
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(1000),
                          child: Image.asset(
                            "assets/images/business.jpg",
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Business Linsences",
                                  style: MyStyle.textParagraphBlack),
                              Text("Business Certificates ",
                                  style: MyStyle.textParagraphBlack
                                      .copyWith(fontWeight: FontWeight.bold)),
                              Text("Business Transcripts etc",
                                  style: MyStyle.textParagraphBlack),
                            ],
                          ),
                        ),
                      ],
                    )),
              SizedBox(height: 20),
            ],
          ))
        ],
      ),
    );
  }
}
