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
              size: 18,
            ),
          ),
          title: Text('Admin Stats',
              style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
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
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text('Number of project written : 126',
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: Colors.black)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text('Number of project accepted : 146',
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: Colors.black)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text('Number of messages sent  : 1230',
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: Colors.black)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text('Number of messages recieved  : 1230',
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: Colors.black)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Text('Response ratio',
                        style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: Colors.black)),
                    SizedBox(
                      width: 8,
                    ),
                    LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width * .27,
                      lineHeight: 7.0,
                      percent: 0.5,
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      animation: true,
                      barRadius: const Radius.circular(30),
                      backgroundColor: Colors.grey[300],
                      progressColor: Colors.blue,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text('70%',
                        style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: Colors.black))
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.red, width: 1.25),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Center(
                        child: Text('Blacklist',
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 14,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                          // border: Border.all(color: Colors.red, width: 1.25),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red),
                      child: Center(
                        child: Text('Remove',
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 14,
                            )),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
