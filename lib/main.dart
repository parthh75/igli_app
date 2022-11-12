import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/utilities/string.dart';
import 'package:igli_financial/view/login_screen.dart';
import 'package:igli_financial/view/more/more_main.dart';
import 'package:igli_financial/view/more/myprofile.dart';
import 'package:igli_financial/view/more/ourpartnerservicescreen.dart';
import 'package:igli_financial/view/more/partners_screen.dart';
import 'package:igli_financial/view/splash_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

void main() {
  runApp(const MyApp());
}

Map<int, Color> color = {
  50: const Color.fromRGBO(0, 64, 134, .1),
  100: const Color.fromRGBO(0, 64, 134, .2),
  200: const Color.fromRGBO(0, 64, 134, .3),
  300: const Color.fromRGBO(0, 64, 134, .4),
  400: const Color.fromRGBO(0, 64, 134, .5),
  500: const Color.fromRGBO(0, 64, 134, .6),
  600: const Color.fromRGBO(0, 64, 134, .7),
  700: const Color.fromRGBO(0, 64, 134, .8),
  800: const Color.fromRGBO(0, 64, 134, .9),
  900: const Color.fromRGBO(0, 64, 134, 1),
};
MaterialColor colorCustom = MaterialColor(0xFF004086, color);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: CS.igliFinancial,
      theme: ThemeData(
        primarySwatch: colorCustom,
      ),
      builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget!),
          maxWidth: 1200,
          minWidth: 420,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(420, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          background: Container(color: Colors.white)),
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
      home: const MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  MyHomeState createState() => MyHomeState();
}

class MyHomeState extends State<MyHome> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () async {
      Get.to(() => const LoginScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
    // return const ProfileScreen();
  }
}
