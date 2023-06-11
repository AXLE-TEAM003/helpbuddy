import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/utils/constant/theme.dart';
import 'package:helpbuddy/widget/button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../api_client/api_client.dart';
import '../../mymodels/myusermodels.dart';

class AdminNotification extends StatefulWidget {
  const AdminNotification({Key? key, required this.token}) : super(key: key);
  final String token;
  @override
  State<AdminNotification> createState() => _AdminNotificationState();
}

class _AdminNotificationState extends State<AdminNotification> {
  List<Notifications> notifications = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchNotifications(widget.token).then((response) {
      setState(() {
        notifications =
            response.map((json) => Notifications.fromJson(json)).toList();
        isLoading = false;
      });
    }).catchError((error) {
      setState(() {
        isLoading = false;
      });
      // Handle the error here, e.g., show an error message
      print('Error fetching projects: $error');
    });
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
            size: 14,
          ),
        ),
        title: Text('Notification', style: ConstantTheme().bigBlueStyle),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.only(top: 20),
              itemCount: notifications.length,
              itemBuilder: (BuildContext context, int index) {
                return NotificationCard(
                  item: notifications[index],
                );
              },
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

class NotificationCard extends StatelessWidget {
  NotificationCard({Key? key, required this.item}) : super(key: key);
  final Notifications item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 5, bottom: 5),
      child: SizedBox(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                        Text('Support',
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(item.details,
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: const Color(0xff686868))),
                    ),
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
              decoration: BoxDecoration(
                  color: Color.fromARGB(92, 217, 221, 255),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('View',
                        style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Color.fromARGB(255, 6, 3, 158))),
                    Text('Message',
                        style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Color.fromARGB(255, 6, 3, 158))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<List<dynamic>> fetchNotifications(String token) async {
  final response = await ApiClient(authToken: token).get('notifications');
  return response;
}
