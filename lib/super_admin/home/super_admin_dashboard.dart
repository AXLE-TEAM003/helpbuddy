import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/constants/dimensions.dart';
import 'package:helpbuddy/exit_confirmation/exit_confirmation.dart';
import 'package:helpbuddy/super_admin/home/side_bar.dart';
import 'package:helpbuddy/widget/button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../api_client/api_client.dart';
import '../../mymodels/myusermodels.dart';

class SuperAdminDashboard extends StatefulWidget {
  const SuperAdminDashboard({Key? key, required this.token}) : super(key: key);
  final String token;
  @override
  State<SuperAdminDashboard> createState() => _SuperAdminDashboardState();
}

class _SuperAdminDashboardState extends State<SuperAdminDashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  UserInfo? userInfo;

  @override
  void initState() {
    super.initState();
    getSuperAdminInfo(widget.token).then((response) {
      setState(() {
        userInfo = UserInfo.fromJson(response);
      });
    });
  }

  getSuperAdminInfo(String token) {
    final response = ApiClient(authToken: token).get('info');
    return response;
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

              drawer: RightNavBar(
                userInfo: userInfo!,
                token: widget.token,
              ), //Drawer,
              body: Container(
                padding: EdgeInsets.all(20.0 * factor),
                child: SingleChildScrollView(
                  child: SafeArea(
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
                                        context, '/super-admin/notification',
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
                                          context, '/super-admin/more',
                                          arguments: {
                                            'token': widget.token,
                                            'info': userInfo
                                          });
                                    },
                                    child: Image.asset(
                                        'assets/images/Account Owner.png'))
                              ],
                            )
                          ],
                        ),
                        Container(
                          height: 75 * factor,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5 * factor),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text('Hello ${userInfo!.info.firstName}',
                                      style: GoogleFonts.urbanist(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 24 * factor,
                                          color: Colors.black)),
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
                                      color: Colors.black))
                            ],
                          ),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: 143 * factor,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(20 * factor),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    'assets/admin_assets/Frame 44.png',
                                  ),
                                  fit: BoxFit.cover,
                                )),
                            child: Padding(
                              padding: EdgeInsets.all(20.0 * factor),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(userInfo!.info.firstName,
                                          style: GoogleFonts.urbanist(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14 * factor,
                                              color: Colors.white)),
                                      // Amount to be entered here ...
                                      Text(
                                          '${userInfo!.funds.totalBalance} twgo',
                                          style: GoogleFonts.urbanist(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 24 * factor,
                                              color: Colors.white)),
                                      SizedBox(
                                        height: 15 * factor,
                                      ),
                                      SizedBox(
                                          height: 30 * factor,
                                          width: 100 * factor,
                                          child: WhiteButton(
                                            text: 'Withdraw',
                                            onTap: () {
                                              Navigator.pushNamed(context,
                                                  '/super-admin/withdrawal');
                                            },
                                          ))
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                          height: 30 * factor,
                                          width: 150 * factor,
                                          child: WhiteButton(
                                            text: 'Share referral link ',
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, '/referral-link');
                                            },
                                          ))
                                    ],
                                  )
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 30 * factor,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/super-admin/stats');
                              },
                              child: DashboardCard(
                                  color: const Color(0xffEDF9E7),
                                  firstText: 'View ',
                                  imagePath:
                                      'assets/images/FreeVector-3D-Charts-Graphics-removebg-preview 1.png',
                                  secondText: 'Admin Stats'),
                            )),
                            SizedBox(
                              width: 10 * factor,
                            ),
                            Expanded(
                                child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/super-admin/user-stats');
                              },
                              child: DashboardCard(
                                  color: const Color(0xffFFEBEB),
                                  firstText: 'View',
                                  imagePath:
                                      'assets/images/3d-statistics-graphic-icon-analytics-chart-vector-removebg-preview 1.png',
                                  secondText: 'User Stats'),
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
                                Navigator.pushNamed(
                                    context, '/super-admin/all-stats');
                              },
                              child: DashboardCard(
                                  color: const Color(0xffE7F7F8),
                                  firstText: 'View',
                                  imagePath:
                                      'assets/images/statistics-report-6377850-5283610-removebg-preview 1.png',
                                  secondText: 'All Stats'),
                            )),
                            SizedBox(
                              width: 10 * factor,
                            ),
                            Expanded(
                                child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/super-admin/more', arguments: {
                                  'token': widget.token,
                                  'info': userInfo
                                });
                              },
                              child: DashboardCard(
                                  color: const Color(0xffE0D9F7),
                                  firstText: 'View',
                                  imagePath: 'assets/images/Group 2494.png',
                                  secondText: 'More'),
                            ))
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

void withdrawBalanceModal(BuildContext context) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40 * factor),
            topRight: Radius.circular(40 * factor)),
      ),
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(left: 30 * factor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: Container()),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 15.0 * factor, right: 15.0 * factor),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.clear_rounded,
                          size: 30 * factor,
                        )),
                  )
                ],
              ),
              balanceLabels('Your Total balance:', '£1000'),
              balanceLabels('Amount Deposited:', '£750'),
              balanceLabels('Referral Bonus:', '£250'),
              Text('*Note that 1twgo = £20',
                  style: GoogleFonts.urbanist(
                    fontSize: 14 * factor,
                    color: const Color.fromARGB(255, 129, 129, 129),
                    fontWeight: FontWeight.w600,
                  )),
              Expanded(child: Container()),
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 8 * factor, horizontal: 12 * factor),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12 * factor),
                          color: const Color(0xff2781E1)),
                      child: Center(
                        child: Text('Withdraw balance',
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 14 * factor,
                            )),
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 8 * factor, horizontal: 12 * factor),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12 * factor),
                          border: Border.all(
                              color: const Color.fromARGB(255, 37, 37, 37),
                              width: 1.2 * factor)
                          // color: const Color(0xff2781E1)
                          ),
                      child: Center(
                        child: Text('View history',
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w400,
                              color: const Color.fromARGB(255, 37, 37, 37),
                              // color: Colors.white,
                              fontSize: 14 * factor,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30 * factor,
                  )
                ],
              ),
              SizedBox(
                height: 20 * factor,
              )
            ],
          ),
        );
      });
}

Widget balanceLabels(String label, String balance) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: GoogleFonts.urbanist(
          fontSize: 16 * factor,
          fontWeight: FontWeight.w600,
        ),
      ),
      SizedBox(
        height: 4 * factor,
      ),
      Text(balance,
          style: TextStyle(
              fontSize: 32 * factor,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 85, 85, 85))),
      SizedBox(
        height: 12 * factor,
      )
    ],
  );
}
