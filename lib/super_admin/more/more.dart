import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/utils/constant/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SubAdminMore extends StatefulWidget {
  const SubAdminMore({Key? key}) : super(key: key);

  @override
  State<SubAdminMore> createState() => _SubAdminMoreState();
}

class _SubAdminMoreState extends State<SubAdminMore> {
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
        title: Text('Create New Admin',
            style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Colors.black)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Image.asset('dededed'),
          Text('Ore Ademiniyi', style: ConstantTheme().bigBlueStyle),
          Text('contact @ oreademiniyi.com',
              style: ConstantTheme().defaultStyle),
          const SizedBox(
            height: 30,
          ),
          MoreCard(
            text: 'Educational Consult',
            icon: MdiIcons.schoolOutline,
          ),
          MoreCard(
            text: 'Accomodation Request',
            icon: MdiIcons.homeCityOutline,
          ),
          MoreCard(
            text: 'Prefrences',
            icon: MdiIcons.tuneVariant,
          ),
          MoreCard(
            text: 'Customer',
            icon: MdiIcons.helpCircleOutline,
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
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon),
                const SizedBox(
                  width: 5,
                ),
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
