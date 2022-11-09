import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/utilities/colors.dart';
import 'package:igli_financial/view/more/myprofile.dart';

class OurPartnerServiceScreen extends StatefulWidget {
  const OurPartnerServiceScreen({Key? key}) : super(key: key);

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
          title: const Text(
            "Oyo WorkSpaces",
            style: TextStyle(fontWeight: FontWeight.normal),
          ),
          trailing: const Icon(Icons.navigate_next),
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Column(
                  children: [
                    Row(
                      children: [
                        const Text("Oyo WorkSpaces"),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.close)),
                      ],
                    ),
                    Container(
                      height: 2,
                      color: color9C9DA0,
                    ),
                    const Text("Significance"),
                    const Text(
                        "Rent out premium office spaces folr your business or company at affordable prices."),
                    commonElevatedButton(
                        title: "Request call back",
                        buttonColor: color26569a,
                        buttonBottomPadding: 50),
                  ],
                );
              },
            );
          },
        ),
      ).paddingAll(10),
    );
  }
}
