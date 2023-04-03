import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Alert {
  void alert(
    context,
    String? firstText,
    String? secondText,
    String? thirdText,
    var onTap,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) => AlertDialog(
        //   title: const Text("Alert Dialog Box"),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        content: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          height: 72,
          child: Column(
            children: [
              Text(firstText.toString(),
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 16,
                  )),
              const SizedBox(
                height: 8,
              ),
              Text(secondText.toString(),
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 14,
                  )),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Color(0xffE2E2E2),
                thickness: .9,
              )
            ],
          ),
        ),
        actions: <Widget>[
          Center(
            child: TextButton(
              onPressed: (){onTap;},
              child: Container(
                // color: Colors.green,

                child: Text(thirdText.toString(),
                    style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 14,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // two button app bar

  void twoButtonAlert(
      context, double height, String text1, String text2, void function) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) => AlertDialog(
        actionsAlignment: MainAxisAlignment.spaceBetween,
        //   title: const Text("Alert Dialog Box"),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        content: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          height: height,
          child: Column(
            children: [
              Text(text1,
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 16,
                  )),
              const SizedBox(
                height: 8,
              ),
              Text(text2,
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 14,
                  )),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Color(0xffE2E2E2),
                thickness: .9,
              )
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Container(
              // color: Colors.green,

              child: Text('Cancel',
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 14,
                  )),
            ),
          ),
          TextButton(
            onPressed: () {
              function;
            },
            child: Container(
              // color: Colors.green,

              child: Text('Yes Delete',
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w400,
                    color: Colors.red,
                    fontSize: 14,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
