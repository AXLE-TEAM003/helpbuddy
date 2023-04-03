import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:helpbuddy/admin/admin_state.dart';

import 'package:helpbuddy/onboarding/splashscreen.dart';
import 'package:helpbuddy/user/payment/bank_state.dart';
import 'package:helpbuddy/user/state/user_state.dart';
import 'package:provider/provider.dart';




void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserState>(
          create: (BuildContext context) => UserState(),
        ),

        ChangeNotifierProvider<BankState>(
          create: (BuildContext context) => BankState(),
        ),

        ChangeNotifierProvider<AdminState>(
          create: (BuildContext context) => AdminState(),
        ),
      

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
        
          primarySwatch: Colors.blue,
        ),
        home:const Splashscreen(),
      ),
    );
  }
}


