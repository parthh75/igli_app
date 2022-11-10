import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/utilities/colors.dart';
import 'package:igli_financial/view/more/myprofile.dart';

commonSheet({context, headText, title, discription, onTap}) {
  return showModalBottomSheet(
    constraints: const BoxConstraints(maxHeight: 300),
    shape: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20))),
    context: context,
    builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Center(
                child: Text(
              headText,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            )),
            trailing: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.close)),
          ),
          const Divider(),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ).paddingOnly(top: 15, left: 15),
          Text(discription)
              .paddingOnly(top: 15, bottom: 10, left: 15, right: 15),
          const Spacer(),
          commonElevatedButton(
                  onTap: onTap,
                  title: "Request call back",
                  buttonColor: color26569a,
                  buttonBottomPadding: 50)
              .paddingSymmetric(horizontal: 20),
        ],
      );
    },
  );
}

Widget commonListTile({title, leadingIcon, onTap, shape}) {
  return ListTile(
    title: Text(title),
    trailing: const Icon(Icons.navigate_next),
    leading: Icon(leadingIcon, color: colorPrimary, size: 20),
    horizontalTitleGap: -5,
    tileColor: Colors.white,
    onTap: onTap,
    shape: shape,
  ).paddingOnly(bottom: 6);
}

Widget commonExpansionTile({title, children}) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
    child: Card(
      color: colorBEC3C8.withOpacity(0.1),
      shadowColor: Colors.transparent,
      shape: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black26)),
      child: ExpansionTile(
        collapsedBackgroundColor: colorEAEAEA,
        textColor: colorPrimary,
        title: Text(title),
        children: children ?? [],
      ),
    ),
  );
}
