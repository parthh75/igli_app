import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:igli_financial/utilities/colors.dart';
import 'package:igli_financial/utilities/string.dart';
import 'package:intl/intl.dart';
import '../../utilities/text_style.dart';
import '../utilities/text_style.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController cityNameController = TextEditingController();
  TextEditingController stateNameController = TextEditingController();
  TextEditingController addEmailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController adharNumberController = TextEditingController();
  TextEditingController panNumberController = TextEditingController();
  TextEditingController enterEmailIdController = TextEditingController();
  String? gender;
  bool isButton = false;
  bool isAddAddressButton = false;
  bool isKYCButton = false;
  bool isAddEmailAddressButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
        title: Text(CS.myProfile),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: colorFFFFFF,
              margin: const EdgeInsets.only(top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.account_circle, size: 25, color: color26569a),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(CS.personalDetails,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const Center(
                      child: Icon(Icons.account_circle,
                          size: 100, color: Colors.grey)),
                  Center(
                      child: Text(
                    CS.dUserName,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ).paddingOnly(bottom: 2, top: 5)),
                  Center(
                      child: Text(
                    CS.dEmail,
                    style: const TextStyle(
                        fontWeight: FontWeight.normal, color: Colors.grey),
                  )),
                  commonTextField(
                    labelText: CS.fullName,
                    controller: nameController,
                    onTap: () {
                      setState(() {
                        isButton = true;
                      });
                    },
                  ),
                  commonTextField(
                    labelText: CS.dob,
                    controller: dobController,
                    suffixIcon: Icon(Icons.date_range, color: colorPrimary),
                    onTap: () {
                      setState(
                        () async {
                          isButton = true;
                          await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime.now(),
                          ).then((value) => {
                                dobController.text =
                                    DateFormat.yMd().format(value!).toString(),
                              });
                        },
                      );
                    },
                  ).paddingOnly(top: isButton ? 10 : 0),
                  Text(
                    CS.gender,
                  ).paddingOnly(top: 20),
                  RadioListTile(
                    value: "male",
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value.toString();
                        isButton = true;
                      });
                    },
                    title: Text(CS.male),
                  ),
                  RadioListTile(
                    value: "female",
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value.toString();
                        isButton = true;
                      });
                    },
                    title: Text(CS.female),
                  ),
                  RadioListTile(
                    value: "other",
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value.toString();
                        isButton = true;
                      });
                    },
                    title: Text(CS.other),
                  ),
                  isButton
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              child: commonOutlineButton(
                                  horizontalPadding: 30,
                                  buttonText: CS.cancle,
                                  onTap: () {
                                    setState(() {
                                      isButton = false;
                                    });
                                  }),
                            ),
                            Flexible(
                              child: commonElevatedButton(
                                horizontalPadding: 40,
                                title: CS.save,
                                onTap: () {},
                              ),
                            ),
                          ],
                        ).paddingOnly(bottom: 20, top: 10)
                      : const SizedBox()
                ],
              ).paddingSymmetric(horizontal: 20).paddingOnly(top: 20),
            ),
            Container(
              color: colorFFFFFF,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on, color: color26569a),
                      const SizedBox(width: 10),
                      Text(
                        CS.myAddress,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  const Text(
                    "Address as mentioned in the address proof",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal),
                  ).paddingOnly(left: 32, top: 2),
                  isAddAddressButton
                      ? commonTextField(
                          onTap: () {},
                          controller: addressController,
                          labelText: "Address Line",
                        )
                      : const SizedBox(),
                  isAddAddressButton
                      ? commonTextField(
                          onTap: () {},
                          controller: pinCodeController,
                          labelText: "Pincode",
                        )
                      : const SizedBox(),
                  isAddAddressButton
                      ? commonTextField(
                          onTap: () {},
                          controller: cityNameController,
                          labelText: "City/Town/Locality/village",
                        )
                      : const SizedBox(),
                  isAddAddressButton
                      ? commonTextField(
                          onTap: () {},
                          controller: stateNameController,
                          labelText: "State",
                        )
                      : const SizedBox(),
                  isAddAddressButton
                      ? const SizedBox()
                      : Center(
                          child: commonOutlineButton(
                            horizontalPadding: 120,
                            isIcon: true,
                            buttonText: "Add Address",
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.w600),
                            bottomPadding: 15,
                            topPadding: 30,
                            onTap: () {
                              setState(() {
                                isAddAddressButton = true;
                              });
                            },
                          ),
                        ),
                  isAddAddressButton
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              child: commonOutlineButton(
                                horizontalPadding: 30,
                                buttonText: CS.cancle,
                                onTap: () {
                                  setState(() {
                                    isAddAddressButton = false;
                                  });
                                },
                              ),
                            ),
                            Flexible(
                              child: commonElevatedButton(
                                horizontalPadding: 40,
                                title: CS.save,
                                onTap: () {},
                              ),
                            ),
                          ],
                        ).paddingOnly(bottom: 20, top: 30)
                      : const SizedBox()
                ],
              ).paddingSymmetric(horizontal: 20).paddingOnly(top: 20),
            ).paddingOnly(bottom: 15, top: 15),
            Container(
              color: colorFFFFFF,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.email, color: color26569a),
                      const SizedBox(width: 10),
                      Text(
                        CS.emailAddress,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  Text(
                    "${CS.add} ${CS.emailAddress}",
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal),
                  ).paddingOnly(left: 32, top: 2),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                        top: 15, bottom: isAddEmailAddressButton ? 0 : 20),
                    padding: const EdgeInsets.only(top: 15, left: 10),
                    color: color26569a.withOpacity(0.1),
                    child: Text(CS.dEmail),
                  ),
                  Center(
                    child: commonOutlineButton(
                        horizontalPadding: 120,
                        topPadding: 10,
                        bottomPadding: 15,
                        isIcon: true,
                        buttonText: CS.addEmail,
                        textStyle: const TextStyle(fontWeight: FontWeight.w600),
                        onTap: () {
                          setState(() {
                            isAddEmailAddressButton = true;
                            showModalBottomSheet(
                              context: context,
                              constraints: const BoxConstraints(maxHeight: 400),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20))),
                              builder: (context) {
                                return Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: IconButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          icon: const Icon(Icons.close)),
                                    ),
                                    Container(
                                        width: 70,
                                        height: 70,
                                        margin:
                                            const EdgeInsets.only(bottom: 20),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(35),
                                            color:
                                                color26569a.withOpacity(0.1)),
                                        child: Icon(
                                          Icons.attach_email,
                                          size: 30,
                                          color: color26569a,
                                        )),
                                    Text(
                                      CS.emailId,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    commonTextField(
                                      controller: enterEmailIdController,
                                      keyboardType: TextInputType.emailAddress,
                                      labelText: "${CS.enter} ${CS.emailId}",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      topPadding: 30,
                                      bottomPadding: 80,
                                    ),
                                    commonElevatedButton(
                                        height: 50,
                                        title: "${CS.send} ${CS.otp}",
                                        buttonColor: colorBec3c8,
                                        onTap: () {
                                          Get.back();
                                          showModalBottomSheet(
                                            context: context,
                                            constraints: const BoxConstraints(
                                                maxHeight: 450),
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(20),
                                                    topLeft:
                                                        Radius.circular(20))),
                                            builder: (context) {
                                              return Column(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: IconButton(
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        icon: const Icon(
                                                            Icons.close)),
                                                  ),
                                                  Container(
                                                      width: 70,
                                                      height: 70,
                                                      margin:
                                                          const EdgeInsets.only(
                                                              bottom: 20),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(35),
                                                          color: color26569a
                                                              .withOpacity(
                                                                  0.1)),
                                                      child: Icon(
                                                        Icons.attach_email,
                                                        size: 30,
                                                        color: color26569a,
                                                      )),
                                                  Text(
                                                    'Verify ${CS.emailId}',
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const Text(
                                                    'Enter The OTP Sent to',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ).paddingOnly(
                                                      top: 10, bottom: 5),
                                                  Text(
                                                    enterEmailIdController.text,
                                                    style: TextStyle(
                                                      color: colorPrimary,
                                                    ),
                                                  ),
                                                  OtpTextField(
                                                    fieldWidth: 50,
                                                    numberOfFields: 5,
                                                    enabledBorderColor:
                                                        colorPrimary,
                                                    focusedBorderColor:
                                                        Colors.grey,

                                                    showFieldAsBox: true,

                                                    onCodeChanged:
                                                        (String code) {},

                                                    onSubmit: (String
                                                        verificationCode) {
                                                      showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return AlertDialog(
                                                              title: const Text(
                                                                  "Verification Code"),
                                                              content: Text(
                                                                  'Code entered is $verificationCode'),
                                                            );
                                                          });
                                                    }, // end onSubmit
                                                  ).paddingOnly(
                                                      top: 20, bottom: 10),
                                                  Center(
                                                      child: InkWell(
                                                    onTap: () {},
                                                    child: Text(
                                                      "Resend OTP",
                                                      style: TextStyle(
                                                          color: colorPrimary,
                                                          fontSize: 10),
                                                    ),
                                                  )).paddingOnly(bottom: 40),
                                                  commonElevatedButton(
                                                      height: 50,
                                                      title: CS.verify,
                                                      buttonColor: colorBec3c8,
                                                      onTap: () {}),
                                                ],
                                              ).paddingSymmetric(
                                                  horizontal: 20);
                                            },
                                          );
                                        }),
                                  ],
                                ).paddingSymmetric(horizontal: 20);
                              },
                            );
                          });
                        }),
                  ),
                ],
              ).paddingSymmetric(horizontal: 20).paddingOnly(top: 20),
            ),
            Container(
              color: colorFFFFFF,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.phone, color: color26569a),
                      const SizedBox(width: 10),
                      Text(
                        CS.addNumber,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  const Text(
                    "Add or Remove Phone Number",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal),
                  ).paddingOnly(
                    left: 32,
                    top: 2,
                  ),
                  Center(
                    child: commonOutlineButton(
                      horizontalPadding: 120,
                      isIcon: true,
                      onTap: () {
                        setState(() {
                          isButton = false;
                          showModalBottomSheet(
                            context: context,
                            constraints: const BoxConstraints(maxHeight: 400),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20))),
                            builder: (context) {
                              return Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        icon: const Icon(Icons.close)),
                                  ),
                                  Container(
                                      width: 70,
                                      height: 70,
                                      margin: const EdgeInsets.only(bottom: 20),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          color: color26569a.withOpacity(0.1)),
                                      child: Icon(
                                        Icons.phone_iphone,
                                        color: color26569a,
                                        size: 40,
                                      )),
                                  Text(
                                    CS.mobileNumber,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  commonTextField(
                                    controller: phoneController,
                                    keyboardType: TextInputType.phone,
                                    labelText: "${CS.enter} ${CS.mobileNumber}",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    topPadding: 20,
                                    bottomPadding: 80,
                                  ),
                                  commonElevatedButton(
                                      height: 50,
                                      title: "${CS.send} ${CS.otp}",
                                      buttonColor: colorBec3c8,
                                      onTap: () {
                                        Get.back();
                                        showModalBottomSheet(
                                          context: context,
                                          constraints: const BoxConstraints(
                                              maxHeight: 400),
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  topLeft:
                                                      Radius.circular(20))),
                                          builder: (context) {
                                            return Column(
                                              children: [
                                                Align(
                                                  alignment: Alignment.topRight,
                                                  child: IconButton(
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      icon: const Icon(
                                                          Icons.close)),
                                                ),
                                                Container(
                                                    width: 70,
                                                    height: 70,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            bottom: 20),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(35),
                                                        color: color26569a
                                                            .withOpacity(0.1)),
                                                    child: Icon(
                                                      Icons.phone_iphone,
                                                      color: color26569a,
                                                      size: 40,
                                                    )),
                                                const Text(
                                                  'Verify Mobile Number',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const Text(
                                                  'Enter The OTP Sent to',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ).paddingOnly(top: 10),
                                                Text(
                                                  phoneController.text,
                                                  strutStyle: const StrutStyle(
                                                      fontSize: 12),
                                                  style: TextStyle(
                                                      color: colorPrimary),
                                                ),
                                                OtpTextField(
                                                  fieldWidth: 50,
                                                  numberOfFields: 5,

                                                  enabledBorderColor:
                                                      colorPrimary,
                                                  focusedBorderColor:
                                                      Colors.grey,

                                                  showFieldAsBox: true,

                                                  onCodeChanged:
                                                      (String code) {},

                                                  onSubmit: (String
                                                      verificationCode) {}, // end onSubmit
                                                ).paddingOnly(
                                                    top: 20, bottom: 10),
                                                Center(
                                                    child: InkWell(
                                                  onTap: () {},
                                                  child: Text(
                                                    "Resend OTP",
                                                    style: TextStyle(
                                                        color: colorPrimary,
                                                        fontSize: 10),
                                                  ),
                                                )).paddingOnly(bottom: 40),
                                                commonElevatedButton(
                                                    height: 50,
                                                    title: CS.verify,
                                                    buttonColor: colorBec3c8,
                                                    onTap: () {}),
                                              ],
                                            ).paddingSymmetric(horizontal: 20);
                                          },
                                        );
                                      }),
                                ],
                              ).paddingSymmetric(horizontal: 20);
                            },
                          );
                        });
                      },
                      buttonText: CS.addNumber,
                      textStyle: const TextStyle(fontWeight: FontWeight.w600),
                      bottomPadding: 15,
                      topPadding: 40,
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 20).paddingOnly(top: 20),
            ).paddingOnly(top: 15, bottom: 15),
            Container(
              color: colorFFFFFF,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.business, color: color26569a),
                      const SizedBox(width: 10),
                      Text(
                        CS.myBusiness,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  const Text(
                    "See business that you are part of",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal),
                  ).paddingOnly(left: 32, top: 2),
                  Center(
                    child: commonOutlineButton(
                        width: 200,
                        height: 40,
                        buttonText: CS.view,
                        textStyle: const TextStyle(fontWeight: FontWeight.w600),
                        bottomPadding: 15,
                        topPadding: 30),
                  ),
                ],
              ).paddingSymmetric(horizontal: 20).paddingOnly(top: 20),
            ),
            Container(
              color: colorFFFFFF,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.credit_card, color: color26569a),
                      const SizedBox(width: 10),
                      Text(
                        CS.kyc,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  const Text(
                    "Identification number as mention in the ID proof",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal),
                  ).paddingOnly(left: 32, top: 2),
                  isKYCButton
                      ? commonTextField(
                          controller: adharNumberController,
                          labelText: "Aadhar No.",
                          topPadding: 20)
                      : const SizedBox(),
                  isKYCButton
                      ? commonTextField(
                          controller: panNumberController,
                          labelText: "PAN No.",
                          topPadding: 15)
                      : const SizedBox(),
                  Center(
                    child: isKYCButton
                        ? const SizedBox()
                        : commonOutlineButton(
                            onTap: () {
                              setState(() {
                                isKYCButton = true;
                              });
                            },
                            isIcon: true,
                            buttonText: "${CS.add} ${CS.kyc}",
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.w600),
                            bottomPadding: 15,
                            horizontalPadding: 120,
                            topPadding: 30),
                  ),
                  if (isKYCButton)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: commonOutlineButton(
                            horizontalPadding: 30,
                            buttonText: CS.cancle,
                            onTap: () {
                              setState(() {
                                isKYCButton = false;
                              });
                            },
                          ),
                        ),
                        Flexible(
                          child: commonElevatedButton(
                            horizontalPadding: 40,
                            title: CS.save,
                            onTap: () {},
                          ),
                        ),
                      ],
                    ).paddingOnly(bottom: 20, top: 30)
                  else
                    const SizedBox()
                ],
              ).paddingSymmetric(horizontal: 20).paddingOnly(top: 20),
            ).paddingOnly(bottom: 15, top: 15),
            Container(
              color: colorFFFFFF,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.key, color: color26569a),
                      const SizedBox(width: 10),
                      const Text(
                        CS.password,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  const Text(
                    "See business that you are part of",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal),
                  ).paddingOnly(left: 32, top: 2),
                  Center(
                    child: commonOutlineButton(
                      width: Get.width,
                      height: 40,
                      horizontalPadding: 120,
                      buttonText: CS.cPassword,
                      textStyle: const TextStyle(fontWeight: FontWeight.w600),
                      bottomPadding: 15,
                      onTap: () {
                        setState(() {
                          isButton = false;
                          showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            constraints: const BoxConstraints(maxHeight: 400),
                            builder: (context) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        icon: const Icon(Icons.close)),
                                  ),
                                  const Text(
                                    "Change Account Password",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ).paddingOnly(bottom: 5),
                                  const Text(
                                          "Password must be 6-20 characters long")
                                      .paddingOnly(bottom: 20),
                                  commonTextField(
                                      controller: oldPasswordController,
                                      labelText: CS.oldPassword),
                                  commonTextField(
                                    controller: newPasswordController,
                                    labelText: CS.newPassword,
                                  ),
                                  commonTextField(
                                    controller: confirmPasswordController,
                                    labelText: CS.confirmPassword,
                                  ),
                                  commonElevatedButton(
                                      onTap: () {},
                                      buttonColor: color26569a,
                                      title: "${CS.save} ${CS.changes}",
                                      height: 100,
                                      textTopPadding: 50,
                                      horizontalPadding: 50),
                                ],
                              ).paddingSymmetric(horizontal: 20);
                            },
                          );
                        });
                      },
                      topPadding: 30,
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 20).paddingOnly(top: 20),
            ),
          ],
        ),
      ),
    );
  }
}

