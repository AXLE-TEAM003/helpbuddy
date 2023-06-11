import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/api_client/api_client.dart';
import 'package:helpbuddy/authentications/forget_password.dart';
import 'package:helpbuddy/constants/dimensions.dart';
import 'package:helpbuddy/widget/button.dart';
import 'package:helpbuddy/widget/input/outlineInput.dart';

import 'package:helpbuddy/utils/tools.dart' as tools;

import '../../utils/toasts.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({
    Key? key,
  }) : super(key: key);

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

  bool loginPasswordVisibility = false;

  bool sending = false;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: '');
    passwordController = TextEditingController(text: '');
  }

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
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('Welcome',
                                    style: GoogleFonts.urbanist(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28 * factor,
                                        color: Colors.white)),
                                const SizedBox(
                                  height: 8,
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
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    borderSide: BorderSide(
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
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                const ForgotpasswordWidget()));
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
                                      verifyLogins(emailController.text,
                                              passwordController.text)
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
                                                  context, '/admin/dashboard',
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

verifyLogins(String email, String password) {
  final response = ApiClient.auths()
      .authPost('login-admin', {'email': email.toLowerCase(), 'password': password});
  return response;
}
