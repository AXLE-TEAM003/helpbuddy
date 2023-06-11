import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/utils/constant/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../api_client/api_client.dart';
import '../../mymodels/myusermodels.dart';

class UserNotification extends StatefulWidget {
  const UserNotification({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  State<UserNotification> createState() => _UserNotificationState();
}

class _UserNotificationState extends State<UserNotification> {
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
            size: 16,
          ),
        ),
        title: Text('Notification', style: ConstantTheme().bigBlueStyle),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : notifications.isEmpty
              ? const Center(
                  child: Text('No notifications found'),
                )
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
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({Key? key, required this.item}) : super(key: key);
  final Notifications item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 5, bottom: 5),
      child: SizedBox(
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
                        Text('Acceptance notice',
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
                    Text(item.createdAt,
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

Future<List<dynamic>> fetchNotifications(String token) async {
  final response = await ApiClient(authToken: token).get('notifications');
  return response;
}
