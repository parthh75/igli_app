import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/utilities/string.dart';

void main() {
  runApp(MyApp());
}

Map<int, Color> color = {
  50: Color.fromRGBO(0, 64, 134, .1),
  100: Color.fromRGBO(0, 64, 134, .2),
  200: Color.fromRGBO(0, 64, 134, .3),
  300: Color.fromRGBO(0, 64, 134, .4),
  400: Color.fromRGBO(0, 64, 134, .5),
  500: Color.fromRGBO(0, 64, 134, .6),
  600: Color.fromRGBO(0, 64, 134, .7),
  700: Color.fromRGBO(0, 64, 134, .8),
  800: Color.fromRGBO(0, 64, 134, .9),
  900: Color.fromRGBO(0, 64, 134, 1),
};
MaterialColor colorCustom = MaterialColor(0xFF004086, color);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: CS.igliFinancial,
      theme: ThemeData(
        primarySwatch: colorCustom,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('My Services', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Payments', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('More', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
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
              width: Get.width,
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
                child: _widgetOptions.elementAt(_selectedIndex),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home', backgroundColor: Colors.green),
        BottomNavigationBarItem(icon: Icon(Icons.note_alt_outlined), label: 'My Services', backgroundColor: Colors.yellow),
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
      ], type: BottomNavigationBarType.fixed, currentIndex: _selectedIndex, selectedItemColor: Colors.blue, iconSize: 25, onTap: _onItemTapped, elevation: 5),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: Colors.green,
        child: const Icon(Icons.whatsapp, size: 35),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
