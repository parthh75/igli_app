/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:igli_financial/utilities/label_text.dart';
import 'package:igli_financial/utilities/text_style.dart';

import 'colors.dart';
import 'common_utilts.dart';

class CommonTextField extends StatelessWidget {
  final String? fieldTitleText;
  final String? hintText;
  final bool? isPassword;
  final TextEditingController? textEditingController;
  final TextInputAction? textInputAction;
  final Function? validationFunction;
  final Function? onSavedFunction;
  final Function? onFieldSubmit;
  final bool? autofocus;
  final TextInputType? keyboardType;
  final Function? onTapFunction;
  final Function? onChangedFunction;
  final TextAlign? align;
  final List<TextInputFormatter>? inputFormatter;
  final bool? isEnabled;
  final int? errorMaxLines;
  final int? maxLine;
  final bool? isReadOnly;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final Widget? preFixIcon;
  final BorderRadius? radius;
  final double? width;
  final GestureTapCallback? onTap;
  final Color? borderColor;
  final UnderlineInputBorder? underlineInputBorder;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final Color? filledColor;
  final Color? cursorColor;
  final EdgeInsetsGeometry? contentPadding;

  const CommonTextField({
    super.key,
    this.fieldTitleText,
    this.hintText,
    this.isPassword,
    this.textEditingController,
    this.textInputAction,
    this.validationFunction,
    this.onSavedFunction,
    this.onFieldSubmit,
    this.autofocus = false,
    this.keyboardType,
    this.onTapFunction,
    this.onChangedFunction,
    this.align = TextAlign.start,
    this.inputFormatter,
    this.isEnabled,
    this.width,
    this.errorMaxLines,
    this.maxLine,
    this.isReadOnly,
    this.focusNode,
    this.suffixIcon,
    this.preFixIcon,
    this.radius,
    this.onTap,
    this.borderColor,
    this.underlineInputBorder,
    this.hintStyle,
    this.style,
    this.filledColor,
    this.contentPadding,
    this.cursorColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    bool passwordVisible = isPassword ?? false;
    OutlineInputBorder textFieldBorderStyle = OutlineInputBorder(
      borderSide: BorderSide(color: borderColor ?? Colors.grey, width: 0.5),
      borderRadius: radius ?? BorderRadius.circular(10),
    );
    return SizedBox(
      width: width ?? getWidth(context) * .9,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          // height: 80,
          width: width ?? getWidth(context),
          child: StatefulBuilder(builder: (context, newSetState) {
            // return Obx(() {
            return TextFormField(
              // textInputAction: tex,
              autofocus: autofocus!,
              focusNode: focusNode,
              cursorColor: cursorColor,
              // for scroll extra while keyboard open
              // scrollPadding: EdgeInsets.fromLTRB(20, 20, 20, 120),
              enabled: isEnabled != null && !isEnabled! ? false : true,
              textAlign: align!,
              onTap: onTapFunction != null ? onTapFunction!() : () {},
              // key: key,
              onChanged: (value) {
                if (onChangedFunction != null) {
                  onChangedFunction!(value);
                }
              },
              validator: (value) {
                return validationFunction != null ? validationFunction!(value) : null;
              },
              // onSaved: onSavedFunction != null ? onSavedFunction : (value) {},
              onSaved: (value) {
                return onSavedFunction != null ? onSavedFunction!(value) : null;
              },
              onFieldSubmitted: (value) {
                return onFieldSubmit != null ? onFieldSubmit!(value) : null;
              },
              maxLines: maxLine ?? 1,
              keyboardType: keyboardType,
              controller: textEditingController,
              textInputAction: textInputAction,
              selectionControls: MaterialTextSelectionControls(),
              // cursorColor: AppThemeController.it.isDarkMode.value ? Colors.white :Colors.black,
              // initialValue: initialText,
              obscureText: passwordVisible,
              style: style ?? themeData.textTheme.subtitle2?.copyWith(color: colors000000),
              inputFormatters: inputFormatter,
              decoration: InputDecoration(
                fillColor: filledColor ?? Colors.transparent,
                errorMaxLines: errorMaxLines ?? 1,
                filled: true,
                contentPadding: contentPadding ?? const EdgeInsets.fromLTRB(0.0, 14.0, 10.0, 10.0),
                focusedBorder: underlineInputBorder ?? textFieldBorderStyle,
                disabledBorder: underlineInputBorder ?? textFieldBorderStyle,
                enabledBorder: underlineInputBorder ?? textFieldBorderStyle,
                errorBorder: underlineInputBorder ?? textFieldBorderStyle,
                focusedErrorBorder: underlineInputBorder ?? textFieldBorderStyle,
                hintText: hintText,
                hintStyle: hintStyle ?? themeData.textTheme.subtitle2?.copyWith(color: colors000000),
                prefixIcon: preFixIcon,
                suffixIcon: isPassword != null && isPassword!
                    ? InkWell(
                        onTap: () {
                          newSetState(() {
                            // isPassword = !isPassword!;
                            passwordVisible = !passwordVisible;
                          });
                        },
                        child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 10,
                            child: passwordVisible
                                ? const Icon(
                                    CupertinoIcons.eye,
                                    color: Colors.grey,
                                  )
                                : const Icon(
                                    CupertinoIcons.eye_slash,
                                    color: Colors.grey,
                                  )))
                    : suffixIcon,
              ),
            );
            // });
          }),
        ),
      ),
    );
  }
}

