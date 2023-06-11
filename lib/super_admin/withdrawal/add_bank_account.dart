import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/constants/dimensions.dart';

class AddBankAccount extends StatefulWidget {
  const AddBankAccount({Key? key}) : super(key: key);

  @override
  State<AddBankAccount> createState() => _AddBankAccountState();
}

class _AddBankAccountState extends State<AddBankAccount> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0 * factor),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
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
                Text('Add Bank Account',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 3, 6, 150),
                      fontSize: 22 * factor,
                    )),
                SizedBox(
                  height: 20 * factor,
                ),
                Text('Add new account to proceed',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w400,
                        fontSize: 14 * factor,
                        color: Colors.black)),
                SizedBox(
                  height: 20 * factor,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[500] ?? Colors.black,
                            blurRadius: 2.0)
                      ]),
                  child: Row(
                    children: [
                      Text('Amount',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w400,
                              fontSize: 13 * factor,
                              color: const Color.fromARGB(255, 73, 73, 73))),
                      Expanded(child: Container()),
                      Text('£300',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w600,
                              fontSize: 14 * factor,
                              color: Colors.black)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20 * factor,
                ),
                Text('Bank',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w400,
                        fontSize: 14 * factor,
                        color: Colors.black)),
                SizedBox(
                  height: 12 * factor,
                ),
                TextFormField(
                  controller: controller,
                  autofocus: true,
                  onTap: () {},
                  obscureText: false,

                  maxLines: 1,

                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.keyboard_arrow_down),
                    hintText: 'City Bank',
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
                Text('Account Number',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w400,
                        fontSize: 14 * factor,
                        color: Colors.black)),
                SizedBox(
                  height: 12 * factor,
                ),
                TextFormField(
                  controller: controller,
                  autofocus: true,
                  onTap: () {},
                  obscureText: false,

                  maxLines: 1,

                  decoration: const InputDecoration(
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
                Text('Account name',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w400,
                        fontSize: 14 * factor,
                        color: Colors.black)),
                SizedBox(
                  height: 12 * factor,
                ),
                TextFormField(
                  controller: controller,
                  autofocus: true,
                  onTap: () {},
                  obscureText: false,

                  maxLines: 1,

                  decoration: const InputDecoration(
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
                const Spacer(
                  flex: 2,
                ),
                InkWell(
                  onTap: () => successModal(context),
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.all(18),
                    child: const Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                const Spacer()
              ],
            ),
          ),
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

void successModal(BuildContext context) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40 * factor),
            topRight: Radius.circular(40 * factor)),
      ),
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset('assets/icons/done.png'),
            const SizedBox(
              height: 8,
            ),
            Text('Account setup is successful !!!',
                style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w400,
                    fontSize: 14 * factor,
                    color: Colors.black)),
            const Spacer(),
            InkWell(
              onTap: () => bankModal(context),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15)),
                padding: const EdgeInsets.all(18),
                child: const Center(
                  child: Text(
                    'Continue',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        );
      });
}

void bankModal(BuildContext context) {
  showModalBottomSheet(
      // isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: Wrap(
            runAlignment: WrapAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        width: 70,
                        height: 4,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('Bank Account',
                          style: GoogleFonts.plusJakartaSans(
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 3, 6, 150),
                            fontSize: 18,
                          )),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff2781E1)),
                    borderRadius: BorderRadius.circular(4),
                    color: const Color.fromARGB(29, 39, 129, 225)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Amount',
                        style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff2781E1),
                          fontSize: 15,
                        )),
                    Text('£20.00',
                        style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff2781E1),
                          fontSize: 15,
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text('Account detals',
                    style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 68, 68, 68),
                      fontSize: 12,
                    )),
              ),
              const SizedBox(
                height: 4,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    // border: Border.all(color: const Color(0xff2781E1)),
                    borderRadius: BorderRadius.circular(4),
                    color: const Color.fromARGB(29, 39, 129, 225)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Account name',
                        style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 129, 129, 129),
                          fontSize: 12,
                        )),
                    const SizedBox(
                      height: 8,
                    ),
                    Text('ABC',
                        style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff2781E1),
                          fontSize: 12,
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    // border: Border.all(color: const Color(0xff2781E1)),
                    borderRadius: BorderRadius.circular(4),
                    color: const Color.fromARGB(29, 39, 129, 225)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Account number',
                        style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 129, 129, 129),
                          fontSize: 12,
                        )),
                    const SizedBox(
                      height: 8,
                    ),
                    Text('123',
                        style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff2781E1),
                          fontSize: 12,
                        )),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xff2781E1)),
                child: Center(
                  child: Text('Add new account',
                      style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 15,
                      )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      });
}
