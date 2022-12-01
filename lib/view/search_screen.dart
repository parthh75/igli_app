import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utilities/colors.dart';
import '../utilities/common_taxfield.dart';
import '../utilities/text_style.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search Services", style: themeData.textTheme.headline5?.copyWith(color: colorFFFFFF, fontSize: 18))),
      body: Column(
        children: [
          searchMethod(),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  height: 70,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: colorFFFFFF, border: Border.all(color: colorPrimary, width: 2)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(color: colorEAEAEA, borderRadius: BorderRadius.circular(50)),
                        child: Icon(Icons.supervised_user_circle, color: colorFFFFFF),
                      ).paddingOnly(right: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Title", style: themeData.textTheme.headline5?.copyWith(color: colors000000, fontSize: 15)),
                          Text("Hey what's Up! new services add ", style: themeData.textTheme.headline5?.copyWith(color: colors000000, fontSize: 12)),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(color: colorEAEAEA, borderRadius: BorderRadius.circular(50)),
                        child: Icon(
                          Icons.chevron_right,
                          color: colorPrimary,
                        ),
                      )
                    ],
                  ).paddingAll(10),
                ).paddingOnly(top: 10, left: 15, right: 15);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget searchMethod() {
    return Container(
      color: colorFFFFFF,
      child: Row(children: [
        Expanded(
            child: commonTextFormField(
                textFieldHeight: 45,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorPrimary.withOpacity(0.4)),
                  borderRadius: BorderRadius.circular(7),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorPrimary.withOpacity(0.4)),
                  borderRadius: BorderRadius.circular(7),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorPrimary.withOpacity(0.9)),
                  borderRadius: BorderRadius.circular(7),
                ),
                suffixIcon: Image.asset("assets/image/igliLogoIcon.png").paddingAll(7),
                preFixIcon: Icon(Icons.search, color: colorPrimary.withOpacity(0.9)),
                hintText: "Search Services..."))
      ]).paddingSymmetric(horizontal: 15),
    ).paddingOnly(top: 15, bottom: 15);
  }
}
