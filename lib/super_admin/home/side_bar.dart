import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/super_admin/advertisement/advert_placement.dart';
import 'package:helpbuddy/super_admin/create_admin/create_new_admin.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RightNavBar extends StatelessWidget {
  const RightNavBar({Key? key}) : super(key: key);

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
                  Image.asset('assets/images/Account Owner.png'),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello Oreoluwa',
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
          SideBarCard(
            text: 'Home',
          ),
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) => const CreateAdmin()));
              },
              child: SideBarCard(text: 'Create Admin')),
          SideBarCard(text: 'Notification'),
          SideBarCard(text: 'Education'),
          SideBarCard(text: 'Accommodation'),
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) => const AdvertPlacement()));
              },
              child: SideBarCard(text: 'Advert Placement')),

          SizedBox(
            width: 60,
            child: Container(
              width: 60,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xff2781E1),
                  ),
                  borderRadius: BorderRadius.circular(30)),
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
          )
        ],
      ),
    );
  }
}

class SideBarCard extends StatelessWidget {
  SideBarCard({Key? key, required this.text}) : super(key: key);
  String text;

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
                        fontWeight: FontWeight.w200,
                        fontSize: 14,
                        color: Colors.black)),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Color(0xff2781E1),
            )
          ],
        ),
      ),
    );
  }
}
