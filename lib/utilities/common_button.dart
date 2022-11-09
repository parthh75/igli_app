import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:igli_financial/utilities/text_style.dart';

import 'colors.dart';
import 'common_utilts.dart';

// ignore: non_constant_identifier_names
Widget GetButton(
    {double? height = 53, double? width, Border? border, Color? backGroundColor, Widget? child, double? borderRadius, bool? isBorder, String? text, TextStyle? textStyle, required Function() ontap}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: isBorder != null
            ? isBorder
                ? border
                : Border.all(
                    color: Colors.transparent,
                  )
            : Border.all(
                color: Colors.transparent,
              ),
        borderRadius: BorderRadius.circular(borderRadius ?? 40.0),
        color: backGroundColor ?? colorPrimary,
      ),
      // ignore: prefer_if_null_operators
      child: child != null
          ? child
          : Center(
              child: Text(
              text ?? "",
              style: textStyle ?? themeData.textTheme.subtitle1,
            )),
    ),
  );
}

class CommonButton extends StatelessWidget {
  final String? text;
  final GestureTapCallback? onTap;
  final double? height;
  final double? width;
  final Color? color;
  final bool? isLoading;

  const CommonButton(
    this.text, {
    super.key,
    required this.onTap,
    this.height = 50.0,
    this.width,
    this.color,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width ?? getWidth(context) * .9,
        padding: EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            color: color,
            gradient: color != null
                ? null
                : LinearGradient(
                    begin: Alignment.topLeft,
                    colors: <Color>[Color(0xff489824), Color(0xffA7E24B)], // red to yellow
                    tileMode: TileMode.repeated, // repeats the gradient over the canvas
                  ),
            borderRadius: BorderRadius.circular(8)),
        child: Center(
            child: isLoading!
                ? Container(
                    height: 20,
                    child: SpinKitThreeBounce(
                      color: Colors.white,
                      size: 30.0,
                    ))
                : Text(
                    text!,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
                  )),
      ),
    );
  }
}

class CircularButton extends StatelessWidget {
  final String? text;
  final GestureTapCallback? onTap;
  final double? height;
  final double? width;
  final Color? borderColor;
  final Color? textColor;

  const CircularButton(
    this.text, {
    required this.onTap,
    this.height = 50.0,
    this.width,
    this.borderColor = Colors.white,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(border: Border.all(color: borderColor!, width: .5), borderRadius: BorderRadius.circular(8)),
        child: Center(
            child: Text(
          text!,
          style: TextStyle(color: textColor, fontWeight: FontWeight.w600, fontSize: 16),
        )),
      ),
    );
  }
}
