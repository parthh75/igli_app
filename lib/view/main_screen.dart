import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/view/home_screen.dart';
import 'package:igli_financial/view/more/more_main.dart';
import 'package:igli_financial/view/more/My_Services/myServices.dart';

import '../utilities/colors.dart';
import 'more/Payment/payment.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void _incrementCounter() {
    setState(() {});
  }

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    MyServicesScreen(),
    PaymentsScreen(),
    MoreScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  Image.asset("assets/image/igliLogo.png",
                      height: 30, width: 180, fit: BoxFit.fill)
                      .paddingOnly(left: 15),
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
                child: _widgetOptions.elementAt(_selectedIndex),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
                icon: Icon(Icons.note_alt_outlined),
                label: 'My Services',
                backgroundColor: Colors.yellow),
            BottomNavigationBarItem(
              icon: Icon(Icons.payment),
              label: 'Payments',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_vert),
              label: 'More',
              backgroundColor: Colors.blue,
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: colorPrimary,
          iconSize: 25,
          onTap: _onItemTapped,
          elevation: 5),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: Colors.green,
        child: const Icon(Icons.whatsapp, size: 35),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