class CommonTextFieldLabel extends StatelessWidget {
  final String? label;
  final String? fieldTitleText;
  final String? hintText;
  final bool? isPassword;
  final TextEditingController? textEditingController;
  final Function? validationFunction;
  final Function? onSavedFunction;
  final Function? onFieldSubmit;
  final bool? autofocus;
  final TextInputType? keyboardType;
  final Function? onTapFunction;
  final Function? onChangedFunction;
  final TextAlign? align;
  final List<TextInputFormatter>? inputFormatter;
  final bool? isEnabled;
  final int? errorMaxLines;
  final int? maxLine;
  final bool? isReadOnly;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final Widget? preFixIcon;
  final BorderRadius? radius;
  final double? width;
  final Widget? labelTrailing;
  final GestureTapCallback? onTap;
  final UnderlineInputBorder? underlineInputBorder;
  final TextInputAction? textInputAction;

  const CommonTextFieldLabel(
    this.label, {
    super.key,
    this.fieldTitleText,
    this.textInputAction,
    this.hintText,
    this.isPassword,
    this.textEditingController,
    this.validationFunction,
    this.onSavedFunction,
    this.onFieldSubmit,
    this.autofocus = false,
    this.keyboardType,
    this.onTapFunction,
    this.onChangedFunction,
    this.align = TextAlign.start,
    this.inputFormatter,
    this.isEnabled,
    this.width,
    this.errorMaxLines,
    this.maxLine,
    this.isReadOnly,
    this.focusNode,
    this.suffixIcon,
    this.preFixIcon,
    this.radius,
    this.labelTrailing,
    this.onTap,
    this.underlineInputBorder,
  });

