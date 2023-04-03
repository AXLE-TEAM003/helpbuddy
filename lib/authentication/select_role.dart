import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/admin/home/admin_dashboard.dart';
import 'package:helpbuddy/super_admin/home/dashboard.dart';
import 'package:helpbuddy/user/chat/models/user_model.dart';
import 'package:helpbuddy/user/home/dashboard.dart';
import 'package:helpbuddy/user/state/user_state.dart';
import 'package:helpbuddy/widget/button.dart';
import 'package:provider/provider.dart';

class SelectRole extends StatefulWidget {
  const SelectRole({
    Key? key,
  }) : super(key: key);

  @override
  State<SelectRole> createState() => _SelectRoleState();
}

class _SelectRoleState extends State<SelectRole> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool SelectRolePasswordVisibility = false;
  @override
  UserModel? userModel;
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
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 80,
                            ),
                            Text('Continue as',
                                style: GoogleFonts.urbanist(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 23,
                                )),
                            const SizedBox(
                              height: 40,
                            ),
                            InkWell(
                              onTap: () {
                                
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const UserDashboard()));
                               
                              },
                              child: Button(text: 'User'),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            InkWell(
                                onTap: () {
                                  
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                const AdminDashboard()));
                                 
                                },
                                child: SecondButton(text: 'Admin')),
                            const SizedBox(
                              height: 15,
                            ),
                            SecondButton(
                              text: 'Super Admin',
                              onTap: () {
                                
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const Dahboard()));
                            
                              },
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
