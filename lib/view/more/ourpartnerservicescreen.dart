import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/common_widgets/bottomsheet.dart';
import 'package:igli_financial/common_widgets/done_screen.dart';

class OurPartnerServiceScreen extends StatefulWidget {
  String? title;
  Function()? ontap;

  OurPartnerServiceScreen(
      {Key? key, this.title, required Function() this.ontap})
      : super(key: key);

  @override
  State<OurPartnerServiceScreen> createState() =>
      _OurPartnerServiceScreenState();
}

class _OurPartnerServiceScreenState extends State<OurPartnerServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Card(
        child: ListTile(
            title: Text(
              widget.title ?? "",
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
            trailing: const Icon(Icons.navigate_next),
            onTap: widget.ontap),
      ).paddingAll(10),
    );
  }
}
