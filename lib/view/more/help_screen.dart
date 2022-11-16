import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/common_widgets/common.dart';
import 'package:igli_financial/utilities/colors.dart';

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
      body: SingleChildScrollView(
        child: Column(
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
              )
            ]),
            commonExpansionTile(
                title: "What is The Most Preferred Way to Buy a Service?",
                children: [
                  commonText(
                      title:
                          "The Most Preferred way to Buy a Service is Via the Dashboard.Choose the Service you want and Chechout.Get Started with the process Immediately after the Purchse.Zero Wait Time and Zero Calls!")
                ]),
            commonExpansionTile(
                title: "What are The Other Way to Register For a Service?",
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commonText(title: "- Website (iglifinancial.com)"),
                      commonText(title: "- IGLI Financial Representative"),
                      commonText(
                          title:
                              "- Mobile Application (Available on Android and ios)"),
                    ],
                  ).paddingOnly(right: Get.width / 4.3)
                ]),
            commonExpansionTile(title: "What are My Interests?", children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonText(
                      title:
                          'Interested Services - Wishlist or know more before you buy!'),
                  commonText(
                      title:
                          "You can Create a List of Services that you are Interested in or might want in the Future by Clicking on I'm Interested.This helps you keep track of what you need to buy next and you "
                          "can also get in touch with us to know more before you checkout."),
                ],
              )
            ]),
            commonExpansionTile(
                title: "Where do I Find the status of my services?",
                children: [
                  commonText(
                      title:
                          "Check My Services to Find the Current and Next Milestone for your Service.If you need more Information, get in touch with recent point of contact of the Service.")
                ]),
            commonExpansionTile(
                title: "How do I track combo services?",
                children: [
                  commonText(
                      title:
                          "All the Services of the Combo Pack will be Displayed under My Services as Individual service.You can treak the status the same way you would do for an Individual Services.")
                ]),
          ],
        ),
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
        title: const Text("Compliance Calender"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            commonExpansionTile(
                title: "What are The Compliances Included?",
                children: [
                  commonText(
                      title:
                          "We have Listed Down All the General Compliance Applicable to Businesses.We Request You to use the Filters Provided to Narrow Down the Compliance Applicable for you.We update the Information Periodically,Thus Changes "
                          "Might Take Time to Reflect.We Recommend you to get in Touch with us to know more about a Compliance which is Crucial to your Business."),
                ]),
            commonExpansionTile(
                title:
                    "I don't see Few Compliances Deadlines, is it not applicable for me?",
                children: [
                  commonText(
                      title:
                          "This Version of Compliance Calender is a General Compliance Calender (Not Customised Based on Your Industry and Business).Thus,If you don't see some of the Compliance you Follow,Please write it to us at"
                          "Your Feedback will Help us to Improve our knowledge base."),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                        onPressed: () async {
                          String email = 'info@iglifinancial.com';

                          // if (await canLaunch(email)) {
                          //   await launch(email);
                          // } else {
                          //   throw "Error occured sending an email";
                          // }
                        },
                        child: Text(
                          "info@iglifinancial.com",
                          style: TextStyle(color: colorPrimary),
                        )).paddingOnly(left: 15),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: commonText(
                        title:
                            "Your Feedback will Help us to Improve our knowledge base."),
                  )
                ]),
            commonExpansionTile(
                title:
                    "I see few Compliances that I have not Avalied in the Past .What should I do now?",
                children: [
                  commonText(
                      title:
                          "We Recommend you to get in Touch With our Representatives to Understand if that Compliance is Applicable for you.At IGLI Financial ,we strive to make the Businesses 100% Compliant and risk-free.You shouldn't "
                          "worry about penalties,Late fee or failing due Diligence.")
                ]),
            commonExpansionTile(
                title: "Can I Get a Customised calender for my  Business?",
                children: [
                  commonText(
                      title:
                          "By purchasing one of our compliance plans,you will receive a customised compliance calender with lot of other benefits.")
                ]),
            commonExpansionTile(
                title: "The Information here is Different from The Web?",
                children: [
                  commonText(
                      title:
                          "If you find any discrepancy in the data displayed,Please write it to us at info@iglifinancial.com.Your feedback will help us to improve our knowledge base.")

                  ///CHANGES
                ]),
          ],
        ),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            commonExpansionTile(
                title: "What do I find ion Messages?",
                children: [
                  commonText(
                      title:
                          "Messages contain the email threads that you receive in your index.We have sorted it at the business and service level to improve accessibility and readability.")
                ]),
            commonExpansionTile(title: "Can I Chat Live?", children: [
              commonText(
                  title:
                      "Messages are similar to your email,our representatives will reply to your message.We don't support live chat yet on this dashbord.It's just around the corner,keep following this space.")
            ]),
          ],
        ),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            commonExpansionTile(
                title: "What are The Payment Modes?",
                children: [
                  commonText(
                      title:
                          "You can make a payment via any of our major options - Debit/Credit card,UPI,NetBanKing and EMI.Our payment gateway is secured and fast.")
                ]),
            commonExpansionTile(
                title: "Where can I Get/ Modify a GST Invoice?",
                children: [
                  commonText(
                      title:
                          "Drop your request at info@iglifinancial.com with Service ID and Invoice Number to receive a new GST Invoice."

                      ///changes
                      )
                ]),
            commonExpansionTile(
                title:
                    "What should I do When the Dashbord Still Shows a payment as pending even after Payment?",
                children: [
                  commonText(
                      title:
                          "The Update is Usually Real-Time,However,Allow us 1-2 Days to Check Payment Status.If the Issue Still Persists Contact Your Representative.")
                ]),
            commonExpansionTile(
                title: "Where Can I Apply For a Refund?",
                children: [
                  commonText(
                      title:
                          "For Refunds,Please Drop us an Email With Details and Allow us 2-3 Days to Start The Refund Process.For MOre In formation,Please Read OUr Refund Poliocy.")
                ]),
            commonExpansionTile(
                title: "What happens After Purchasing a New Services?",
                children: [
                  commonText(
                      title:
                          "Once The Payment is Completed,You Will Gain Access to the Service DashBord and you will Receive Communications in this Regard to Get Started.One of Our Representatives will Reach Out to Walk you "
                          "Through the Process")
                ]),
          ],
        ),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            commonExpansionTile(
                title: "Where do I share my concerns?",
                children: [
                  commonText(
                      title:
                          "We are really sorry that you are not happy.Please Drop in your concerns to billing@iglifinancial.com or call us at +91 9409494483.We will immediately look into it and improve your overall experience.")
                ]),
            commonExpansionTile(
                title: "Where do I share my Feedback?",
                children: [
                  commonText(
                      title:
                          "Post Your Feedback on the Contact Us Page.Your FeedBack Will Help us Improve the user Experience")
                ]),
            commonExpansionTile(
                title: "Where do I share my Doubts and Queries?",
                children: [
                  commonText(
                      title:
                          "You can Ask Doubts to The Assigned Representative for Your Service.In case of General Queries,Please Write to us at info@iglifinancial.com.We will get back to you in 2-3 business days.")
                ]),
          ],
        ),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            commonExpansionTile(
                title: "Who can be Invited To Join Your Business Account?",
                children: [
                  commonText(
                      title:
                          "You can Invite Anyone to be part of your business account.You can Add upto 10 users.")
                ]),
            commonExpansionTile(
                title:
                    "The User I Wish To Invite is not Part Of IGLI Financial Search, will I be Able to Invite?",
                children: [
                  commonText(
                      title:
                          'Yes, We only need their name and email address to send the invitation.')
                ]),
            commonExpansionTile(
                title:
                    "Will User in a Business Account be Able to View My Personal Account?",
                children: [
                  commonText(
                      title:
                          "No, Other users will not have access to your personal profile and personal account.")
                ]),
            commonExpansionTile(
                title:
                    "Will Users in a Business Be Able to View My Other Business Account?",
                children: [
                  commonText(
                      title:
                          "No, users will not have access to your other business account.They have access to only the business account that they are part of.")
                ]),
            commonExpansionTile(
                title: "Will The User be Notified if I Remove Them?",
                children: [
                  commonText(
                      title:
                          "No, The User will not be Notified When They are Removed,They will Simply lose Access to the Business Account.")
                ]),
          ],
        ),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            commonExpansionTile(
                title: "Can I Changes My Primary Email And Phone Number?",
                children: [
                  commonText(
                      title:
                          "Yes, You can Update Your Email and Phone Number By Visiting My Profile.")
                ]),
            commonExpansionTile(
                title:
                    "I Run Multiple Businesses,can I Manage Them All From The Same Account?",
                children: [
                  commonText(
                      title:
                          "Yes, You can Manage Your Existing Business and Also Add New Businesses.Services Purchased are Linked at Business Level for You to Access.")
                ]),
            commonExpansionTile(
                title: "Can I Add or Modify My Profile Details",
                children: [
                  commonText(
                      title:
                          "Yes, We Encourage Our Users to Keep Both Their Personal and Business Profile Updated for Best Experience.")
                ]),
            commonExpansionTile(
                title: "Why is My New Business Autonamed?",
                children: [
                  commonText(
                      title:
                          "We Assign Temporary Name Until The Incorporation Process is Completed.Don't Worry,You will see Your Business Name After The Process Completion.")
                ]),
            commonExpansionTile(
                title:
                    "Will Users in a Business Account be Able to View My Personal Account?",
                children: [
                  commonText(
                      title:
                          "No, Other Users will not have Access to Your Personal Profile and Personal Account.")
                ]),
            commonExpansionTile(
                title:
                    "Will Users in a Business be Able to View My Other Business Accounts?",
                children: [
                  commonText(
                      title:
                          "No, Users will not have access to Your Other Business Accounts.They have Access to Only The Business Account that they are part of.")
                ]),
          ],
        ),
      ),
    );
  }
}

Widget commonText({top, bottom, title, color}) {
  return Text(title,
          style: TextStyle(
              color: color ?? Colors.black45,
              fontWeight: FontWeight.w600,
              height: 1.3))
      .paddingOnly(top: top ?? 10, bottom: bottom ?? 10, left: 20, right: 20);
}
