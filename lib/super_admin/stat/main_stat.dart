import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MainStat extends StatefulWidget {
  const MainStat({Key? key}) : super(key: key);

  @override
  State<MainStat> createState() => _MainStatState();
}

class _MainStatState extends State<MainStat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: const Color(0xffF6F6F6),
                        borderRadius: BorderRadius.circular(20)),
                    child: Image.asset('assets/images/male_x5F_afro.png'),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: const Color(0xffF6F6F6),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Icon(Icons.notifications_outlined),
                      ),
                      Image.asset('assets/images/Account Owner.png')
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 189,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
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
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('New Messages',
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w800,
                              fontSize: 12,
                              color: Colors.black)),
                      const SizedBox(
                        height: 8,
                      ),
                      Text('85',
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w500,
                              fontSize: 50,
                              color: Colors.black)),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: LinearPercentIndicator(
                              width: MediaQuery.of(context).size.width * .6,
                              lineHeight: 7.0,
                              percent: 0.5,
                              animation: true,
                              barRadius: const Radius.circular(30),
                              backgroundColor: Colors.grey,
                              progressColor: Colors.blue,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text('100 %',
                              style: GoogleFonts.urbanist(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 12,
                                  color: Colors.black)),
                        ],
                      ),
                      Text('Response Rate',
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w800,
                              fontSize: 12,
                              color: Colors.black)),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 189,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
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
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('New Projects',
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w800,
                              fontSize: 12,
                              color: Colors.black)),
                      const SizedBox(
                        height: 8,
                      ),
                      Text('27',
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w500,
                              fontSize: 50,
                              color: Colors.black)),
                      const SizedBox(
                        height: 8,
                      ),
                      Text('60% Daily Gola',
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.black)),
                      const SizedBox(
                        height: 8,
                      ),
                      Text('72 Daily Goal',
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.black)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  DashboardCard(
      {Key? key,
      required this.color,
      required this.firstText,
      required this.imagePath,
      required this.secondText})
      : super(key: key);
  Color color;
  String imagePath;
  String firstText;
  String secondText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: MediaQuery.of(context).size.width,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 81, child: Image.asset(imagePath)),
          const SizedBox(
            height: 15,
          ),
          Text(firstText,
              style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w400,
                fontSize: 12,
              )),
          Text(secondText,
              style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ))
        ],
      ),
    );
  }
}
