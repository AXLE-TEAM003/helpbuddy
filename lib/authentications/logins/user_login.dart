import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/api_client/api_client.dart';
import 'package:helpbuddy/constants/dimensions.dart';
import 'package:helpbuddy/widget/button.dart';
import 'package:helpbuddy/widget/input/outlineInput.dart';

import 'package:helpbuddy/utils/tools.dart' as tools;

import '../../utils/toasts.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({
    Key? key,
  }) : super(key: key);

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

  bool sending = false;

  bool loginPasswordVisibility = false;

  // FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: '');
    passwordController = TextEditingController(text: '');
    // _initializeFirebaseMessaging();
  }

  /* void _initializeFirebaseMessaging() async {
    await _firebaseMessaging.requestPermission();
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                // color: Colors.white,
                height: MediaQuery.of(context).size.height * .9,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.all(15.0 * factor),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SafeArea(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 10 * factor,
                                ),
                                Text('Welcome',
                                    style: GoogleFonts.urbanist(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28 * factor,
                                        color: Colors.white)),
                                SizedBox(
                                  height: 8 * factor,
                                ),
                                Text('Back',
                                    style: GoogleFonts.urbanist(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28 * factor,
                                        color: Colors.white)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 70 * factor,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Email',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14 * factor,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 5 * factor,
                          ),
                          Form(
                            key: _formKey1,
                            child: OutlineInput(
                              controller: emailController,
                              validator: tools.Validators.validateEmail,
                            ),
                          ),
                          SizedBox(
                            height: 20 * factor,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Password',
                                  style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14 * factor,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 5 * factor,
                          ),
                          Form(
                            key: _formKey2,
                            child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Password is required';
                                  }
                                  return null;
                                },
                                controller: passwordController,
                                obscureText: !loginPasswordVisibility,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12 * factor)),
                                    borderSide: const BorderSide(
                                      color: Color(0xff2781E1),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12 * factor)),
                                    borderSide: const BorderSide(
                                      color: Color(0xff2781E1),
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12 * factor)),
                                    borderSide: const BorderSide(
                                      color: Color(0xff2781E1),
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12 * factor)),
                                    borderSide: const BorderSide(
                                      color: Color(0xff2781E1),
                                    ),
                                  ),
                                  suffixIcon: InkWell(
                                    onTap: () => setState(
                                      () => loginPasswordVisibility =
                                          !loginPasswordVisibility,
                                    ),
                                    child: Icon(
                                      loginPasswordVisibility
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: Colors.black,
                                      size: 22 * factor,
                                    ),
                                  ),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 20 * factor, bottom: 20 * factor),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/forgot-password');
                                  },
                                  child: Text('Forgot Password',
                                      style: GoogleFonts.plusJakartaSans(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15 * factor,
                                          color: const Color(0xff2B47FC))),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      Column(
                        children: [
                          sending
                              ? const Center(child: CircularProgressIndicator())
                              : Button(
                                  text: 'Login',
                                  onTap: () async {
                                    // Validate both form fields
                                    bool isFormValid =
                                        _formKey1.currentState!.validate() &&
                                            _formKey2.currentState!.validate();

                                    if (!isFormValid) {
                                      setState(() {
                                        _formKey1.currentState!.validate();
                                        _formKey2.currentState!.validate();
                                      });
                                    } else {
                                      setState(() {
                                        sending = true;
                                      });
                                      // String? firebaseToken =
                                      //     await _firebaseMessaging.getToken();
                                      verifyLogins(
                                              emailController.text,
                                              passwordController.text,
                                              'firebaseToken')
                                          .then((response) {
                                        if (response is num) {
                                          showSnackBar(context,
                                              "Invalid login credentials used. Try again");
                                          setState(() {
                                            sending = false;
                                          });
                                        } else {
                                          if (response['success']) {
                                            showSuccessSnackBar(
                                                context, "Login success");
                                            Future.delayed(
                                                const Duration(seconds: 2), () {
                                              Navigator.pushReplacementNamed(
                                                  context, '/user/dashboard',
                                                  arguments: {
                                                    "token": response['token']
                                                  });
                                            });
                                          } else {
                                            showSnackBar(context,
                                                "Wrong email or password used. Please try again");
                                            setState(() {
                                              sending = false;
                                            });
                                          }
                                        }
                                      });
                                    }
                                  }),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

verifyLogins(String email, String password, String? firebaseToken) {
  final response = ApiClient.auths().authPost('login-user', {
    'email': email.toLowerCase(),
    'password': password,
    'firebase_token': firebaseToken,
  });
  return response;
}
