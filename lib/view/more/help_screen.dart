import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/common_widgets/common.dart';
import 'package:igli_financial/utilities/colors.dart';

import '../../utilities/text_style.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("FAQ123"),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_outlined)),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            commonListTile(
                title: "My Services",
                minLeadingWidth: 0,
                onTap: () {
                  Get.to(const HelpMyServices());
                }),
            commonListTile(
                title: "Compliance Calender",
                minLeadingWidth: 0,
                onTap: () {
                  Get.to(const HelpComplianceCalenderScreen());
                }),
            commonListTile(
                title: "Massages",
                minLeadingWidth: 0,
                onTap: () {
                  Get.to(const HelpMessages());
                }),
            commonListTile(
                title: "Payment",
                minLeadingWidth: 0,
                onTap: () {
                  Get.to(const HelpPayment());
                }),
            commonListTile(
                title: "User and Roles",
                minLeadingWidth: 0,
                onTap: () {
                  Get.to(const HelpUsersAndRoles());
                }),
            commonListTile(
                title: "Account Setting",
                minLeadingWidth: 0,
                onTap: () {
                  Get.to(const HelpAccountSetting());
                }),
            commonListTile(
                title: "Feedback and Concerns",
                minLeadingWidth: 0,
                onTap: () {
                  Get.to(const HelpFeedBack());
                }),
          ],
        ).paddingSymmetric(horizontal: 15));
  }
}

class HelpMyServices extends StatefulWidget {
  const HelpMyServices({Key? key}) : super(key: key);

  @override
  State<HelpMyServices> createState() => _HelpMyServicesState();
}

class _HelpMyServicesState extends State<HelpMyServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Services"),
      ),
      body: Column(
        children: [
          commonExpansionTile(title: "What are My Services?", children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonText(title: "My Services-your most used feature!"),
                commonText(
                    title:
                        "- Ongoing Services are those Under Progress.These Either need Action from Your End,From Our end or is Pending with the Official for Process."),
                commonText(
                    title:
                        "- Completed Services Shows the Services that have been Successfully Completed."),
                commonText(
                    title:
                        "- Closed Services Shows the Duplicate,Inactive and Closed Services."),
                commonText(
                    title:
                        "- Renewal Services are recurring and Continuous process.You can Continue to avail these Services bt Renewing before Expiry."),
              ],
            ).paddingSymmetric(horizontal: 20),
          ]),
          commonExpansionTile(
              title: "What is The Most Preferred Way to Buy a Service?",
              children: [
                const Text(
                    "The Most Preferred way to Buy a Service is Via the Dashboard.Choose the Service you want and Chechout.Get Started with the process Immediately "
                    "after the Purchse.Zero Wait Time and Zero Calls!"),
              ]),
          commonExpansionTile(
              title: "What are The Other Way to Register For a Service?",
              children: [
                const Text("- Website (iglifinancial.com)"),
                const Text("- IGLI Financial Representative"),
                const Text(
                    "- Mobile Application (Available on Android and ios)")
              ]),
          commonExpansionTile(title: "What are My Interests?", children: [
            const Text(
                'Interested Services- Wishlist or know more before you buy!'),
            const Text(
                "You can create a List of Services that you are Interested in or might want in the Future by Clicking on I'm Interested.This helps you keep track of what you need to buy next and you "
                "can also get in touch with us to know more before you checkout.")
          ]),
          commonExpansionTile(
              title: "Where do I Find the status of my services?",
              children: [
                const Text(
                    "Check My Services to Find the Current and Next Milestone for your Service.If you need more Information, get in touch with recent point of contact of the Service.")
              ]),
          commonExpansionTile(
              title: "How do I track combo services?",
              children: [
                const Text(
                    "All the Services of the Combo Pack will be Displayed under My Services as Individual service.You can treak the status the same way you would do for an Individual Services.")
              ]),
        ],
      ),
    );
  }
}

commonText({top, bottom, title}) {
  return Text(title, style: const TextStyle(color: Colors.black54)).paddingOnly(
    top: top ?? 10,
    bottom: bottom ?? 10,
  );
}

class HelpComplianceCalenderScreen extends StatefulWidget {
  const HelpComplianceCalenderScreen({Key? key}) : super(key: key);

  @override
  State<HelpComplianceCalenderScreen> createState() =>
      _HelpComplianceCalenderScreenState();
}

