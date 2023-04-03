import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/widget/input/outlineInput.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Withdrawal extends StatefulWidget {
  const Withdrawal({Key? key}) : super(key: key);

  @override
  State<Withdrawal> createState() => _WithdrawalState();
}

class _WithdrawalState extends State<Withdrawal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text('Make Withdrawal',
                textAlign: TextAlign.left,
                style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w500,
                    fontSize: 29,
                    color: const Color(0xff0D3E73))),
            const SizedBox(
              height: 20,
            ),
            Text('Select your means of withdrawal to proceed',
                textAlign: TextAlign.left,
                style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.black)),
            const SizedBox(
              height: 20,
            ),
            BlackOutlineInput(),
            const Card(),
            const SizedBox(
              height: 20,
            ),
            const Card()
          ],
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
          color: Colors.white, border: Border.all(color: const Color(0xfff1f1f1))),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(color: Color(0xffF2F2F2)),
                  child: const Icon(MdiIcons.bank, size: 15),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text('Bank Account',
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.black)),
              ],
            ),
            const Icon(Icons.arrow_forward_ios, size: 16)
          ],
        ),
      ),
    );
  }
}
