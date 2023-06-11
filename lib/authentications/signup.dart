import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:helpbuddy/constants/dimensions.dart';
import 'package:helpbuddy/utils/constant/theme.dart';

import 'package:helpbuddy/widget/button.dart';
import 'package:helpbuddy/widget/input/outlineInput.dart';

import 'package:helpbuddy/utils/tools.dart' as tools;

import '../api_client/api_client.dart';
import '../utils/toasts.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
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

  bool loginPasswordVisibility = false;

  bool _value = false;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        child: Padding(
          padding: EdgeInsets.all(20.0 * factor),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20 * factor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 20 * factor,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20 * factor,
                ),
                Text('Get Started',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w500,
                        fontSize: 29 * factor,
                        color: const Color(0xff0D3E73))),
                SizedBox(
                  height: 20 * factor,
                ),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/user-login'),
                  child: Text('Already have an account? Sign In',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w400,
                          fontSize: 14 * factor,
                          color: const Color(0xff0D3E73))),
                ),
                SizedBox(
                  height: 30 * factor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('First Name',
                        textAlign: TextAlign.start,
                        style: ConstantTheme().defaultStyle),
                  ],
                ),
                SizedBox(
                  height: 10 * factor,
                ),
                Form(
                  key: _formKey1,
                  child: BlackOutlineInput(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    controller: firstNameController,
                  ),
                ),
                SizedBox(
                  height: 20 * factor,
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
                      return null;
                    },
                    controller: lastNameController,
                  ),
                ),
                SizedBox(
                  height: 20 * factor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Phone Number',
                        textAlign: TextAlign.start,
                        style: ConstantTheme().defaultStyle),
                  ],
                ),
                SizedBox(
                  height: 10 * factor,
                ),
                Form(
                  key: _formKey3,
                  child: BlackOutlineInput(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    controller: phoneController,
                  ),
                ),
                SizedBox(
                  height: 20 * factor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Email Address',
                        textAlign: TextAlign.start,
                        style: ConstantTheme().defaultStyle),
                  ],
                ),
                SizedBox(
                  height: 10 * factor,
                ),
                Form(
                  key: _formKey4,
                  child: BlackOutlineInput(
                    validator: tools.Validators.validateEmail,
                    controller: emailController,
                  ),
                ),
                SizedBox(
                  height: 20 * factor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Nationality',
                        textAlign: TextAlign.start,
                        style: ConstantTheme().defaultStyle),
                  ],
                ),
                SizedBox(
                  height: 10 * factor,
                ),
                Form(
                  key: _formKey5,
                  child: OutlineInput(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    controller: nationalityController,
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      showCountryPicker(
                        context: context,
                        showPhoneCode: false,

                        countryListTheme: CountryListThemeData(
                          flagSize: 25 * factor,
                          backgroundColor: Colors.white,
                          textStyle: ConstantTheme().defaultStyle,
                          bottomSheetHeight: 500 *
                              factor, // Optional. Country list modal height
                          //Optional. Sets the border radius for the bottomsheet.
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0 * factor),
                            topRight: Radius.circular(10.0 * factor),
                          ),
                          //Optional. Styles the search field.
                          inputDecoration: InputDecoration(
                            labelText: 'Search',
                            hintText: 'Start typing to search',
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color(0xFF8C98A8).withOpacity(0.2),
                              ),
                            ),
                          ),
                        ), // optional. Shows phone code before the country name.
                        onSelect: (Country country) {
                          setState(() {
                            nationalityController.text = country.name;
                          });
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20 * factor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Gender',
                        textAlign: TextAlign.start,
                        style: ConstantTheme().defaultStyle),
                  ],
                ),
                SizedBox(
                  height: 10 * factor,
                ),
                Form(
                  key: _formKey6,
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
                SizedBox(
                  height: 20 * factor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Password',
                        textAlign: TextAlign.start,
                        style: ConstantTheme().defaultStyle),
                  ],
                ),
                SizedBox(
                  height: 10 * factor,
                ),
                Form(
                  key: _formKey7,
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
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(12 * factor)),
                          borderSide: const BorderSide(
                            color: Color(0xffC4C4C5),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(12 * factor)),
                          borderSide: const BorderSide(
                            color: Color(0xffC4C4C5),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(12 * factor)),
                          borderSide: const BorderSide(
                            color: Color(0xffC4C4C5),
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(12 * factor)),
                          borderSide: const BorderSide(
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
                            size: 22 * factor,
                          ),
                        ),
                      )),
                ),
                SizedBox(
                  height: 30 * factor,
                ),
                Row(
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
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * .70,
                        child: RichText(
                            text: TextSpan(
                                text:
                                    'By clicking this, this , you have agreed to our',
                                style: GoogleFonts.urbanist(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14 * factor,
                                    color: Colors.black),
                                children: [
                              TextSpan(
                                  text: '  terms',
                                  style: GoogleFonts.urbanist(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14 * factor,
                                      color: const Color(0xff2781E1))),
                              TextSpan(
                                  text: '  and   ',
                                  style: GoogleFonts.urbanist(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14 * factor,
                                  )),
                              TextSpan(
                                  text: 'conditions',
                                  style: GoogleFonts.urbanist(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14 * factor,
                                      color: const Color(0xff2781E1)))
                            ])),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30 * factor,
                ),
                Button(
                  text: 'Create Account',
                  onTap: () async {
                    bool isFormValid = _formKey1.currentState!.validate() &&
                        _formKey2.currentState!.validate() &&
                        _formKey3.currentState!.validate() &&
                        _formKey4.currentState!.validate() &&
                        _formKey5.currentState!.validate() &&
                        _formKey6.currentState!.validate() &&
                        _formKey7.currentState!.validate();

                    if (!isFormValid) {
                      setState(() {
                        _formKey1.currentState!.validate();
                        _formKey2.currentState!.validate();
                        _formKey3.currentState!.validate();
                        _formKey4.currentState!.validate();
                        _formKey5.currentState!.validate();
                        _formKey6.currentState!.validate();
                        _formKey7.currentState!.validate();
                      });
                    } else {
                      registerUser(
                              firstNameController.text,
                              lastNameController.text,
                              phoneController.text,
                              emailController.text,
                              nationalityController.text,
                              genderController.text,
                              passwordController.text)
                          .then((response) {
                        if (response is num) {
                          showSnackBar(context,
                              "Something happened. Try again later [$response]");
                        } else {
                          if (response['success']) {
                            showSuccessSnackBar(
                                context, "Registration success");
                            Future.delayed(const Duration(seconds: 2), () {
                              Navigator.pushReplacementNamed(
                                  context, '/user-login');
                            });
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

registerUser(String firstName, String lastName, String phoneNumber,
    String email, String nationality, String gender, String password) {
  final response = ApiClient.auths().authPost('register-user', {
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "password": password,
    "phone_number": phoneNumber,
    "nationality": nationality,
    "gender": gender
  });
  return response;
}
