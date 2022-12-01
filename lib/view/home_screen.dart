import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/utilities/colors.dart';
import 'package:igli_financial/utilities/common_button.dart';
import 'package:igli_financial/view/contactus_screen.dart';

import '../controller/main_screen_controller.dart';
import 'more/My_Services/All_Services/all_services.dart';
import 'search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<Widget> images = [
    commonImageView(onTap: () {
      Get.to(const AllServices());
    }),
    commonImageView(
        onTap: () {
          Get.to(const AllServices());
        },
        image: "https://iglifinancial.com/wp-content/uploads/2022/11/sdafffasfa-1024x683.png",
        title: "Register your Company",
        subTitle: "Incorporate your company in less than 2 weeks online through IGLI FINANCIAL."),
    commonImageView(
        onTap: () {
          Get.to(const AllServices());
        },
        image: "https://iglifinancial.com/wp-content/uploads/2022/11/sghejrjs-1024x683.png",
        title: "LLP Registration",
        subTitle: "LLP registration and deed drafting including Government Fee & Stamp Duty*. in just 6199/-"),
    commonImageView(
        onTap: () {
          Get.to(const AllServices());
        },
        image: "https://iglifinancial.com/wp-content/uploads/2022/11/scasvavwvwv-1024x683.png",
        title: "Protect Your Brand",
        subTitle: "Get a trademark registration and protect your brand from copycats."),
    commonImageView(
        onTap: () {
          Get.to(const AllServices());
        },
        image: "https://iglifinancial.com/wp-content/uploads/2022/11/daskdnaksa-1024x683.png",
        title: "Startup India Registration",
        subTitle: "The Startup India Registration is the process of registering a startup with the Government of India."),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            searchMethod(),
            sliderSection(),
            myServicesSection(),
            ourServiceSection(),
            needHelpSection(),
          ])),
    );
  }

  Widget searchMethod() {
    return Container(
      color: colorFFFFFF,
      child: InkWell(
        onTap: () => Get.to(() => const SearchScreen()),
        child: Container(
                height: 45,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: colorPrimary, width: 1.5)),
                child: Row(
                  children: [
                    Icon(Icons.search, color: colorPrimary.withOpacity(0.9)).paddingOnly(right: 10),
                    Text("Search Something...", style: TextStyle(fontWeight: FontWeight.w500, color: colors000000.withOpacity(0.6), fontSize: 13)),
                    const Spacer(),
                    Image.asset("assets/image/igliLogoIcon.png", height: 30),
                  ],
                ).paddingSymmetric(horizontal: 10))
            .paddingSymmetric(horizontal: 20),
      ),
    ).paddingOnly(top: 15, bottom: 15);
  }

  Widget sliderSection() {
    return Container(
      color: colorFFFFFF,
      child: Column(
        children: [
          CarouselSlider(
            items: images,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ).paddingSymmetric(vertical: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 10.0,
                  height: 10.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: (Theme.of(context).brightness == Brightness.dark ? Colors.white : colorPrimary).withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget myServicesSection() {
    return Container(
      color: colorFFFFFF,
      child: Column(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("My Service", style: TextStyle(fontWeight: FontWeight.w700, color: colors000000, fontSize: 18)).paddingSymmetric(vertical: 15, horizontal: 15),
            const Spacer(),
            GestureDetector(
                onTap: () {
                  Get.to(() => const AllServices());
                },
                child: Text(
                  "View All",
                  style: TextStyle(color: colorPrimary, fontSize: 13),
                ).paddingSymmetric(vertical: 15, horizontal: 15))
          ],
        ),
        Column(
          children: [
            Image.asset(
              "assets/image/noData.png",
              height: 100,
              width: 250,
              fit: BoxFit.fill,
            ),
            Text(
              "Nothing to show yet!\n Track your recent services here",
              style: TextStyle(fontWeight: FontWeight.w500, color: colors000000, fontSize: 13),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 15, horizontal: 15),
            CommonButton(
              "Explore Services",
              onTap: () {
                MainScreenController.to.selectedBottomIndex.value = 2;
              },
              color: colorPrimary,
              borderRadius: BorderRadius.circular(50),
              width: 160,
              height: 35,
            ).paddingOnly(bottom: 15)
          ],
        ).paddingOnly(top: 15)
      ]),
    ).paddingSymmetric(vertical: 15);
  }

  Widget ourServiceSection() {
    return Container(
      color: colorFFFFFF,
      child: Column(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Our Service", style: TextStyle(fontWeight: FontWeight.w700, color: colors000000, fontSize: 18)).paddingSymmetric(vertical: 15, horizontal: 15),
            const Spacer(),
            GestureDetector(
                onTap: () {
                  Get.to(() => const AllServices());
                },
                child: Text(
                  "View All",
                  style: TextStyle(color: colorPrimary, fontSize: 13),
                ).paddingSymmetric(vertical: 15, horizontal: 15))
          ],
        ),
        SizedBox(
          height: 430,
          width: double.infinity,
          child: GridView.builder(
            primary: false,
            padding: const EdgeInsets.all(20),
            itemCount: homeGridViewList.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: colorF8F8F8,
                ),
                height: 100,
                width: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(homeGridViewList[index].image ?? "", height: 60, width: 60, fit: BoxFit.fill),
                    const SizedBox(height: 10),
                    Text(
                      homeGridViewList[index].title ?? "",
                      style: TextStyle(
                        color: colors000000,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
            // children: homeGridViewList.map((e) => )[]
          ),
        )
      ]),
    ).paddingSymmetric(vertical: 15);
  }

  Widget needHelpSection() => Container(
        color: colorFFFFFF,
        child: Container(
          decoration: BoxDecoration(color: colorFFFFFF, borderRadius: BorderRadius.circular(20), border: Border.all(color: colorPrimary, width: 2)),
          height: 150,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Need Help?", style: TextStyle(fontWeight: FontWeight.w700, color: colors000000, fontSize: 18)).paddingSymmetric(vertical: 10, horizontal: 15),
                    RichText(
                      text: TextSpan(
                          text: "We are here answer any quistion or doubts you have!. You can also write to us on  ",
                          style: TextStyle(fontWeight: FontWeight.w400, color: colors000000, fontSize: 12, height: 1.2),
                          children: [
                            TextSpan(
                              text: "info@iglifinancial.com",
                              style: TextStyle(fontWeight: FontWeight.w400, color: colorPrimary, fontSize: 13),
                              recognizer: TapGestureRecognizer()..onTap = () => print('Tap Here onTap'),
                            )
                          ]),
                    ).paddingSymmetric(horizontal: 15),
                    CommonButton(
                      "Contact us    ->",
                      onTap: () {
                        Get.to(() => const ContactUs());
                      },
                      color: colorPrimary,
                      borderRadius: BorderRadius.circular(50),
                      width: 150,
                      height: 35,
                    ).paddingOnly(left: 15, top: 15)
                  ],
                ),
              ),
              SizedBox(
                height: 90,
                child: Image.asset(
                  "assets/image/needHelp.png",
                ),
              ).paddingOnly(right: 20)
            ],
          ),
        ).paddingAll(20),
      );
}

