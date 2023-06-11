import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/user/profile/profile_settings.dart';
import 'package:helpbuddy/utils/constant/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../api_client/api_client.dart';
import '../../mymodels/myusermodels.dart';
import '../chat/screens/chat_room.dart';

class UserMore extends StatefulWidget {
  const UserMore({Key? key, required this.userInfo, required this.token})
      : super(key: key);

  final UserInfo userInfo;
  final String token;
  @override
  State<UserMore> createState() => _UserMoreState();
}

class _UserMoreState extends State<UserMore> {
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
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Image.asset(
              'assets/images/Account Owner.png',
              height: 40,
              width: 40,
            ),
          ),
          Text(
              "${widget.userInfo.info.firstName} ${widget.userInfo.info.lastName}",
              style: ConstantTheme().bigBlueStyle),
          Text(widget.userInfo.info.email, style: ConstantTheme().defaultStyle),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              getEduConversationId(widget.token).then((response) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatRoom(
                        userId: widget.userInfo.info.id,
                        partnerName: "Education Consult",
                        conversationId: response['conversation_id'],
                        token: widget.token,
                        support: true,
                      ),
                    ));
              });
            },
            child: MoreCard(
              text: 'Educational Consult',
              icon: MdiIcons.schoolOutline,
            ),
          ),
          InkWell(
            onTap: () {
              getAccomondationConversationId(widget.token).then((response) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatRoom(
                        userId: widget.userInfo.info.id,
                        partnerName: "Accomondation Request",
                        conversationId: response['conversation_id'],
                        token: widget.token,
                        support: true,
                      ),
                    ));
              });
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
                    builder: (BuildContext context) => ProjectSettings(
                          userInfo: widget.userInfo,
                        )),
              );
            },
            child: MoreCard(
              text: 'Prefrences',
              icon: MdiIcons.tuneVariant,
            ),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ProjectSettings(
                            userInfo: widget.userInfo,
                          )),
                );
              },
              child: MoreCard(
                text: 'Account Security',
                icon: MdiIcons.lock,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width * .7,
                  lineHeight: 7.0,
                  percent: 0.5,
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  animation: true,
                  barRadius: const Radius.circular(30),
                  backgroundColor: Colors.grey,
                  progressColor: Color(0xff004852),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 55),
              child: Text('Excellent',
                  style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color.fromARGB(255, 66, 66, 66),
                      letterSpacing: 0.6)),
            ),
          ]),
          InkWell(
            onTap: () {
              getSupportConversationId(widget.token).then((response) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatRoom(
                        userId: widget.userInfo.info.id,
                        partnerName: "Customer Support",
                        conversationId: response['conversation_id'],
                        token: widget.token,
                        support: true,
                      ),
                    ));
              });
            },
            child: MoreCard(
              text: 'Customer Support',
              icon: MdiIcons.helpCircleOutline,
            ),
          ),
          InkWell(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/select-role',
                  (Route<dynamic> route) => false,
                );
              },
              child: LogoutCard(text: 'logout', icon: MdiIcons.logout)),
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
                  width: 15,
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
    return Row(
      children: [
        const SizedBox(
          width: 15,
        ),
        const Icon(
          Icons.logout,
          color: Colors.red,
          size: 40,
        ),
        const SizedBox(
          width: 18,
        ),
        Text('Logout',
            style: GoogleFonts.urbanist(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.red,
            ))
      ],
    );
  }
}

getSupportConversationId(String token) async {
  final response =
      await ApiClient(authToken: token).post('support-conversation', {});
  return response;
}

getEduConversationId(String token) async {
  final response =
      await ApiClient(authToken: token).post('edu-consult-conversation', {});
  return response;
}

getAccomondationConversationId(String token) async {
  final response = await ApiClient(authToken: token)
      .post('accomondation-request-conversation', {});
  return response;
}
