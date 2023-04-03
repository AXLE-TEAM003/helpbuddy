import 'package:flutter/material.dart';
import 'package:helpbuddy/authentication/login.dart';
import 'package:helpbuddy/authentication/signup.dart';
import 'package:helpbuddy/widget/button.dart';


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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool SignInLoginPasswordVisibility = false;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
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
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 90, left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SecondButton(
                        text: 'Signup',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => const SignUp()));
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Button(text: 'Signin' ,    onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => const Login()));
                        },)
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
