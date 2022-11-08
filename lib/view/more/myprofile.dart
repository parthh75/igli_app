import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/main.dart';
import 'package:igli_financial/utilities/colors.dart';
import 'package:igli_financial/utilities/string.dart';
import 'package:igli_financial/utilities/text_style.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? gender;
  bool isButton = false;
  bool isAddAddressButton = false;
  bool isKYCButton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: colorFFFFFF,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                       Icon(Icons.account_circle, size: 25, color:color26569a),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(CS.personalDetails, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ).paddingOnly(top: 10),
                  const Center(child: Icon(Icons.account_circle, size: 100, color: Colors.grey)),
                  Center(
                      child: Text(
                    CS.dUserName,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ).paddingOnly(bottom: 2, top: 5)),
                  Center(
                      child: Text(
                    CS.dEmail,
                    style: const TextStyle(fontWeight: FontWeight.normal, color: Colors.grey),
                  )),
                  Text(CS.fullName).paddingOnly(top: 20),
                  TextFormField(onTap: () {
                    setState(() {
                      isButton = true;
                    });
                  }),
                  Text(CS.dob).paddingOnly(top: 20),
                  TextFormField(),
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
                            SizedBox(
                              width: 150,
                              height: 40,
                              child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  )),
                                  onPressed: () {
                                    setState(() {
                                      isButton = false;
                                    });
                                  },
                                  child: Text(CS.cancle)),
                            ),
                            SizedBox(
                              width: 150,
                              height: 40,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: color26569a,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      )),
                                  onPressed: () {},
                                  child:  Text(CS.save)),
                            ),
                          ],
                        ).paddingOnly(bottom: 20, top: 10)
                      : const SizedBox()
                ],
              ).paddingSymmetric(horizontal: 20).paddingOnly(top: 20),
            ).paddingOnly(top: 15),
            Container(
              color: colorFFFFFF,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on,color:color26569a ),
                      const SizedBox(width: 10),
                      Text(CS.myAddress,style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                    ],
                  ),
                  const Text("Address as mentioned in the address proof",style: TextStyle(fontSize: 12,color: Colors.grey,fontWeight: FontWeight.normal),).paddingOnly(left: 32,top: 2),
                  isAddAddressButton? const TextField(decoration: InputDecoration(labelText: "Address Line")).paddingOnly(top: 20):const SizedBox(),
                  isAddAddressButton?const TextField(decoration: InputDecoration(labelText: "Pincode")):const SizedBox(),
                  isAddAddressButton?const TextField(decoration: InputDecoration(labelText: "City/Town/Locality/village")):const SizedBox(),
                  isAddAddressButton?const TextField(decoration: InputDecoration(labelText: "State")):const SizedBox(),
                  isAddAddressButton?const SizedBox():Center(
                    child: SizedBox(
                      width: 200,
                      height: 40,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                        onPressed: () {
                          setState(() {
                            isAddAddressButton = true;
                          });
                        },
                        child: const Text("+ Add Address",style: TextStyle(fontWeight: FontWeight.w600),),),
                    ).paddingOnly(bottom: 15,top: 30),
                  ),
                  isAddAddressButton
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 40,
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                )),
                            onPressed: () {
                              setState(() {
                                isAddAddressButton = false;
                              });
                            },
                            child: Text(CS.cancle)),
                      ),
                      SizedBox(
                        width: 150,
                        height: 40,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: color26569a,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                )),
                            onPressed: () {},
                            child:  Text(CS.save)),
                      ),
                    ],
                  ).paddingOnly(bottom: 20, top: 30)
                      : const SizedBox()
                ],
              ).paddingSymmetric(horizontal: 20).paddingOnly(top: 20),
            ).paddingOnly(bottom: 15,top: 15),
            Container(
              color: colorFFFFFF,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.email,color:color26569a ),
                      const SizedBox(width: 10),
                      Text(CS.emailAddress,style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                    ],
                  ),
                  const Text("Add Email Address",style: TextStyle(fontSize: 12,color: Colors.grey,fontWeight: FontWeight.normal),).paddingOnly(left: 32,top: 2),
                Container(
                  height: 50,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 15,bottom: 15),
                padding: const EdgeInsets.only(top: 15,left: 10),
                color: color26569a.withOpacity(0.1),
                  child: Text(CS.dEmail),
                ),
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 40,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              )),
                          onPressed: () {
                            setState(() {
                              isButton = false;
                            });
                          },
                          child: Text("+ ${CS.addEmail}",style: const TextStyle(fontWeight: FontWeight.w600),),),
                    ).paddingOnly(bottom: 15,top: 10),
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
                      Icon(Icons.phone,color:color26569a ),
                      const SizedBox(width: 10),
                      Text(CS.addNumber,style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                    ],
                  ),
                  const Text("Add or Remove Phone Number",style: TextStyle(fontSize: 12,color: Colors.grey,fontWeight: FontWeight.normal),).paddingOnly(left: 32,top: 2),

                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 40,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                        onPressed: () {
                          setState(() {
                            isButton = false;
                          });
                        },
                        child: Text("+  ${CS.addNumber}",style: const TextStyle(fontWeight: FontWeight.w600),),),
                    ).paddingOnly(bottom: 15,top: 40),
                  ),
                ],
              ).paddingSymmetric(horizontal: 20).paddingOnly(top: 20),
            ).paddingOnly(top: 15,bottom: 15),
            Container(
              color: colorFFFFFF,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.business,color:color26569a ),
                      const SizedBox(width: 10),
                      Text(CS.myBusiness,style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                    ],
                  ),
                  const Text("See business that you are part of",style: TextStyle(fontSize: 12,color: Colors.grey,fontWeight: FontWeight.normal),).paddingOnly(left: 32,top: 2),

                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 40,
                      child: ElevatedButton(
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                        onPressed: () {

                        },
                        child: Text(CS.view,style: const TextStyle(fontWeight: FontWeight.w600),),),
                    ).paddingOnly(bottom: 15,top: 30),
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
                      Icon(Icons.credit_card,color:color26569a ),
                      const SizedBox(width: 10),
                      Text(CS.kyc,style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                    ],
                  ),
                  const Text("Identification number as mention in the ID proof",style: TextStyle(fontSize: 12,color: Colors.grey,fontWeight: FontWeight.normal),).paddingOnly(left: 32,top: 2),
                  isKYCButton? const TextField(decoration: InputDecoration(labelText: "Aadhar No.",labelStyle: TextStyle(fontSize: 15),),).paddingOnly(top: 20):const SizedBox(),
                  isKYCButton? const TextField(decoration: InputDecoration(labelText: "Aadhar No.",labelStyle: TextStyle(fontSize: 15),),).paddingOnly(top: 20):const SizedBox(),
                  isKYCButton?const TextField(decoration: InputDecoration(labelText: "PAN No.",labelStyle: TextStyle(fontSize: 15),),):const SizedBox(),

                  isKYCButton?const SizedBox():Center(
                    child: SizedBox(
                      width: 200,
                      height: 40,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                        onPressed: () {
                          setState(() {
                            isKYCButton = true;
                          });
                        },
                        child: const Text("+ Add KYC",style: TextStyle(fontWeight: FontWeight.w600),),),
                    ).paddingOnly(bottom: 15,top: 30),
                  ),
                  isKYCButton
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 40,
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                )),
                            onPressed: () {
                              setState(() {
                                isAddAddressButton = false;
                              });
                            },
                            child: Text(CS.cancle)),
                      ),
                      SizedBox(
                        width: 150,
                        height: 40,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: color26569a,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                )),
                            onPressed: () {},
                            child:  Text(CS.save)),
                      ),
                    ],
                  ).paddingOnly(bottom: 20, top: 30)
                      : const SizedBox()
                ],
              ).paddingSymmetric(horizontal: 20).paddingOnly(top: 20),
            ).paddingOnly(bottom: 15,top: 15),
            Container(
              color: colorFFFFFF,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.key,color:color26569a ),
                      const SizedBox(width: 10),
                      Text(CS.password,style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                    ],
                  ),
                  const Text("See business that you are part of",style: TextStyle(fontSize: 12,color: Colors.grey,fontWeight: FontWeight.normal),).paddingOnly(left: 32,top: 2),
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 40,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                        onPressed: () {
                          setState(() {
                            isButton = false;
                          });
                        },
                        child: Text(CS.cPassword,style: const TextStyle(fontWeight: FontWeight.w600),),),
                    ).paddingOnly(bottom: 15,top: 30),
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
