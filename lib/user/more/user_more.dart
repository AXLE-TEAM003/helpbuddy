import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/user/chat/models/user_model.dart';
import 'package:helpbuddy/user/chat/screens/chat_room.dart';
import 'package:helpbuddy/user/profile/profile_settings.dart';
import 'package:helpbuddy/user/state/user_state.dart';
import 'package:helpbuddy/utils/constant/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class UserMore extends StatefulWidget {
  const UserMore({Key? key}) : super(key: key);

  @override
  State<UserMore> createState() => _UserMoreState();
}

class _UserMoreState extends State<UserMore> {
  UserModel? userModel;

  @override
  void initState() {
   
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
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
        title: Text('More',
            style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Colors.black)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Image.asset(
              'helpbuddy/assets/images/Account Owner.png',
              height: 40,
              width: 40,
            ),
          ),
          Text('Ore Ademiniyi', style: ConstantTheme().bigBlueStyle),
          Text('contact @ oreademiniyi.com',
              style: ConstantTheme().defaultStyle),
          const SizedBox(
            height: 30,
          ),
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
                            reason: 'Educational Consult',
                          )));
            },
            child: MoreCard(
              text: 'Educational Consult',
              icon: MdiIcons.schoolOutline,
            ),
          ),
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
                            reason: 'Accomodation Request',
                          )));
            },
            child: MoreCard(
              text: 'Accomodation Request',
              icon: MdiIcons.homeCityOutline,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const ProjectSettings()),
              );
            },
            child: MoreCard(
              text: 'Prefrences',
              icon: MdiIcons.tuneVariant,
            ),
          ),
          Column(children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const ProjectSettings()),
                );
              },
              child: MoreCard(
                text: 'Account Security',
                icon: MdiIcons.lock,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: LinearPercentIndicator(
              width: MediaQuery.of(context).size.width * .27,
              lineHeight: 7.0,
              percent: 0.5,
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              animation: true,
              barRadius: const Radius.circular(30),
              backgroundColor: Colors.grey,
              progressColor: Colors.blue,
            )),
            const SizedBox(
              height: 10,
            ),
            Text('Excellent',
                style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Colors.black)),
          ]),
          InkWell(
            onTap: () {
            
            },
            child: MoreCard(
              text: 'Customer Support',
              icon: MdiIcons.helpCircleOutline,
            ),
          ),
          LogoutCard(text: 'logout', icon: MdiIcons.logout)
        ],
      ),
    );
  }
}

class MoreCard extends StatelessWidget {
  MoreCard({Key? key, required this.text, this.icon}) : super(key: key);
  String text;
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: const Color(0xff004852),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(text,
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.black)),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Color(0xffA7A7AB),
            )
          ],
        ),
      ),
    );
  }
}

class LogoutCard extends StatelessWidget {
  LogoutCard({Key? key, required this.text, this.icon}) : super(key: key);
  String text;
  IconData? icon;

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
                Icon(
                  icon,
                  color: Colors.red,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(text,
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w200,
                        fontSize: 14,
                        color: Colors.red)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
