import 'package:flutter/material.dart';
import 'package:igli_financial/utilities/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

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
