import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangeDate extends StatelessWidget {
  const ChangeDate({super.key});

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
          title: Text('Change Delivery Date',
              style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black)),
          centerTitle: true,
        ),
        body: Container());
  }
}
