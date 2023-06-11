/* import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/super_admin/home/dashboard.dart';
import 'package:helpbuddy/widget/button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:timer_builder/timer_builder.dart';
 
class Otp extends StatefulWidget {
  // Map<String, String> data;

  Otp({
    Key? key,
    required this.email,
    required this.phone,
  }) : super(key: key);
  String email;
  String phone;

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  String? currentText;

  var textEditingController;
  late DateTime alert;
  @override
  void initState() {
    super.initState();
    sendOTP(widget.phone);
    alert = DateTime.now().add(const Duration(seconds: 45));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios,
              color: Color(0xff292D32), size: 20),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor:Colors.white ,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Enter OTP Code',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        )),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                        'Please enter the 6 digit code sent to ${widget.email}',
                        style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        )),
                    const SizedBox(
                      height: 48,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 30),
                        child: PinCodeTextField(
                          appContext: context,
                          pastedTextStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          backgroundColor: Colors.white,
                          length: 6,
                          obscureText: true,
                          obscuringCharacter: '*',
                          // obscuringWidget: const FlutterLogo(
                          //   size: 24,
                          // ),
                          blinkWhenObscuring: true,
                          animationType: AnimationType.fade,
                          // validator: (v) {
                          //   if (v!.length < 3) {
                          //     return "I'm from validator";
                          //   } else {
                          //     return null;
                          //   }
                          // },
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.underline,
                            // borderRadius: BorderRadius.circular(5),
                            fieldHeight: 50,
                            fieldWidth: 40,
                            borderWidth: 1.5,
                            activeColor: Colors.blue,
                            activeFillColor: const Color.fromARGB(48, 39, 129, 225),
                            inactiveColor:
                                const Color.fromARGB(255, 227, 226, 226),
                            selectedFillColor: Colors.white,
                            selectedColor:
                                const Color.fromARGB(255, 203, 201, 201),
                            disabledColor:
                                const Color.fromARGB(255, 188, 186, 186),
                            inactiveFillColor: Colors.white,
                          ),
                          cursorColor: Colors.black,
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: true,
                          // errorAnimationController: errorController,
                          controller: textEditingController,
                          //  keyboardType: TextI,

                          onCompleted: (String v) {
                            debugPrint('Completed');
                          },
                          // onTap: () {
                          //   print("Pressed");
                          // },
                          onChanged: (String value) {
                            debugPrint(value);
                            setState(() {
                              currentText = value;
                            });
                          },
                          beforeTextPaste: (String? text) {
                            debugPrint('Allowing to paste $text');
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          },
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    TimerBuilder.scheduled([alert], builder: (BuildContext context) {
                      // This function will be called once the alert time is reached
                      DateTime now = DateTime.now();
                      bool reached = now.compareTo(alert) >= 0;

                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            // Icon(
                            //   reached ? Icons.alarm_on : Icons.alarm,
                            //   color: reached ? Colors.red : Colors.green,
                            //   size: 48,
                            // ),
                            !reached
                                ? TimerBuilder.periodic(
                                    const Duration(seconds: 1),
                                    alignment: Duration.zero,
                                    builder: (BuildContext context) {
                                    // This function will be called every second until the alert time
                                    DateTime now = DateTime.now();
                                    Duration remaining = alert.difference(now);
                                    return Text(formatDuration(remaining)
                                        // remaining.toString().trim(),

                                        );
                                  })
                                : InkWell(
                                    onTap: () {
                                      //  resendOtp();
                                      alert = DateTime.now()
                                          .add(const Duration(seconds: 45));
                                    },
                                    child: Text('Resend OTP',
                                        style: GoogleFonts.plusJakartaSans(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        )),
                                  ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
                Column(
                  children: [
                    Button(
                      text: 'Reset Password',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => const SuperAdminDashboard()));
                      },
                    ),
                    const SizedBox(
                      height: 45,
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }

  String formatDuration(Duration duration) {
    String hours = duration.inHours.toString().padLeft(0, '2');
    String minutes =
        duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    String seconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  Future<void> sendOTP(String phoneNumber) async {
    try {
      final HttpsCallable sendOTPCallable =
          FirebaseFunctions.instance.httpsCallable('sendOTP');
      final HttpsCallableResult result = await sendOTPCallable({'phoneNumber': phoneNumber});
      if (result.data['success']) {
        // OTP sent successfully
      } else {
        // Error sending OTP
      }
    } on FirebaseFunctionsException {
      // Handle function errors
    } catch (e) {
      // Handle other errors
    }
  }

  // Future<void> verifyOTP(String otp) async {
  //   codeSent: (String verificationId, int? resendToken) async {
  //   // Update the UI - wait for the user to enter the SMS code
  //   String smsCode = 'xxxx';

  //   // Create a PhoneAuthCredential with the code
  //   PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

  //   // Sign the user in (or link) with the credential
  //   await auth.signInWithCredential(credential);
  // }


  // }
}
 */