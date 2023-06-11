/* import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/user/payment/banklist_model.dart';
import 'package:helpbuddy/utils/constant/theme.dart';
import 'package:helpbuddy/widget/button.dart';
import 'package:helpbuddy/widget/input/outlineInput.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:http/http.dart' as http;

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final TextEditingController jobRoleCtrl = TextEditingController();
  TextEditingController? amountController;

  Future<List<String>> getFakeRequestData(String query) async {
    List<String> data = ['Developer', 'Designer', 'Consultant', 'Student'];

    return await Future.delayed(const Duration(seconds: 1), () {
      return bankList!.map((BankListModel e) => e.name.toString()).toList().where((String e) {
        return e.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  List<BankListModel>? bankList;
  String apiKey =
      '13b3ea2bb4e398f7f2ec67fa19bd73ada4a11d80d1cdef9445ff550a3a24c85c';

  //bankList

  Future<List<BankListModel>?>? listOfBank() async {
    Uri url = Uri.parse(
        'https://api.chimoney.io/v0.2/info/country-banks?countryCode=NG');
    http.Response response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
    );

    if (response.statusCode == 200) {
      // Request successful, parse response JSON
      var responseData = jsonDecode(response.body);
      bankList = responseData['data']
          .map<BankListModel>((element) => BankListModel.fromJson(element))
          .toList();

      // Do something with bankList
    } else {
      // Request failed, handle error
    }

    return bankList;
  }

  /// This is on text changed method which will display on city text field on changed.
  // void onTextFieldTap() {
  //   DropDownState(
  //     DropDown(
  //       bottomSheetTitle:  Text(
  //         'ddeeed',
  //         style: TextStyle(
  //           fontWeight: FontWeight.bold,
  //           fontSize: 20.0,
  //         ),
  //       ),
  //       submitButtonChild: const Text(
  //         'Done',
  //         style: TextStyle(
  //           fontSize: 16,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //       data: bankList ?? [],
  //       selectedItems: (List<dynamic> selectedList) {
  //         List<String> list = [];
  //         for (var item in selectedList) {
  //           if (item is BankListModel) {
  //             list.add(item.name);
  //           }
  //         }
  //         showSnackBar(list.toString());
  //       },
  //       enableMultipleSelection: true,
  //     ),
  //   ).showModal(context);
  // }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  void initState() {
    listOfBank();
    amountController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
        title: Text('Payment', style: ConstantTheme().bigBlueStyle),
        centerTitle: true,
      ),
      body: Column(
        children: bankList!.isEmpty
            ? []
            : [
                /* SizedBox(
                  height: 60,
                  child: Expanded(
                    child: CustomDropdown.searchRequest(
                      items: bankList!.map((BankListModel e) => e.name.toString()).toList(),
                      futureRequest: getFakeRequestData,
                      hintText: 'Search job role',
                      hintStyle: ConstantTheme().defaultStyle,
                      selectedStyle: ConstantTheme().defaultStyle,
                      errorStyle: ConstantTheme().defaultStyle,
                      listItemStyle: ConstantTheme().defaultStyle,
                      borderSide: const BorderSide(color: Colors.grey),
                      controller: jobRoleCtrl,
                    ),
                  ),
                ), */
                const SizedBox(
                  height: 20,
                ),


                InkWell(
                   onTap: () {
                      
                    }, 
                  
                  child: const Text('frfr')),
                OutlineInput(
                  controller: amountController,
                ),


              ],
      ),
    );
  }

  void bottomModal(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
            height: 300,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 12, right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [Icon(MdiIcons.cancel)],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Your Total Balance : ',
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.black)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text('74343',
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w600,
                              fontSize: 23,
                              color: Colors.black)),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Your Total Balance : ',
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.black)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text('74343',
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w600,
                              fontSize: 23,
                              color: Colors.black)),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Amount Deposited : ',
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.black)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text('Referral Bouns',
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w600,
                              fontSize: 23,
                              color: Colors.black)),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 100,
                          child: Button(
                            text: 'Withdarw balance ',
                            height: 20,
                          )),
                      // Container(
                      //   width: 100,

                      //   child: BlackButton(text: 'View History'))
                    ],
                  )
                ],
              ),
            ));
      },
    );
  }
}

class RequestCard extends StatelessWidget {
  RequestCard({Key? key, this.mainText, this.dateText, this.secText})
      : super(key: key);
  String? mainText;
  String? secText;
  String? dateText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 5, bottom: 5),
      child: SizedBox(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(width: 2.5, height: 90, color: const Color(0xff0D3E73)),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/user_assets/Group 16424 (1).png',
                          height: 30,
                          width: 30,
                        ),
                        Text('Request History',
                            style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.black)),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(MdiIcons.checkDecagram,
                            color: Color(0xff0D3E73), size: 18)
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Request History',
                        style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: const Color(0xff686868))),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('05, Jan 2023, 9:08AM',
                        style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                            color: const Color(0xff686868))),
                  ],
                )
              ],
            ),
            Container(
              decoration: const BoxDecoration(color: Color(0xffD9FFEF)),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text('View Message',
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: const Color(0xff006C3F))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 */