Widget commonImageView({
  String? image,
  String? title,
  String? subTitle,
  Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
          alignment: Alignment.bottomRight,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(image ?? "https://iglifinancial.com/wp-content/uploads/2022/11/estwtw-1024x683.png"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title ?? "Get your GST Registration",
                style: TextStyle(color: colorFFFFFF, fontWeight: FontWeight.w900, fontSize: 25, backgroundColor: Colors.black12),
              ),
              Text(
                subTitle ?? "Get your GST registration certificate in less than a week through IGLI FINANCIAL.",
                style: TextStyle(backgroundColor: Colors.black12, color: colorFFFFFF, fontWeight: FontWeight.w500, fontSize: 15),
              )
            ],
          ).paddingSymmetric(vertical: 10, horizontal: 10)),
    ),
  );
}

class HomeGridViewList {
  String? title;
  String? image;

  HomeGridViewList({this.title, this.image});
}

List<HomeGridViewList> homeGridViewList = [
  HomeGridViewList(title: "GST Registration", image: "assets/image/gst.png"),
  HomeGridViewList(title: "GST Return Filing", image: "assets/image/tax-calculate.png"),
  HomeGridViewList(title: "Trademark Registration", image: "assets/image/trademarkIcon.png"),
  HomeGridViewList(title: "Company Registration", image: "assets/image/office.png"),
  HomeGridViewList(title: "Income Tax Complaint", image: "assets/image/tax-calculate.png"),
  HomeGridViewList(title: "Startup India Registration", image: "assets/image/startup.png"),
  HomeGridViewList(title: "Udyam Registration", image: "assets/image/udyamIcon.png"),
  HomeGridViewList(title: "LLP Registration", image: "assets/image/llp.png"),
  HomeGridViewList(title: "FSSAI Registration", image: "assets/image/fssaiIcon.png"),
// HomeGridViewList(title: "PVT",image: "assets/image/document.png"),
// HomeGridViewList(title: "Copyright",image: "assets/image/law.png"),
// HomeGridViewList(title: "NGO",image: "assets/image/ngo.png"),
// HomeGridViewList(title: "Fundraising",image: "assets/image/fundraising.png"),
];
