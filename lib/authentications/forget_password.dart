import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/widget/button.dart';
import 'package:helpbuddy/widget/input/outlineInput.dart';


class ForgotpasswordWidget extends StatefulWidget {
  const ForgotpasswordWidget({Key? key}) : super(key: key);

  @override
  _ForgotpasswordWidgetState createState() => _ForgotpasswordWidgetState();
}

class _ForgotpasswordWidgetState extends State<ForgotpasswordWidget> {
  TextEditingController? emailController;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 15,
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text('Forgot password',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w500,
                      fontSize: 29,
                      color: const Color(0xff0D3E73))),
              const SizedBox(
                height: 20,
              ),
              Text('Enter your email address to continue',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: const Color(0xff0D3E73))),
              const SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Email Address',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              BlackOutlineInput(
                controller: emailController,
              ),
              const SizedBox(
                height: 50,
              ),
              Button(
                text: 'Reset Password',
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => Otp(
                  //               email: emailController!.text,
                  //             )));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  //   void Resendpin() async {
  //   Loading(context);
  //   HttpRequest('/email-verification',
  //   shouldPopOnError: false,
  //       context: context,
  //       body: {'email': widget.email}, onSuccess: (_, result) {
  //     Navigator.pop(context);
  //     successfulshowSnackbar(context, 'Sent');
  //   }, onFailure: (_, result) {
  //     Navigator.pop(context);
  //     showSnackbar(context, result['message']);
  //     return null;
  //   }, headers: {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer ${token.toString()}'
  //   }).send();
  // }
}
