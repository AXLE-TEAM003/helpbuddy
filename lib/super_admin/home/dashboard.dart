import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/super_admin/home/side_bar.dart';
import 'package:helpbuddy/super_admin/notification/notification.dart';
import 'package:helpbuddy/super_admin/stat/admin_stat.dart';
import 'package:helpbuddy/super_admin/stat/project_stat.dart';
import 'package:helpbuddy/super_admin/stat/user_stat.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Dahboard extends StatefulWidget {
  const Dahboard({Key? key}) : super(key: key);

  @override
  State<Dahboard> createState() => _DahboardState();
}

class _DahboardState extends State<Dahboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      drawer: const RightNavBar(), //Drawer,
      body: Container(
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
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const SuperAdminNotification()));
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: const Color(0xffF6F6F6),
                                borderRadius: BorderRadius.circular(20)),
                            child: const Icon(Icons.notifications_outlined),
                          ),
                        ),
                        Image.asset('assets/images/Account Owner.png')
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 75,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xff3A3A3A)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text('Hello Oreoluwa',
                                style: GoogleFonts.urbanist(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                    color: Colors.white)),

                                    
                                  const SizedBox(width: 5),

                                  Image.asset('assets/images/🦆 emoji _waving hand sign_.png')
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('What would you like to do today?',
                            style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.white))
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => const AdminStat()));
                      },
                      child: DashboardCard(
                          color: const Color(0xffEDF9E7),
                          firstText: 'View ',
                          imagePath:
                              'assets/images/FreeVector-3D-Charts-Graphics-removebg-preview 1.png',
                          secondText: 'Admin Stats'),
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
                                builder: (BuildContext context) => const UserStat()));
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
                                builder: (BuildContext context) => const ProjectStat()));
                      },
                      child: DashboardCard(
                          color: const Color(0xffE7F7F8),
                          firstText: 'View',
                          imagePath:
                              'assets/images/statistics-report-6377850-5283610-removebg-preview 1.png',
                          secondText: 'project Stats'),
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
