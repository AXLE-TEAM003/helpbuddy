import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/utils/constant/theme.dart';
import 'package:helpbuddy/widget/button.dart';
import 'package:helpbuddy/widget/input/outlineInput.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class CreateAdmin extends StatefulWidget {
  const CreateAdmin({Key? key}) : super(key: key);

  @override
  _CreateAdminState createState() => _CreateAdminState();
}

class _CreateAdminState extends State<CreateAdmin> {
  TextEditingController? emailController;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool loginPasswordVisibility = false;

  bool _value = false;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: Text('Create New Admin',
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
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('First Name',
                        textAlign: TextAlign.start,
                        style: ConstantTheme().defaultStyle),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                BlackOutlineInput(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Last Name',
                        textAlign: TextAlign.start,
                        style: ConstantTheme().defaultStyle),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                BlackOutlineInput(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Email Address',
                        textAlign: TextAlign.start,
                        style: ConstantTheme().defaultStyle),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                BlackOutlineInput(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Username',
                        textAlign: TextAlign.start,
                        style: ConstantTheme().defaultStyle),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                BlackOutlineInput(
                  preffixWidget:  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('@'),
                  ),


                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Gender',
                        textAlign: TextAlign.start,
                        style: ConstantTheme().defaultStyle),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                BlackOutlineInput(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    Future selectedGender = showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SimpleDialog(
                          title: Text('Select your gender',
                              style: ConstantTheme().bigBlueStyle),
                          children: <Widget>[
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.pop(context, 'Male');
                              },
                              child: Text('Male',
                                  style: ConstantTheme().defaultStyle),
                            ),
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.pop(
                                  context,
                                  'Female',
                                );
                              },
                              child: Text('Female',
                                  style: ConstantTheme().defaultStyle),
                            ),
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.pop(context, 'Other');
                              },
                              child: Text('Other',
                                  style: ConstantTheme().defaultStyle),
                            ),
                          ],
                        );
                      },
                    );
                    setState(() {
                      //_selectedGender = selectedGender;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Password',
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
                    //controller: passwordController,
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
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(' Confirm Password',
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
                    //controller: passwordController,
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Checkbox(
                        // fillColor:Colors.white ,
                        value: _value,
                        onChanged: (bool? value) {
                          setState(() {
                            _value = value!;
                            //VALUE = 1;
                          });
                        },
                        activeColor: const Color(0xff2781E1)
                        //   tristate: true,
                        ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        //   _launchURL();
                      },
                      child: RichText(
                          text: TextSpan(
                              text: 'Verify Admin',
                              style: GoogleFonts.urbanist(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.black),
                              children: const [])),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Button(
                  text: 'Create Account',
                  onTap: () {
                    showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 300,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(MdiIcons.checkDecagram,
                                    color: Color(0xff69F0AE), size: 70),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Account setup is successful!!',
                                  style: ConstantTheme().defaultStyle,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Share link with new admin',
                                  style: ConstantTheme().defaultStyle,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                )
              ],
            ),
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
