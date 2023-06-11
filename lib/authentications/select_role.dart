import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/constants/dimensions.dart';
import 'package:helpbuddy/widget/button.dart';

import '../exit_confirmation/exit_confirmation.dart';

class SelectRole extends StatefulWidget {
  const SelectRole({
    Key? key,
  }) : super(key: key);

  @override
  State<SelectRole> createState() => _SelectRoleState();
}

class _SelectRoleState extends State<SelectRole> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  bool selectRolePasswordVisibility = false;

  @override
  void initState() {
    super.initState();

    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

    Future<bool> _onBackPressed() async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) => const ExitConfirmationDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: SingleChildScrollView(
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.dark,
            ),
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/Shapes.png',
                        width: MediaQuery.of(context).size.width * .8,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.all(20.0 * factor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 80 * factor,
                        ),
                        Text('Continue as',
                            style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w400,
                              fontSize: 23 * factor,
                            )),
                        SizedBox(
                          height: 40 * factor,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/user-login');
                          },
                          child: Button(text: 'User'),
                        ),
                        SizedBox(
                          height: 15 * factor,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/admin-login');
                            },
                            child: SecondButton(text: 'Merchant')),
                        SizedBox(
                          height: 15 * factor,
                        ),
                        SecondButton(
                          text: 'Twgo pro',
                          onTap: () {
                            Navigator.pushNamed(context, '/super-admin-login');
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
