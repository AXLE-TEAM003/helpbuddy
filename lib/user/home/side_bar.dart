import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/authentication/login.dart';
import 'package:helpbuddy/user/chat/models/user_model.dart';
import 'package:helpbuddy/user/chat/screens/chat_room.dart';
import 'package:helpbuddy/user/chat/screens/home_screen.dart';
import 'package:helpbuddy/user/notification/notification.dart';
import 'package:helpbuddy/user/profile/profile.dart';
import 'package:helpbuddy/user/state/user_state.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class UserRightNavBar extends StatefulWidget {
  const UserRightNavBar({Key? key}) : super(key: key);

  @override
  State<UserRightNavBar> createState() => _UserRightNavBarState();
}

class _UserRightNavBarState extends State<UserRightNavBar> {
  UserModel? userModel;

  @override
  void initState() {
    
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), bottomRight: Radius.circular(25))),
      elevation: 0,
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30))), //BoxDecoration
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const Profile()));
                      },
                      child: Image.asset('assets/images/Account Owner.png')),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('userModel!.firstName',
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                              color: Colors.black)),

                      //   SizedBox(height: 3,),

                      Text('@Hello Oreoluwa',
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w200,
                              fontSize: 14,
                              color: Colors.black)),
                    ],
                  )
                ],
              ) //UserAccountDrawerHeader
              ), //DrawerHeader
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: SideBarCard(
              iconImage: 'helpbuddy/assets/sidebar_svgs/home.png',
              text: 'Home',
            ),
          ),
          InkWell(
              onTap: () {
              
              },
              child: SideBarCard(
                text: 'Messages',
                iconImage: 'helpbuddy/assets/sidebar_svgs/messages.png',
              )),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const UserNotification()));
              },
              child: SideBarCard(
                text: 'Notification',
                iconImage: 'helpbuddy/assets/sidebar_svgs/notification.png',
              )),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ChatRoom(
                              //chatRoom: chatRoomModel,
                              userModel: userModel!,
                              //    firebaseUser: widget.firebaseUser,
                              targetUser: userModel!,
                              reason: 'FormA',
                            )));
              },
              child: SideBarCard(
                text: 'FormA',
                iconImage:
                    'helpbuddy/assets/sidebar_svgs/arrow-swap-horizontal.png',
              )),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ChatRoom(
                              //chatRoom: chatRoomModel,
                              userModel: userModel!,
                              //    firebaseUser: widget.firebaseUser,
                              targetUser: userModel!,
                              reason: 'Get Work',
                            )));
              },
              child: SideBarCard(
                text: 'Get Work',
                iconImage: 'helpbuddy/assets/sidebar_svgs/briefcase.png',
              )),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const Profile()));
              },
              child: SideBarCard(
                text: 'Profile',
                iconImage: 'helpbuddy/assets/sidebar_svgs/profile.png',
              )),

          const SizedBox(
            height: 50,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const Login()));
              },
              child: Container(
                width: 60,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xff2781E1),
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Sign Out',
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w200,
                              fontSize: 17,
                              color: const Color(0xff2781E1))),
                      //SizedBox(width: ,)
                      const Icon(MdiIcons.logout, color: Color(0xff2781E1))
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SideBarCard extends StatelessWidget {
  SideBarCard({Key? key, required this.text, required this.iconImage})
      : super(key: key);
  String text;
  String iconImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 5,
                ),
                Image.asset(iconImage),
                Text(text,
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w200,
                        fontSize: 14,
                        color: Colors.black)),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Color(0xffB9B9B9),
            )
          ],
        ),
      ),
    );
  }
}
