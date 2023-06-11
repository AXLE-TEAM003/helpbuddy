import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/user/payment/card_details.dart';

class MakePayments extends StatelessWidget {
  const MakePayments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: null,
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Make Payment',
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 3, 6, 150),
                  fontSize: 22,
                )),
            const SizedBox(
              height: 10,
            ),
            Text('Select your means of payment to proceed',
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 107, 107, 107),
                  fontSize: 14,
                )),
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
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
              height: 30,
            ),
            paymentCard('Debit Card', Icons.credit_card, () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CardDetails()));
            }),
            paymentCard('PayPal', Icons.paypal, null),
            paymentCard('Bank Account', Icons.account_balance,
                () => bankModal(context)),
            paymentCard('Top Up Account', Icons.account_balance, null),
          ],
        ),
      ),
    ));
  }

  Widget paymentCard(String item, IconData icon, Function()? ontap) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 7),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
        width: double.maxFinite,
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 233, 233, 233)),
            borderRadius: BorderRadius.circular(4),
            color: Colors.transparent),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(
              width: 18,
            ),
            Text(item,
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 66, 66, 66),
                  fontSize: 14,
                )),
            Expanded(child: Container()),
            const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
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
        return Container(
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
                        margin: EdgeInsets.only(top: 8),
                        width: 70,
                        height: 4,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      SizedBox(
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
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
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
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text('Bank',
                    style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 68, 68, 68),
                      fontSize: 12,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Bank name',
                    hintStyle: GoogleFonts.roboto(letterSpacing: 2.0),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(12.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text('Account Number',
                    style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 68, 68, 68),
                      fontSize: 12,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Account number',
                    hintStyle: GoogleFonts.roboto(letterSpacing: 2.0),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(12.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text('Password/PIN',
                    style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 68, 68, 68),
                      fontSize: 12,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '****',
                    hintStyle: GoogleFonts.roboto(letterSpacing: 2.0),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(12.0)),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xff2781E1)),
                child: Center(
                  child: Text('Make Payment',
                      style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 15,
                      )),
                ),
              ),
            ],
          ),
        );
      });
}
