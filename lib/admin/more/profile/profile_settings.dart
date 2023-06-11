import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/admin/more/profile/transaction_pin.dart';
import 'package:helpbuddy/utils/constant/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../mymodels/myusermodels.dart';


class ProjectSettings extends StatefulWidget {
  const ProjectSettings({Key? key, required this.userInfo}) : super(key: key);

  final UserInfo userInfo;

  @override
  State<ProjectSettings> createState() => _ProjectSettingsState();
}

class _ProjectSettingsState extends State<ProjectSettings> {
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
        title: Text('Settings',
            style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Colors.black)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/images/Account Owner.png')),
          Text(
              "${widget.userInfo.info.firstName} ${widget.userInfo.info.lastName}",
              style: ConstantTheme().bigBlueStyle),
          Text(widget.userInfo.info.email, style: ConstantTheme().defaultStyle),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/user/profile',
                  arguments: {'info': widget.userInfo});
            },
            child: MoreCard(
              text: 'Update Profile',
              icon: MdiIcons.schoolOutline,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const TransactionPin(),
                ),
              );
            },
            child: MoreCard(
              text: 'Change Transaction Pin',
              icon: MdiIcons.homeCityOutline,
            ),
          ),
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
