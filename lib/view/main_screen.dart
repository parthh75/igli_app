import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/utilities/text_style.dart';
import 'package:igli_financial/view/home_screen.dart';
import 'package:igli_financial/view/more/My_Services/myServices.dart';
import 'package:igli_financial/view/more/more_main.dart';

import '../controller/main_screen_controller.dart';
import '../utilities/colors.dart';
import '../utilities/string.dart';
import 'more/My_Services/All_Services/all_services.dart';
import 'more/Payment/payment.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> iconList = [
    "assets/image/home_outline.png",
    "assets/image/ic_outfit_cart.png",
    "assets/image/user_circle.png",
    "assets/image/credit_card_alt.png",
    "assets/image/slider_03.png",
  ];
  static const List<Widget> pageList = <Widget>[HomeScreen(), MyServicesScreen(), AllServices(), PaymentsScreen(), MoreScreen()];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: MainScreenController.to.selectedBottomIndex.stream,
        builder: (context, snapshot) {
          return Scaffold(
              body: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(
                            0.0,
                            1.0,
                          ),
                          blurRadius: 5.0,
                          spreadRadius: 0.05,
                        ), //BoxShadow
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ),
                      ]),
                      height: 50,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Image.asset("assets/image/igliLogo.png", height: 30, width: 180, fit: BoxFit.fill).paddingOnly(left: 15),
                          const Spacer(),
                          const Icon(
                            Icons.calendar_month,
                            color: Colors.black,
                          ),
                          const Icon(
                            Icons.messenger_outline_sharp,
                            color: Colors.black,
                          ).paddingOnly(left: 15, right: 15),
                          const Icon(
                            Icons.notifications_none,
                            color: Colors.black,
                          ).paddingOnly(right: 15),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: pageList[MainScreenController.to.selectedBottomIndex.value],
                      ),
                    )
                  ],
                ),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                child: BottomNavigationBar(
                  backgroundColor: colorFFFFFF,
                  selectedLabelStyle: themeData.textTheme.headline5?.copyWith(color: colorFFFFFF),
                  unselectedLabelStyle: themeData.textTheme.headline5?.copyWith(color: colors000000),
                  onTap: (int index) {
                    print('index====>${index}');
                    MainScreenController.to.selectedBottomIndex.value = index;
                  },
                  currentIndex: MainScreenController.to.selectedBottomIndex.value,
                  unselectedItemColor: const Color(0xff8F8E8E),
                  selectedItemColor: colorPrimary,
                  type: BottomNavigationBarType.fixed,
                  items: [
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        iconList[0],
                        scale: 4,
                        color: MainScreenController.to.selectedBottomIndex.value == 0 ? colorPrimary : color808080,
                      ),
                      label: CS.home,
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        iconList[1],
                        color: MainScreenController.to.selectedBottomIndex.value == 1 ? colorPrimary : color808080,
                        scale: 7,
                      ),
                      label: CS.myServices,
                    ),
                    const BottomNavigationBarItem(
                      icon: Icon(
                        Icons.add,
                        color: Colors.transparent,
                      ),
                      label: CS.services,
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        iconList[3],
                        scale: 3,
                        color: MainScreenController.to.selectedBottomIndex.value == 3 ? colorPrimary : color808080,
                      ),
                      label: CS.payment,
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        iconList[4],
                        scale: 3.2,
                        color: MainScreenController.to.selectedBottomIndex.value == 4 ? colorPrimary : color808080,
                      ),
                      label: CS.more,
                    ),
                  ],
                ),
              ),
              // bottomNavigationBar: BottomNavigationBar(
              //     items: const <BottomNavigationBarItem>[
              //       BottomNavigationBarItem(
              //           icon: Icon(Icons.home),
              //           label: 'Home',
              //           backgroundColor: Colors.green),
              //       BottomNavigationBarItem(
              //           icon: Icon(Icons.note_alt_outlined),
              //           label: 'My Services',
              //           backgroundColor: Colors.yellow),
              //       BottomNavigationBarItem(
              //         icon: Icon(Icons.payment),
              //         label: 'Payments',
              //         backgroundColor: Colors.blue,
              //       ),
              //       BottomNavigationBarItem(
              //         icon: Icon(Icons.more_vert),
              //         label: 'More',
              //         backgroundColor: Colors.blue,
              //       ),
              //     ],
              //     type: BottomNavigationBarType.fixed,
              //     currentIndex: _selectedIndex,
              //     selectedItemColor: colorPrimary,
              //     iconSize: 25,
              //     onTap: _onItemTapped,
              //     elevation: 5),
              floatingActionButton: InkWell(
                onTap: () {
                  MainScreenController.to.selectedBottomIndex.value = 2;
                },
                child: SizedBox(
                  height: 80,
                  width: 80,
                  child: Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(boxShadow: const [BoxShadow(color: Colors.grey, offset: Offset(1, 1), blurRadius: 10)], color: colorPrimary, borderRadius: BorderRadius.circular(20)),
                    child: Image.asset('assets/image/igliLogoIcon.png', scale: 5.0, color: colorFFFFFF).paddingAll(10),
                  ),
                ),
              ));
        });
  }
}
