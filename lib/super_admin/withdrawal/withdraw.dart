import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/constants/dimensions.dart';
import 'package:helpbuddy/widget/input/outlineInput.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Withdrawal extends StatefulWidget {
  const Withdrawal({Key? key}) : super(key: key);

  @override
  State<Withdrawal> createState() => _WithdrawalState();
}

class _WithdrawalState extends State<Withdrawal> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0 * factor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20 * factor,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.all(8.0 * factor),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 18 * factor,
                ),
              ),
            ),
            SizedBox(
              height: 10 * factor,
            ),
            Text('Make Withdrawal',
                textAlign: TextAlign.left,
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 3, 6, 150),
                  fontSize: 22 * factor,
                )),
            SizedBox(
              height: 20 * factor,
            ),
            Text('Select your means of withdrawal to proceed',
                textAlign: TextAlign.left,
                style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w400,
                    fontSize: 14 * factor,
                    color: Colors.black)),
            SizedBox(
              height: 20 * factor,
            ),
            TextFormField(
              controller: controller,
              autofocus: true,
              onTap: () {},
              obscureText: false,

              maxLines: 1,

              decoration: const InputDecoration(
                hintText: 'Enter Amount',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                    color: Color(0xffB5B5B5),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                    color: Color(0xffB5B5B5),
                  ),
                ),
              ),
              //  style: FlutterFlowTheme.of(context).bodyText1,
            ),
            SizedBox(
              height: 20 * factor,
            ),
            InkWell(
              onTap: () => Navigator.pushNamed(
                  context, '/super-admin/withdrawal/add-bank-account'),
              child: const Card(
                title: 'Bank Account',
                icon: MdiIcons.bank,
              ),
            ),
            SizedBox(
              height: 20 * factor,
            ),
            InkWell(
              onTap: () {},
              child: const Card(
                title: 'PayPal',
                icon: Icons.paypal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card({Key? key, required this.title, required this.icon})
      : super(key: key);
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65 * factor,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xfff1f1f1))),
      child: Padding(
        padding: EdgeInsets.all(10.0 * factor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 30 * factor,
                  width: 30 * factor,
                  decoration: const BoxDecoration(color: Color(0xffF2F2F2)),
                  child: Icon(icon /* MdiIcons.bank */, size: 15),
                ),
                SizedBox(
                  width: 20 * factor,
                ),
                Text(title,
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w400,
                        fontSize: 16 * factor,
                        color: Colors.black)),
              ],
            ),
            Icon(Icons.arrow_forward_ios, size: 16 * factor)
          ],
        ),
      ),
    );
  }
}
