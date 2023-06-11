import 'package:flutter/material.dart';
import 'package:helpbuddy/constants/dimensions.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, '/onboarding');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // !!! Very important for widget responsiveness . . .
    factor = ((screenWidth / refWidth) + (screenHeight / refHeight)) / 2;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
              child: Image.asset(
            'assets/images/Twgo 1.png',
            height: 300 * factor,
            width: 300 * factor,
          )),
        ),
      ),
    );
  }
}
