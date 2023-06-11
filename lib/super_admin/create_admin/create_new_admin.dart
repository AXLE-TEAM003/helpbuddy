import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/utils/constant/theme.dart';
import 'package:helpbuddy/widget/button.dart';
import 'package:helpbuddy/widget/input/outlineInput.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../api_client/api_client.dart';
import '../../utils/toasts.dart';

class CreateAdmin extends StatefulWidget {
  const CreateAdmin({Key? key}) : super(key: key);

  @override
  CreateAdminState createState() => CreateAdminState();
}

class CreateAdminState extends State<CreateAdmin> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController nationalityController;
  late TextEditingController genderController;
  late TextEditingController passwordController;

  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey3 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey4 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey5 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey6 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey7 = GlobalKey<FormState>();

  @override
  void initState() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    nationalityController = TextEditingController();
    genderController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool loginPasswordVisibility = false;

  bool _value = false;

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
        title: Text('Create New Merchant',
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
                Form(
                    key: _formKey1,
                    child: BlackOutlineInput(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'This field is required';
                        }
                      },
                      controller: firstNameController,
                    )),
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
                Form(
                    key: _formKey2,
                    child: BlackOutlineInput(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'This field is required';
                        }
                      },
                      controller: lastNameController,
                    )),
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
                Form(
                    key: _formKey3,
                    child: BlackOutlineInput(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'This field is required';
                        }
                      },
                      controller: emailController,
                    )),
                const SizedBox(
                  height: 20,
                ),
                /*   Row(
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
                  preffixWidget: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('@'),
                  ),
                ),
               */
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
                Form(
                  key: _formKey4,
                  child: BlackOutlineInput(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    controller: genderController,
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
                                  setState(() {
                                    genderController.text = 'Male';
                                  });
                                  debugPrint(genderController.text);
                                  Navigator.pop(context);
                                },
                                child: Text('Male',
                                    style: ConstantTheme().defaultStyle),
                              ),
                              SimpleDialogOption(
                                onPressed: () {
                                  setState(() {
                                    genderController.text = 'Female';
                                  });
                                  Navigator.pop(
                                    context,
                                    'Female',
                                  );
                                },
                                child: Text('Female',
                                    style: ConstantTheme().defaultStyle),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
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
                Form(
                  key: _formKey5,
                  child: TextFormField(
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
                ),
                /*  const SizedBox(
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
                */
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
                    bool isFormValid = _formKey1.currentState!.validate() &&
                        _formKey2.currentState!.validate() &&
                        _formKey3.currentState!.validate() &&
                        _formKey4.currentState!.validate() &&
                        _formKey5.currentState!.validate();

                    if (!isFormValid) {
                      setState(() {
                        _formKey1.currentState!.validate();
                        _formKey2.currentState!.validate();
                        _formKey3.currentState!.validate();
                        _formKey4.currentState!.validate();
                        _formKey5.currentState!.validate();
                      });
                    } else {
                      registerAdmin(
                              firstNameController.text,
                              lastNameController.text,
                              emailController.text,
                              genderController.text,
                              passwordController.text)
                          .then((response) {
                        if (response is num) {
                          showSnackBar(context,
                              "Something happened. Try again later [$response]");
                        } else {
                          if (response['success']) {
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                        TextButton(
                                            onPressed: () => Navigator.popUntil(
                                                context,
                                                ModalRoute.withName(
                                                    '/super-admin/dashboard')),
                                            child: Text(
                                              'Share link with new admin',
                                              style:
                                                  TextStyle(color: Colors.blue),
                                            )),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          } else {
                            showSnackBar(context,
                                "Email already exists. Please try again with a different email.");
                          }
                        }
                      });
                    }
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

registerAdmin(String firstName, String lastName, String email, String gender,
    String password) {
  print(password);
  final response = ApiClient.auths().authPost('register-admin', {
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "password": password,
    "phone_number": "08123456789",
    "nationality": "Nigeria",
    "gender": gender
  });
  return response;
}
