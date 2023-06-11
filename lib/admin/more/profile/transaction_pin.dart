import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/utils/constant/theme.dart';
import 'package:helpbuddy/widget/button.dart';

class TransactionPin extends StatefulWidget {
  const TransactionPin({Key? key}) : super(key: key);

  @override
  _TransactionPinState createState() => _TransactionPinState();
}

class _TransactionPinState extends State<TransactionPin> {
  TextEditingController? oldPassController;
  TextEditingController? newPassController;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool loginPasswordVisibility = false;

  final bool _value = false;

  @override
  void initState() {
    super.initState();
    oldPassController = TextEditingController();
    newPassController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 16,
          ),
        ),
        title: Text('Transaction Pin',
            style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Colors.black)),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Old Password',
                        textAlign: TextAlign.start,
                        style: ConstantTheme().defaultStyle),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    validator: (String? amountController) {
                      if (amountController!.isEmpty) {
                        return 'Password box is Empty';
                      }
                      return null;
                    },
                    controller: oldPassController,
                    obscureText: !loginPasswordVisibility,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                          color: Color(0xffC4C4C5),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                          color: Color(0xffC4C4C5),
                        ),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                          color: Color(0xffC4C4C5),
                        ),
                      ),
                      focusedErrorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                          color: Color(0xffC4C4C5),
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
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('New Password',
                        textAlign: TextAlign.start,
                        style: ConstantTheme().defaultStyle),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    validator: (String? amountController) {
                      if (amountController!.isEmpty) {
                        return 'Password box is Empty';
                      }
                      return null;
                    },
                    controller: newPassController,
                    obscureText: !loginPasswordVisibility,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                          color: Color(0xffC4C4C5),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                          color: Color(0xffC4C4C5),
                        ),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                          color: Color(0xffC4C4C5),
                        ),
                      ),
                      focusedErrorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                          color: Color(0xffC4C4C5),
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
                const SizedBox(
                  height: 30,
                ),
                Button(
                  text: 'Complete',
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => Otp(
                    //               email: "email",
                    //             )));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
