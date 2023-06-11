import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helpbuddy/constants/dimensions.dart';

class SignInLogin extends StatefulWidget {
  const SignInLogin({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInLogin> createState() => _SignInLoginState();
}

class _SignInLoginState extends State<SignInLogin> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  bool signInLoginPasswordVisibility = false;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
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
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: 90 * factor,
                      left: 20 * factor,
                      right: 20 * factor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Sign in ...
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, '/select-role');
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 18 * factor, horizontal: 20 * factor),
                          decoration: BoxDecoration(
                              color: const Color(0xff2781E1),
                              borderRadius: BorderRadius.circular(12)),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Text('Sign In',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 18 * factor,
                                  )),
                              Expanded(child: Container()),
                              const Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10 * factor,
                      ),
                      // Sign up ...
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 18 * factor, horizontal: 20 * factor),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: const Color(0xff2781E1),
                              )),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Text('Sign Up',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff2781E1),
                                    fontSize: 18 * factor,
                                  )),
                              Expanded(child: Container()),
                              const Icon(
                                Icons.arrow_forward_rounded,
                                color: Color(0xff2781E1),
                              )
                            ],
                          ),
                        ),
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
