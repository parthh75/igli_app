import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/utilities/colors.dart';

import 'more/My_Services/All_Services/all_services.dart';

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
            const SizedBox(
              height: 12,
            ),

            Container(
              color: colorFFFFFF,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Our Service", style: TextStyle(fontWeight: FontWeight.w700, color: colors000000, fontSize: 18)).paddingSymmetric(vertical: 10, horizontal: 15),
                  SizedBox(
                    height: 430,
                    width: double.infinity,
                    child: GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 3,
                      children: <Widget>[
                        Container(
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
                              const Icon(
                                Icons.account_balance_rounded,
                                size: 20,
                              ),
                              Text(
                                "TradeMark",
                                style: TextStyle(
                                  color: colors000000,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
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
                              const Icon(
                                Icons.account_balance_rounded,
                                size: 20,
                              ),
                              Text(
                                "TradeMark",
                                style: TextStyle(
                                  color: colors000000,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
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
                              const Icon(
                                Icons.account_balance_rounded,
                                size: 20,
                              ),
                              Text(
                                "TradeMark",
                                style: TextStyle(
                                  color: colors000000,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
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
                              const Icon(
                                Icons.account_balance_rounded,
                                size: 20,
                              ),
                              Text(
                                "TradeMark",
                                style: TextStyle(
                                  color: colors000000,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
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
                              const Icon(
                                Icons.account_balance_rounded,
                                size: 20,
                              ),
                              Text(
                                "TradeMark",
                                style: TextStyle(
                                  color: colors000000,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
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
                              const Icon(
                                Icons.account_balance_rounded,
                                size: 20,
                              ),
                              Text(
                                "TradeMark",
                                style: TextStyle(
                                  color: colors000000,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
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
                              const Icon(
                                Icons.account_balance_rounded,
                                size: 20,
                              ),
                              Text(
                                "TradeMark",
                                style: TextStyle(
                                  color: colors000000,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
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
                              const Icon(
                                Icons.account_balance_rounded,
                                size: 20,
                              ),
                              Text(
                                "TradeMark",
                                style: TextStyle(
                                  color: colors000000,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
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
                              const Icon(
                                Icons.account_balance_rounded,
                                size: 20,
                              ),
                              Text(
                                "TradeMark",
                                style: TextStyle(
                                  color: colors000000,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
            // Container(
            //   color: colorFFFFFF,
            //   padding: EdgeInsets.symmetric(horizontal: 10),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text("Our Services",style: TextStyle(fontWeight: FontWeight.w700,
            //           color: colors000000,fontSize: 18),
            //       ),
            //       GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 9,), itemBuilder: (context, index) =>
            //         Container(
            //           decoration: BoxDecoration(
            //             color: colorF8F8F8,
            //             borderRadius: Bor
            //           ),
            //           child: Column(
            //             children: [
            //
            //             ],
            //           ),
            //         )
            //         ,)
            //     ],
            //   ),
            // )
          ])),
    );
  }
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
