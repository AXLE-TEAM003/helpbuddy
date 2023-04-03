import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:helpbuddy/authentication/forget_password.dart';
import 'package:helpbuddy/authentication/select_role.dart';
import 'package:helpbuddy/widget/button.dart';
import 'package:helpbuddy/widget/input/outlineInput.dart';
import 'package:helpbuddy/widget/loading.dart';

import 'package:helpbuddy/utils/tools.dart' as tools;

class Login extends StatefulWidget {
  const Login({
    Key? key,
  }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool loginPasswordVisibility = false;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: '');
    passwordController = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text('Welcome',
                                    style: GoogleFonts.urbanist(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28,
                                        color: Colors.white)),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text('Back',
                                    style: GoogleFonts.urbanist(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28,
                                        color: Colors.white)),
                              ],
                            ),
                            const SizedBox(
                              height: 150,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Email',
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    )),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            OutlineInput(
                              controller: emailController,
                              validator: tools.Validators.validateEmail,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Password',
                                    style: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    )),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                                validator: (String? amountController) {
                                  if (amountController!.isEmpty) {
                                    return 'Password box is Empty';
                                  }
                                  return null;
                                },
                                controller: passwordController,
                                obscureText: !loginPasswordVisibility,
                                decoration: InputDecoration(
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    borderSide: BorderSide(
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
                                  errorBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    borderSide: BorderSide(
                                      color: Color(0xff2781E1),
                                    ),
                                  ),
                                  focusedErrorBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    borderSide: BorderSide(
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
                                      size: 22,
                                    ),
                                  ),
                                )),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
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
                                            fontSize: 15,
                                            color: const Color(0xff2B47FC))),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Button(
                                text: 'Login',
                                onTap: () async {
                                   Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                const SelectRole()));

                               
                                }),
                          ],
                        )
                      ],
                    ),
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
