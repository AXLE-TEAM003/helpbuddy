import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:helpbuddy/admin/home/side_bar.dart';
import 'package:helpbuddy/constants/dimensions.dart';
import 'package:helpbuddy/exit_confirmation/exit_confirmation.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../api_client/api_client.dart';
import '../../mymodels/myusermodels.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  UserInfo? userInfo;

  @override
  void initState() {
    super.initState();
    getAdminInfo(widget.token).then((response) {
      setState(() {
        userInfo = UserInfo.fromJson(response);
      });
    });
  }

  Future<bool> _onBackPressed() async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) => const ExitConfirmationDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: userInfo == null
          ? const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Scaffold(
              key: _scaffoldKey,

              drawer: AdminRightNavBar(
                token: widget.token,
                uid: userInfo!.info.id,
                userInfo: userInfo!,
              ), //Drawer,
              body: SafeArea(
                child: Container(
                  padding: EdgeInsets.all(20.0 * factor),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  _scaffoldKey.currentState?.openDrawer();
                                },
                                child: const Icon(MdiIcons.reorderHorizontal)),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/admin/notification',
                                        arguments: {'token': widget.token});
                                  },
                                  child: Container(
                                    height: 40 * factor,
                                    width: 40 * factor,
                                    decoration: BoxDecoration(
                                        color: const Color(0xffF6F6F6),
                                        borderRadius:
                                            BorderRadius.circular(20 * factor)),
                                    child: const Icon(
                                        Icons.notifications_outlined),
                                  ),
                                ),
                                SizedBox(
                                  width: 10 * factor,
                                ),
                                InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/admin/profile',
                                          arguments: {'info': userInfo});
                                    },
                                    child: Image.asset(
                                        'assets/images/Account Owner.png'))
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30 * factor,
                        ),
                        Container(
                          height: 75 * factor,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5 * factor),
                              color: const Color(0xff3A3A3A)),
                          child: Padding(
                            padding: EdgeInsets.all(8.0 * factor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text('Hello  ${userInfo!.info.firstName}',
                                        style: GoogleFonts.urbanist(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 24 * factor,
                                            color: Colors.white)),
                                    SizedBox(width: 5 * factor),
                                    Image.asset(
                                        'assets/images/🦆 emoji _waving hand sign_.png')
                                  ],
                                ),
                                SizedBox(
                                  height: 10 * factor,
                                ),
                                Text('What would you like to do today?',
                                    style: GoogleFonts.urbanist(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12 * factor,
                                        color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30 * factor,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/admin/project-requests',
                                    arguments: {
                                      'token': widget.token,
                                      'uid': userInfo!.info.id
                                    });
                              },
                              child: DashboardCard(
                                  color: const Color(0xffEDF9E7),
                                  firstText: 'View ',
                                  imagePath:
                                      'assets/admin_assets/istockphoto-1365197728-612x612 1.png',
                                  secondText: 'Requests'),
                            )),
                            SizedBox(
                              width: 10 * factor,
                            ),
                            Expanded(
                                child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/admin/history',
                                    arguments: {'token': widget.token});
                              },
                              child: DashboardCard(
                                  color: const Color(0xffFFEBEB),
                                  firstText: 'View',
                                  imagePath:
                                      'assets/admin_assets/vn5V8p8lWd-removebg-preview.png',
                                  secondText: 'History'),
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 10 * factor,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/admin/reviews');
                              },
                              child: DashboardCard(
                                  color: const Color(0xffE7F7F8),
                                  firstText: '',
                                  imagePath:
                                      'assets/admin_assets/five-star-feedback-vector-customer-review-concepts-reviews-stars-with-good-bad-rate-text-3d-web-vector-illustrations_574175-197-removebg-preview 1.png',
                                  secondText: 'Reviews'),
                            )),
                            SizedBox(
                              width: 10 * factor,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/admin/more',
                                      arguments: {
                                        'token': widget.token,
                                        'info': userInfo
                                      });
                                },
                                child: DashboardCard(
                                    color: const Color(0xffE0D9F7),
                                    firstText: 'View',
                                    imagePath: 'assets/images/Group 2494.png',
                                    secondText: 'More'),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10 * factor,
                        ),
                        Image.asset(
                          'assets/images/Rectangle 24.png',
                          width: MediaQuery.of(context).size.width,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  DashboardCard(
      {Key? key,
      required this.color,
      required this.firstText,
      required this.imagePath,
      required this.secondText})
      : super(key: key);
  Color color;
  String imagePath;
  String firstText;
  String secondText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170 * factor,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(20 * factor)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 81 * factor, child: Image.asset(imagePath)),
          SizedBox(
            height: 15 * factor,
          ),
          Text(firstText,
              style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w800,
                fontSize: 14 * factor,
              )),
          Text(secondText,
              style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w800,
                fontSize: 14 * factor,
              ))
        ],
      ),
    );
  }
}

getAdminInfo(String token) {
  final response = ApiClient(authToken: token).get('info');
  return response;
}