class _HelpComplianceCalenderScreenState
    extends State<HelpComplianceCalenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Compliance Calender"),
      ),
      body: Column(
        children: [
          commonExpansionTile(
            title: "What are The Compliances Included?",
          ),
          commonExpansionTile(
            title:
                "I don't see Few Compliances Deadlines, is it not applicable for me?",
          ),
          commonExpansionTile(
            title:
                "I see few Compliances that I have not Avalied in the Past .What should I do now?",
          ),
          commonExpansionTile(
            title: "Can I Get a Customised calender for my  Business?",
          ),
          commonExpansionTile(
            title: "The Information here is Different from The Web?",
          ),
        ],
      ),
    );
  }
}

class HelpMessages extends StatefulWidget {
  const HelpMessages({Key? key}) : super(key: key);

  @override
  State<HelpMessages> createState() => _HelpMessagesState();
}

class _HelpMessagesState extends State<HelpMessages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Messages"),
      ),
      body: Column(
        children: [
          commonExpansionTile(
            title: "What do I find ion Messages?",
          ),
          commonExpansionTile(
            title: "Can I Chat Live?",
          ),
        ],
      ),
    );
  }
}

class HelpPayment extends StatefulWidget {
  const HelpPayment({Key? key}) : super(key: key);

  @override
  State<HelpPayment> createState() => _HelpPaymentState();
}

class _HelpPaymentState extends State<HelpPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
      ),
      body: Column(
        children: [
          commonExpansionTile(
            title: "What are The Payment Modes?",
          ),
          commonExpansionTile(
            title: "Where can I Get/ Modify a GST Invoice?",
          ),
          commonExpansionTile(
            title:
                "What should I do When the Dashbord Still Shows a payment as pending even after Payment?",
          ),
          commonExpansionTile(
            title: "Where Can I Apply For a Refund?",
          ),
          commonExpansionTile(
            title: "What happens After Purchasing a New Services?",
          ),
        ],
      ),
    );
  }
}

class HelpFeedBack extends StatefulWidget {
  const HelpFeedBack({Key? key}) : super(key: key);

  @override
  State<HelpFeedBack> createState() => _HelpFeedBackState();
}

class _HelpFeedBackState extends State<HelpFeedBack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FeedBack & Concerns"),
      ),
      body: Column(
        children: [
          commonExpansionTile(
            title: "Where do I share my concerns?",
          ),
          commonExpansionTile(
            title: "Where do I share my Feedback?",
          ),
          commonExpansionTile(
            title: "Where do I share my Doubts and Queries?",
          ),
        ],
      ),
    );
  }
}

class HelpUsersAndRoles extends StatefulWidget {
  const HelpUsersAndRoles({Key? key}) : super(key: key);

  @override
  State<HelpUsersAndRoles> createState() => _HelpUsersAndRolesState();
}

class _HelpUsersAndRolesState extends State<HelpUsersAndRoles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users And Roles"),
      ),
      body: Column(
        children: [
          commonExpansionTile(
            title: "Who can be Invited To Join Your Business Account?",
          ),
          commonExpansionTile(
            title:
                "The User I Wish To Invite is not Part Of IGLI Financial Search, will I be Able to Invite?",
          ),
          commonExpansionTile(
            title:
                "Will User in a Business Account be Able to View My Personal Account?",
          ),
          commonExpansionTile(
            title:
                "Will Users in a Business Be Able to View My Other Business Account?",
          ),
          commonExpansionTile(
            title: "Will The User be Notified if I Remove Them?",
          ),
        ],
      ),
    );
  }
}

class HelpAccountSetting extends StatefulWidget {
  const HelpAccountSetting({Key? key}) : super(key: key);

  @override
  State<HelpAccountSetting> createState() => _HelpAccountSettingState();
}

class _HelpAccountSettingState extends State<HelpAccountSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account Setting"),
      ),
      body: Column(
        children: [
          commonExpansionTile(
            title: "Can I Changes My Primary Email And Phone Number?",
          ),
          commonExpansionTile(
            title:
                "I Run Multiple Businesses,can I Manage Them All From The Same Account?",
          ),
          commonExpansionTile(
            title: "Can I Add or Modify My Profile Details",
          ),
          commonExpansionTile(
            title: "Why is My New Business Autonamed?",
          ),
          commonExpansionTile(
            title:
                "Will Users in a Business Account be Able to View My Personal Account?",
          ),
          commonExpansionTile(
            title:
                "Will Users in a Business be Able to View My Other Business Accounts?",
          ),
        ],
      ),
    );
  }
}