  @override
  Widget build(BuildContext context) {
    bool passwordVisible = isPassword ?? false;
    OutlineInputBorder textFieldBorderStyle = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey, width: 0.5),
      borderRadius: radius ?? BorderRadius.circular(10),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [label == null || label!.isEmpty ? Container() : Label(label!), labelTrailing == null ? Container() : labelTrailing!],
        ).paddingOnly(bottom: 10),
        InkWell(
          onTap: onTap,
          child: SizedBox(
            height: 80,
            width: width ?? getWidth(context),
            child: StatefulBuilder(builder: (context, newSetState) {
              // return Obx(() {
              return TextFormField(
                textInputAction: textInputAction,
                autofocus: autofocus!,
                focusNode: focusNode,
                // for scroll extra while keyboard open
                // scrollPadding: EdgeInsets.fromLTRB(20, 20, 20, 120),
                enabled: isEnabled != null && !isEnabled! ? false : true,
                textAlign: align!,
                onTap: onTapFunction != null ? onTapFunction!() : () {},
                // key: key,
                onChanged: (value) {
                  if (onChangedFunction != null) {
                    onChangedFunction!();
                  }
                },
                validator: (value) {
                  return validationFunction != null ? validationFunction!(value) : null;
                },
                // onSaved: onSavedFunction != null ? onSavedFunction : (value) {},
                onSaved: (value) {
                  return onSavedFunction != null ? onSavedFunction!(value) : null;
                },
                onFieldSubmitted: (value) {
                  return onFieldSubmit != null ? onFieldSubmit!(value) : null;
                },
                maxLines: maxLine ?? 1,
                keyboardType: keyboardType,
                controller: textEditingController,
                selectionControls: MaterialTextSelectionControls(),
                // cursorColor: AppThemeController.it.isDarkMode.value ? Colors.white :Colors.black,
                // initialValue: initialText,
                obscureText: passwordVisible,
                style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal, fontFamily: 'Montserrat', color: Colors.black),
                inputFormatters: inputFormatter,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  errorMaxLines: errorMaxLines ?? 1,
                  filled: true,
                  contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                  focusedBorder: underlineInputBorder ?? textFieldBorderStyle,
                  disabledBorder: underlineInputBorder ?? textFieldBorderStyle,
                  enabledBorder: underlineInputBorder ?? textFieldBorderStyle,
                  errorBorder: underlineInputBorder ?? textFieldBorderStyle,
                  focusedErrorBorder: underlineInputBorder ?? textFieldBorderStyle,
                  hintText: hintText,
                  hintStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.grey.shade400),
                  prefixIcon: preFixIcon,
                  suffixIcon: isPassword != null && isPassword!
                      ? InkWell(
                          onTap: () {
                            newSetState(() {
                              // isPassword = !isPassword!;
                              passwordVisible = !passwordVisible;
                            });
                          },
                          child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 10,
                              child: passwordVisible
                                  ? const Icon(
                                      Icons.remove_red_eye_outlined,
                                      color: Colors.grey,
                                    )
                                  : const Icon(
                                      Icons.remove_red_eye,
                                      color: Colors.grey,
                                    )))
                      : suffixIcon,
                ),
              );
              // });
            }),
          ),
        )
      ],
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:igli_financial/utilities/text_style.dart';

import 'colors.dart';

OutlineInputBorder textFieldBorderStyle = OutlineInputBorder(
  borderSide: BorderSide(color: textColorPrimary.withOpacity(0.2)),
  borderRadius: BorderRadius.circular(7),
);
OutlineInputBorder focusFieldBorderStyle = OutlineInputBorder(
  borderSide: BorderSide(color: colorPrimary.withOpacity(0.5)),
  borderRadius: BorderRadius.circular(7),
);

