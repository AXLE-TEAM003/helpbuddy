import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/admin/more/profile/profile_settings.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../mymodels/myusermodels.dart';

class ViewMore extends StatelessWidget {
  const ViewMore({Key? key, required this.userInfo, required this.token})
      : super(key: key);

  final UserInfo userInfo;
  final String token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 25,
          ),
        ),
        title: Text('More',
            style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Colors.black)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            width: double.maxFinite,
            height: 1,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            width: 110,
            child: Stack(children: [
              CircleAvatar(
                radius: 55,
                backgroundImage:
                    Image.asset('assets/images/Account Owner.png').image,
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(100)),
                  child: const Icon(
                    Icons.add_photo_alternate_sharp,
                    color: Colors.blue,
                  ),
                ),
              )
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          Text("${userInfo.info.firstName} ${userInfo.info.lastName}",
              style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 49, 49, 49))),
          const SizedBox(
            height: 10,
          ),
          Text(userInfo.info.email,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 131, 131, 131))),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ProjectSettings(
                              userInfo: userInfo,
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
                    progressColor: const Color(0xff004852),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(left: 55),
                child: Text('Excellent',
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: const Color.fromARGB(255, 66, 66, 66),
                        letterSpacing: 0.6)),
              ),
            ]),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/select-role', ModalRoute.withName('/select-role'));
            },
            child: Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                const Icon(
                  Icons.logout,
                  color: Colors.red,
                  size: 50,
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
            ),
          ),
          const Spacer()
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
                  size: 30,
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
              size: 20,
              color: Color(0xffA7A7AB),
            )
          ],
        ),
      ),
    );
  }
}
