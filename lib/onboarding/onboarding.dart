import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/constants/dimensions.dart';
import 'package:helpbuddy/onboarding/action.dart';

import 'package:http/http.dart' as http;

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  double _rotation = 0.0;
  int currentPageIndex = 0;
  final PageController controller = PageController();

  @override
  void initState() {
    super.initState();
    controller.addListener(_pageListener);
  }

  @override
  void dispose() {
    controller.removeListener(_pageListener);
    controller.dispose();
    super.dispose();
  }

  void _pageListener() {
    setState(() {
      _rotation = -controller.page! * pi;
      currentPageIndex = controller.page!.round();
    });
  }

  void _animateToNextPage() {
    controller.animateToPage(
      currentPageIndex + 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            controller: controller,
            children: const <Widget>[
              Page1(),
              Page2(),
              SignInLogin(),
            ],
          ),
          currentPageIndex == 2
              ? const SizedBox()
              : Positioned(
                  bottom: 60.0 * factor,
                  left: 0.0,
                  right: 0.0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0 * factor),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Transform.rotate(
                          angle: _rotation,
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Container(
                                height: 9,
                                width: 35 * factor,
                                decoration: BoxDecoration(
                                    color: const Color(0xff2781E1),
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Container(
                                height: 9 * factor,
                                width: 9 * factor,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 212, 212, 212),
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            switch (currentPageIndex) {
                              case 0:
                                _animateToNextPage();
                                break;
                              case 1:
                                _animateToNextPage();
                                break;
                              case 2:
                                break;
                              default:
                                break;
                            }
                          },
                          child: AnimatedContainer(
                            padding: EdgeInsets.symmetric(
                                vertical: 8 * factor, horizontal: 20 * factor),
                            decoration: BoxDecoration(
                                color: const Color(0xff2781E1),
                                borderRadius: BorderRadius.circular(12)),
                            duration: const Duration(milliseconds: 1000),
                            child: Center(
                              child: Text(
                                  currentPageIndex == 0
                                      ? 'Next'
                                      : currentPageIndex == 1
                                          ? 'Get Started'
                                          : '',
                                  style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 17 * factor,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(),
        Image.asset('assets/onboarding/onboard_1.png'),
        Container(
          margin: EdgeInsets.only(top: 90 * factor),
          padding: EdgeInsets.only(left: 30 * factor),
          child: Row(
            children: [
              Text('Get you project or thesis\nwritten by professionals',
                  style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff2781E1),
                      fontSize: 16 * factor,
                      letterSpacing: 0.6 * factor)),
            ],
          ),
        )
      ]),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(),
        Image.asset('assets/onboarding/onboard_2.png'),
        Container(
          margin: EdgeInsets.only(top: 90 * factor),
          padding: EdgeInsets.only(left: 30 * factor),
          child: Row(
            children: [
              Text('Talk to Professionals\nin real-time',
                  style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff2781E1),
                      fontSize: 16 * factor,
                      letterSpacing: 0.6 * factor)),
            ],
          ),
        )
      ]),
    );
  }
}

int currentPage = 0;
