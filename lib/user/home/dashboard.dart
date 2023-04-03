import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/super_admin/stat/user_stat.dart';
import 'package:helpbuddy/user/chat/models/user_model.dart';
import 'package:helpbuddy/user/chat/screens/chat_room.dart';
import 'package:helpbuddy/user/home/side_bar.dart';
import 'package:helpbuddy/user/more/user_more.dart';
import 'package:helpbuddy/user/notification/notification.dart';
import 'package:helpbuddy/user/payment/payment.dart';
import 'package:helpbuddy/user/profile/profile.dart';
import 'package:helpbuddy/user/project/project.dart';
import 'package:helpbuddy/user/state/user_state.dart';
import 'package:helpbuddy/widget/button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({Key? key}) : super(key: key);

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var state;
  UserModel? userModel;

  @override
  void initState() {
    
 

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      drawer: const UserRightNavBar(), //Drawer,
      body: 
               Container(
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
                                                const UserNotification()));
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: const Color(0xffF6F6F6),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: const Icon(
                                        Icons.notifications_outlined),
                                  ),
                                ),
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  const Profile()));
                                    },
                                    child: Image.asset(
                                        'assets/images/Account Owner.png'))
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
                                  Text('userModel!.firstName',
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('userModel!.firstName',
                                          style: GoogleFonts.urbanist(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                              color: Colors.white)),
                                      Text(
                                          '40 hb',
                                          style: GoogleFonts.urbanist(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 24,
                                              color: Colors.white)),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          const Payment()));
                                        },
                                        child: SizedBox(
                                            height: 30,
                                            width: 120,
                                            child: WhiteButton(
                                                text: 'Add Balance')),
                                      )
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const Project()));
                              },
                              child: DashboardCard(
                                  color: const Color(0xffEDF9E7),
                                  firstText: 'Start a  ',
                                  imagePath:
                                      'assets/user_assets/istockphoto-1365197728-612x612 1 (1).png',
                                  secondText: 'Project'),
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
                                            const UserStat()));
                              },
                              child: DashboardCard(
                                  color: const Color(0xffFFEBEB),
                                  firstText: 'View',
                                  imagePath:
                                      'assets/user_assets/open-book-diary-with-white-paper-blank-pages-bookmark-3d-vector-icon-cartoon-minimal-style_365941-745-removebg-preview 1.png',
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
                                            ChatRoom(
                                              //chatRoom: chatRoomModel,
                                              userModel: userModel!,
                                              //    firebaseUser: widget.firebaseUser,
                                              targetUser: userModel!,
                                              reason: 'Get Help',
                                            )));
                              },
                              child: DashboardCard(
                                  color: const Color(0xffE7F7F8),
                                  firstText: '',
                                  imagePath:
                                      'assets/user_assets/Group 2493.png',
                                  secondText: 'Get Help'),
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
                                            const UserMore()));
                              },
                              child: DashboardCard(
                                  color: const Color(0xffE0D9F7),
                                  firstText: '',
                                  imagePath: 'assets/images/Group 2494.png',
                                  secondText: 'More'),
                            ))
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