Widget commonTextFormField(
    {String? fieldTitleText,
    TextStyle? textStyle,
    TextStyle? prefixStyle,
    double? borderRadius,
    String? prefixText,
    String? counterText,
    String? hintText,
    bool? isErrorShow = false,
    InputBorder? focusedBorder,
    InputBorder? disabledBorder,
    InputBorder? enabledBorder,
    InputBorder? errorBorder,
    InputBorder? focusedErrorBorder,
    bool isPassword = false,
    TextEditingController? textEditingController,
    Function? validationFunction,
    Function? onSavedFunction,
    Function? onFieldSubmit,
    TextInputType? keyboardType,
    Function? onEditingComplete,
    Function? onTapFunction,
    Function? onChangedFunction,
    TextAlign align = TextAlign.start,
    TextInputAction? inputAction,
    List<TextInputFormatter>? inputFormatter,
    bool? isEnabled,
    int? errorMaxLines,
    TextStyle? errorTextStyle,
    int? maxLine,
    Iterable<String>? autofillHints,
    FocusNode? textFocusNode,
    GlobalKey<FormFieldState>? key,
    bool isReadOnly = false,
    Widget? suffixIcon,
    Widget? suffix,
    Widget? preFixIcon,
    Color? filledColor,
    RxBool? showPassword,
    EdgeInsets? contentPadding,
    ScrollController? scrollController,
    TextStyle? hintStyle,
    String? errorText,
    int? maxLength,
    int? minLines,
    bool isExpands = false,
    bool? isDense,
    bool? autofocus,
    Color? cursorColor,
    String headText = "",
    bool isHeadIcon = true,
    double? textFieldHeight,
    bool isTextFieldHeight = true,
    double? textFieldWidth}) {
  bool passwordVisible = isPassword;

  return StatefulBuilder(builder: (context, newSetState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headText == ""
            ? const SizedBox()
            : Text(isHeadIcon ? '$headText*' : headText, style: themeData.textTheme.subtitle1?.copyWith(fontWeight: FontWeight.w500, color: colors000000)).paddingOnly(bottom: 10, top: 0),
        SizedBox(
          height: isTextFieldHeight ? textFieldHeight ?? 35 : null,
          width: textFieldWidth,
          child: StatefulBuilder(builder: (context, snapshot) {
            return TextFormField(
              readOnly: isReadOnly,
              maxLength: maxLength,
              textAlign: align,
              minLines: minLines,
              // showCursor: !isReadOnly,

              onTap: () {
                if (onTapFunction != null) {
                  onTapFunction();
                }
              },
              key: key,
              focusNode: textFocusNode,
              onChanged: (value) {
                if (onChangedFunction != null) {
                  onChangedFunction(value);
                }
              },
              onEditingComplete: () {
                if (onEditingComplete != null) {
                  onEditingComplete();
                }
              },
              validator: (value) {
                return validationFunction != null ? validationFunction(value) : null;
              },
              // onSaved: onSavedFunction != null ? onSavedFunction : (value) {},
              onSaved: (value) {
                // ignore: void_checks
                return onSavedFunction != null ? onSavedFunction(value) : null;
              },
              onFieldSubmitted: (value) {
                // ignore: void_checks
                return onFieldSubmit != null ? onFieldSubmit(value) : null;
              },
              maxLines: maxLine ?? 1,
              keyboardType: keyboardType ?? TextInputType.text,
              controller: textEditingController,
              // initialValue: initialText,
              expands: isExpands ? true : false,

              autofillHints: autofillHints ?? [],
              // cursorColor: color174261,
              obscureText: passwordVisible,
              textInputAction: inputAction ?? TextInputAction.next,
              autofocus: autofocus ?? false,
              style: textStyle ?? themeData.textTheme.subtitle1?.copyWith(color: colors000000),
              inputFormatters: inputFormatter,
              cursorColor: colorPrimary,
              decoration: InputDecoration(
                errorStyle: errorTextStyle,
                // isCollapsed: true,
                errorText: errorText,
                hoverColor: Colors.transparent,
                prefixStyle: prefixStyle ?? themeData.textTheme.subtitle1?.copyWith(color: colors000000),
                prefixText: prefixText,
                errorMaxLines: errorMaxLines ?? 1,
                filled: true,
                fillColor: filledColor ?? colorFFFFFF,
                isDense: isDense ?? false,
                contentPadding: contentPadding ?? const EdgeInsets.only(left: 10),
                focusedBorder: focusedBorder ?? focusFieldBorderStyle,
                disabledBorder: disabledBorder ?? textFieldBorderStyle,
                enabledBorder: enabledBorder ?? textFieldBorderStyle,
                errorBorder: errorBorder ?? textFieldBorderStyle,
                focusedErrorBorder: focusedErrorBorder ?? textFieldBorderStyle,
                counterText: counterText ?? "",
                hintText: hintText ?? '',
                prefixIcon: preFixIcon,
                suffixIconColor: textColorPrimary,
                suffixIcon: isPassword
                    ? InkWell(
                        onTap: () {
                          newSetState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                        child: passwordVisible
                            ? Icon(
                                Icons.visibility_off,
                                color: textColorPrimary,
                              )
                            : Icon(
                                Icons.visibility,
                                color: textColorPrimary,
                              ),
                      )
                    : suffixIcon,

                hintStyle: hintStyle ?? themeData.textTheme.bodyText2?.copyWith(color: color666666, fontSize: 14),
              ),
            );
          }),
        ),
      ],
    );
  });
}
