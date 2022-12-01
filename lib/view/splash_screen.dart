import 'package:flutter/material.dart';
import 'package:igli_financial/utilities/colors.dart';

import '../model/firebase_services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: colorFFFFFF,
        child: Center(
          child: SizedBox(
            width: 250,
            height: 250,
            child: Column(children: [Expanded(flex: 3, child: Image.asset("assets/image/igli_splash_logo.png"))]),
          ),
        ),
      ),
    );
  }
}
