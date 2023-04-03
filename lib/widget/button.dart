import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  Button({Key? key, required this.text, this.onTap, this.height})
      : super(key: key);
  String text;
  double? height;

  var onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 55,
        decoration: BoxDecoration(
            color: const Color(0xff2781E1),
            borderRadius: BorderRadius.circular(12)),
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text(text,
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontSize: 14,
              )),
        ),
      ),
    );
  }
}

class BlackButton extends StatelessWidget {
  BlackButton({Key? key, required this.text, this.onTap}) : super(key: key);
  String text;

  var onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(12)),
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text(text,
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontSize: 14,
              )),
        ),
      ),
    );
  }
}

class SecondButton extends StatelessWidget {
  SecondButton({Key? key, required this.text, this.onTap}) : super(key: key);
  String text;

  var onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(
              color: const Color(0xff2781E1),
            )),
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text(text,
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w400,
                color: const Color(0xff2781E1),
                fontSize: 14,
              )),
        ),
      ),
    );
  }
}

class WhiteButton extends StatelessWidget {
  WhiteButton({Key? key, required this.text, this.onTap}) : super(key: key);
  String text;

  var onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        //height: 20,

        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(7)),
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text(text,
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontSize: 14,
              )),
        ),
      ),
    );
  }
}
