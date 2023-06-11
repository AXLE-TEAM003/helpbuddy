import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/utils/constant/theme.dart';
import 'package:helpbuddy/widget/button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SuperAdminNotification extends StatefulWidget {
  const SuperAdminNotification({Key? key}) : super(key: key);

  @override
  State<SuperAdminNotification> createState() => _SuperAdminNotificationState();
}

class _SuperAdminNotificationState extends State<SuperAdminNotification> {
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
        title: Text('Notification', style: ConstantTheme().bigBlueStyle),
        centerTitle: true,
      ),
      body: Column(
        children: [
          InkWell(
              onTap: () {
                bottomModal(context);
              },
              child: RequestCard()),
          InkWell(
              onTap: () {
                bottomModal(context);
              },
              child: RequestCard()),
          InkWell(
              onTap: () {
                bottomModal(context);
              },
              child: RequestCard()),
          InkWell(
              onTap: () {
                bottomModal(context);
              },
              child: RequestCard()),
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
      padding: const EdgeInsets.only(right: 20, top: 8, bottom: 8),
      child: SizedBox(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                    width: 2.5, height: 90, color: const Color(0xff0D3E73)),
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
                    Text('We have 85 new messages today',
                        style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Color.fromARGB(255, 71, 71, 71))),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('05, Jan 2023, 9:08AM',
                        style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w600,
                            fontSize: 11,
                            color: const Color(0xff686868))),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
