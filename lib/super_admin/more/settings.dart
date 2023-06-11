import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuperAdminSettings extends StatefulWidget {
  const SuperAdminSettings({Key? key}) : super(key: key);

  @override
  State<SuperAdminSettings> createState() => _SuperAdminSettingsState();
}

class _SuperAdminSettingsState extends State<SuperAdminSettings> {
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
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black)),
          centerTitle: true,
        ),
        body: Container());
  }
}

class MoreCard extends StatelessWidget {
  MoreCard({Key? key, required this.text, this.icon, required this.destination})
      : super(key: key);
  String text;
  IconData? icon;
  String destination;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, destination);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        height: 50,
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon, size: 25),
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
    return SizedBox(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 35,
              color: Colors.red,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(text,
                style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w200,
                    fontSize: 16,
                    color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
