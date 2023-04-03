import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserStat extends StatefulWidget {
  const UserStat({Key? key}) : super(key: key);

  @override
  State<UserStat> createState() => _UserStatState();
}

class _UserStatState extends State<UserStat> {
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
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 16,
            ),
          ),
          title: Text('User Stats',
              style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Colors.black)),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StatCard(
                secondText: 'Users un the last 24 hours',
                widget: Text('85',
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w700,
                     fontSize: 30,
                        color: Colors.black)),
              ),
             
              const SizedBox(
                height: 30,
              ),
              StatCard(
                secondText: 'Number of new users',
                widget: Text('56',
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                        color: Colors.black)),
              ),
              const SizedBox(
                height: 30,
              ),
              StatCard(
                secondText: 'Total numbers of all users',
                widget: Text('4678',
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w700,
                       fontSize: 30,
                        color: Colors.black)),
              ),
              const SizedBox(
                height: 30,
              ),
              StatCard(
                secondText: 'Total number of active users',
                widget: Text('3982',
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                        color: Colors.black)),
              ),
              const SizedBox(
                height: 30,
              ),
             
            ],
          ),
        ));
  }
}

class StatCard extends StatelessWidget {
  StatCard({Key? key, required this.secondText, required this.widget})
      : super(key: key);
  String secondText;
  Widget widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(secondText,
            style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: const Color(0xffB9B9B9))),
        const SizedBox(
          height: 6,
        ),
        widget
      ],
    );
  }
}
