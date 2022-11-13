import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/common_widgets/common.dart';

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
          title: const Text("FAQ"),

        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            commonListTile(
                title: "My Services",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const HelpMyServices();
                    },
                  ));
                }),
            commonListTile(
                title: "Compliance Calender",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const HelpComplianceCalenderScreen();
                    },
                  ));
                }),
            commonListTile(
                title: "Massages",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const HelpMessages();
                    },
                  ));
                }),
            commonListTile(
                title: "Payment",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const HelpPayment();
                    },
                  ));
                }),
            commonListTile(title: "User and Roles"),
            commonListTile(title: "Account Setting"),
            commonListTile(
                title: "Feedback and Concerns",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const HelpFeedBack();
                    },
                  ));
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
            Text("hello this is testing."),
            Text("hello this is testing."),
            Text("hello this is testing."),
            Text("hello this is testing."),
          ]),
          commonExpansionTile(
            title: "What is The Most Preferred Way to Buy a Service?",
          ),
          commonExpansionTile(
            title: "What are The Other Way to Register For a Service?",
          ),
          commonExpansionTile(
            title: "What are My Interests?",
          ),
          commonExpansionTile(
            title: "Where do I Find the status of my services?",
          ),
          commonExpansionTile(
            title: "How do I track combo services?",
          ),
        ],
      ),
    );
  }
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
        title: Text("Compliance Calender"),
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
        title: Text("Messages"),
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
        title: Text("Payment"),
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
        title: Text("FeedBack & Concerns"),
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
