import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class AdminStat extends StatefulWidget {
  const AdminStat({Key? key}) : super(key: key);

  @override
  State<AdminStat> createState() => _AdminStatState();
}

class _AdminStatState extends State<AdminStat> {
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
          title: Text('Project Stats',
              style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Colors.black)),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StatCard(
                  secondText: 'New Message',
                  widget: Text('85',
                      style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: Colors.black)),
                ),
                const SizedBox(
                  height: 30,
                ),
                StatCard(
                  secondText: 'Response Rtae (Tody)',
                  widget: LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width * .6,
                    lineHeight: 7.0,
                    percent: 0.5,
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    animation: true,
                    barRadius: const Radius.circular(30),
                    backgroundColor: Colors.grey,
                    progressColor: Colors.blue,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                StatCard(
                  secondText: 'New Message',
                  widget: Text('85',
                      style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: Colors.black)),
                ),
                const SizedBox(
                  height: 30,
                ),
                StatCard(
                  secondText: 'New Message',
                  widget: Text('85',
                      style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: Colors.black)),
                ),
                const SizedBox(
                  height: 30,
                ),
                StatCard(
                  secondText: 'New Message',
                  widget: Text('85',
                      style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: Colors.black)),
                ),
                const SizedBox(
                  height: 30,
                ),
                StatCard(
                  secondText: 'Response Rtae (Tody)',
                  widget: LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width * .6,
                    lineHeight: 7.0,
                    percent: 0.5,
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    animation: true,
                    barRadius: const Radius.circular(30),
                    backgroundColor: Colors.grey,
                    progressColor: Colors.blue,
                  ),
                ),
              ],
            ),
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
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        height: 192,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 3,
              color: Color(0x33000000),
              offset: Offset(0, 1),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Image.asset('assets/images/Account Owner.png'),
                  Column(
                    children: [
                      Text('Oluwatosin Ayomide',
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              color: Colors.black)),
                      Text(' @ Oluwatosin Ayomide',
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              color: Colors.black)),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Text('Number of project written : ',
                        style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: Colors.black)),
                    Text(' 126',
                        style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: Colors.black)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Text('Number of project accepted : ',
                        style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: Colors.black)),
                    Text(' 146',
                        style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: Colors.black)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Text('Number of messages sent  : ',
                        style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: Colors.black)),
                    Text(' 1230',
                        style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: Colors.black)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Text('Number of messages recieved  : ',
                        style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: Colors.black)),
                    Text(' 1230',
                        style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: Colors.black)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Text('Number of messages recieved  : ',
                        style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: Colors.black)),
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
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
