import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:helpbuddy/admin/Request/request_history.dart';
import 'package:helpbuddy/admin/home/side_bar.dart';
import 'package:helpbuddy/super_admin/stat/project_stat.dart';
import 'package:helpbuddy/user/chat/models/user_model.dart';
import 'package:helpbuddy/user/state/user_state.dart';
import 'package:helpbuddy/widget/button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  UserModel? userModel;

  @override
  void initState() {
    UserState state = Provider.of<UserState>(context, listen: false);
    userModel = state.userDetails;
    debugPrint(userModel!.amount.toString());
    print('yes');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      drawer: const AdminRightNavBar(), //Drawer,
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
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
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: const Color(0xffF6F6F6),
                                borderRadius: BorderRadius.circular(20)),
                            child: const Icon(Icons.notifications_outlined),
                          ),
                          Image.asset('assets/images/Account Owner.png')
                        ],
                      )
                    ],
                  ),
                  Container(
                    height: 75,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(userModel!.firstName.toString(),
                                style: GoogleFonts.urbanist(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                    color: Colors.black)),
                            const SizedBox(width: 5),
                            Image.asset(
                                'assets/images/🦆 emoji _waving hand sign_.png')
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('What would you like to do today?',
                            style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.black))
                      ],
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 143,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            image: AssetImage(
                              'assets/admin_assets/Frame 44.png',
                            ),
                            fit: BoxFit.cover,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(userModel!.firstName.toString(),
                                    style: GoogleFonts.urbanist(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Colors.white)),
                                Text(userModel!.amount.toString(),
                                    style: GoogleFonts.urbanist(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24,
                                        color: Colors.white)),
                                const SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                    height: 30,
                                    width: 100,
                                    child: WhiteButton(text: 'Withdraw'))
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                    height: 30,
                                    width: 150,
                                    child: WhiteButton(
                                        text: 'Share referral link '))
                              ],
                            )
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (BuildContext context) =>
                          //             const ProjectRequests()));
                        },
                        child: DashboardCard(
                            color: const Color(0xffEDF9E7),
                            firstText: 'View ',
                            imagePath:
                                'assets/admin_assets/istockphoto-1365197728-612x612 1.png',
                            secondText: 'Requests'),
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const RequestHistory()));
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
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const ProjectStat()));
                        },
                        child: DashboardCard(
                            color: const Color(0xffE7F7F8),
                            firstText: '',
                            imagePath:
                                'assets/admin_assets/five-star-feedback-vector-customer-review-concepts-reviews-stars-with-good-bad-rate-text-3d-web-vector-illustrations_574175-197-removebg-preview 1.png',
                            secondText: 'Reviews'),
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: DashboardCard(
                              color: const Color(0xffE0D9F7),
                              firstText: 'View',
                              imagePath: 'assets/images/Group 2494.png',
                              secondText: 'More'))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
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
      height: 170,
      width: MediaQuery.of(context).size.width,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 81, child: Image.asset(imagePath)),
          const SizedBox(
            height: 15,
          ),
          Text(firstText,
              style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w800,
                fontSize: 14,
              )),
          Text(secondText,
              style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w800,
                fontSize: 14,
              ))
        ],
      ),
    );
  }
}
