import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/more/contactus_screen.dart';
import 'package:igli_financial/more/myprofile.dart';
import 'package:igli_financial/utilities/string.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          ListTile(
            title: const Text("My Profile"),
            trailing: const Icon(Icons.navigate_next),

            leading: const Icon(Icons.account_circle_rounded,color: Colors.blue,size: 22),
            horizontalTitleGap: -5,
            tileColor: Colors.white,
            onTap: (){

                Get.to(const ProfileScreen());

            },
          ),

          Text(CS.ourServices,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
              .paddingOnly(top:15,bottom: 15,left: 20),
          commonListTile(title: "Services", leadingIcon:Icons.paste ),
          commonListTile(title: "Partners",leadingIcon: Icons.person_outline ),
          commonListTile(title: "My Interests", leadingIcon:Icons.currency_rupee ),


          Text(CS.support,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
              .paddingOnly(top: 15,bottom: 15,left: 20),

          commonListTile(title: "Help",leadingIcon: Icons.help_outline),
          commonListTile(title: "Contact us", leadingIcon:Icons.mail_outline,
              onTap: (){
                Get.to(const ContactUs());

              }),
          commonListTile(title: "Read Articles", leadingIcon:Icons.file_copy_outlined ),
          commonListTile(title: "Legal & Terms",leadingIcon: Icons.filter_1_rounded ),

          const SizedBox(height: 50,),
          ListTile(
            title: const Text("Sign Out"),
            leading: const Icon(Icons.output,color: Colors.red,size: 20),
            horizontalTitleGap: -5,
            tileColor: Colors.white,
            onTap: (){},
          )

        ],
      ),
    );
  }
}
commonListTile({title,leadingIcon,onTap})
{
  return  ListTile(
    title: Text(title),
    trailing: const Icon(Icons.navigate_next),
    leading: Icon(leadingIcon,color: Colors.blue,size: 20),
    horizontalTitleGap: -5,
    tileColor: Colors.white,
    onTap: onTap,
  ).paddingOnly(bottom: 6);
}