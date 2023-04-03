import 'package:flutter/material.dart';
import 'package:helpbuddy/authentication/login.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => const Login ()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
            child: Image.asset(
          'assets/images/Twgo 1.png',
          height: 300,
          width: 300,
        )),
      ),
    );
  }
}
