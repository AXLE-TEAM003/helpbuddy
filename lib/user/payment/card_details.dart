import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

 
class CardDetails extends StatefulWidget {
  const CardDetails({super.key});

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  TextEditingController cardNumberController = TextEditingController();
  CardType cardType = CardType.Invalid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 18,
          ),
        ),
        title: Text('Card Details',
            style: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 19, 40, 163),
              fontSize: 16,
            )),
        elevation: 0.5,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 15),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Card Number',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.plusJakartaSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: cardNumberController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(16),
                            CardNumberInputFormatter(),
                          ],
                          decoration: InputDecoration(
                            hintText: '∗∗∗∗ ∗∗∗∗ ∗∗∗∗ ∗∗∗∗',
                            hintStyle: GoogleFonts.roboto(letterSpacing: 2.0),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(12.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(12.0)),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Expiry Date',
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.plusJakartaSans(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(5),
                                    ],
                                    decoration: InputDecoration(
                                      hintText: 'MM/YY',
                                      hintStyle: GoogleFonts.roboto(
                                          letterSpacing: 2.0),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.blue),
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Card Number',
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.plusJakartaSans(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      // Limit the input
                                      LengthLimitingTextInputFormatter(4),
                                    ],
                                    decoration: InputDecoration(
                                      hintText: 'CVV',
                                      hintStyle: GoogleFonts.roboto(
                                          letterSpacing: 2.0),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.blue),
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Card Pin',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(4),
                              ],
                              decoration: InputDecoration(
                                hintText: '∗∗∗∗ ∗∗∗∗ ∗∗∗∗ ∗∗∗∗',
                                hintStyle:
                                    GoogleFonts.roboto(letterSpacing: 2.0),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(12.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(12.0)),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )),
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 18),
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: /* Color(0xff2781E1) */
                      const Color(0xff2781E1).withAlpha(140)),
              child: Center(
                child: Text('Make Payments',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white)),
              ),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}

enum CardType {
  Master,
  Visa,
  Verve,
  Discover,
  AmericanExpress,
  DinersClub,
  Jcb,
  Others,
  Invalid
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