Widget commonElevatedButton(
    {double? height,
    double? width,
    String? title,
    Color? buttonColor,
    double? textTopPadding,
    Function()? onTap,
    double? horizontalPadding,
    double? buttonTopPadding,
    double? buttonBottomPadding}) {
  return SizedBox(
    width: width ?? Get.width,
    height: height ?? 40,
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor ?? color26569a,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            )),
        onPressed: onTap ?? () {},
        child: Text(
          title ?? "",
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
        )).paddingOnly(top: textTopPadding ?? 0),
  ).paddingSymmetric(horizontal: horizontalPadding ?? 0).paddingOnly(
      top: buttonTopPadding ?? 0, bottom: buttonBottomPadding ?? 0);
}

Widget commonOutlineButton(
    {Function()? onTap,
    String? buttonText,
    double? width,
    double? height,
    TextStyle? textStyle,
    double? bottomPadding,
    double? topPadding,
    bool isIcon = false,
    double? horizontalPadding}) {
  return SizedBox(
    width: width ?? Get.width,
    height: height ?? 40,
    child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        )),
        onPressed: onTap ?? () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isIcon
                ? const Icon(
                    Icons.add,
                    size: 15,
                  )
                : const SizedBox(),
            Text(
              buttonText ?? "",
              style: textStyle,
            ),
          ],
        )),
  )
      .paddingOnly(left: 20, bottom: bottomPadding ?? 0, top: topPadding ?? 0)
      .paddingSymmetric(horizontal: horizontalPadding ?? 0);
}

Widget commonTextField(
    {String? labelText,
    TextEditingController? controller,
    Function()? onTap,
    double? topPadding,
    double? bottomPadding,
    TextInputType? keyboardType,
    String? hintText,
    Widget? suffixIcon,
    InputBorder? border}) {
  return SizedBox(
    // height: 38,
    child: TextFormField(
            decoration: InputDecoration(
                labelText: labelText,
                hintText: hintText,
                border: border,
                suffixIcon: suffixIcon,
                labelStyle: const TextStyle(fontSize: 15, height: 0.2)),
            controller: controller,
            keyboardType: keyboardType ?? TextInputType.text,
            onTap: onTap ?? () {})
        .paddingOnly(top: topPadding ?? 0, bottom: bottomPadding ?? 0),
  );
}
