import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class AllStat extends StatefulWidget {
  const AllStat({Key? key}) : super(key: key);

  @override
  State<AllStat> createState() => _AllStatState();
}

class _AllStatState extends State<AllStat> {
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
          title: Text('All Stats',
              style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Colors.black)),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                        context, '/super-admin/all-stats/message-stats');
                  },
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
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('New messages',
                              style: GoogleFonts.urbanist(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  color: Colors.black)),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('85',
                              style: GoogleFonts.urbanist(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 35,
                                  color: Colors.black)),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                // Determines the location of the % text ...
                                left: MediaQuery.of(context).size.width *
                                        .71 *
                                        .6 -
                                    10),
                            child: Text('60%',
                                style: GoogleFonts.urbanist(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: Colors.black)),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          LinearPercentIndicator(
                            width: MediaQuery.of(context).size.width * .71,
                            lineHeight: 7.0,
                            percent: 0.6,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 0.0),
                            animation: true,
                            barRadius: const Radius.circular(30),
                            backgroundColor: Colors.grey[300],
                            progressColor: Colors.blue,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text('Response ratio',
                              style: GoogleFonts.urbanist(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                        context, '/super-admin/all-stats/project-stats');
                  },
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
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('New Projects',
                              style: GoogleFonts.urbanist(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  color: Colors.black)),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('27',
                              style: GoogleFonts.urbanist(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 35,
                                  color: Colors.black)),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text('70%',
                                  style: GoogleFonts.urbanist(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      color: Colors.black)),
                              const SizedBox(
                                width: 4,
                              ),
                              Text('Daily Goal',
                                  style: GoogleFonts.urbanist(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Colors.black)),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Text('72',
                                  style: GoogleFonts.urbanist(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      color: Colors.black)),
                              const SizedBox(
                                width: 4,
                              ),
                              Text('Daily Goal',
                                  style: GoogleFonts.urbanist(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Colors.black)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                        context, '/super-admin/all-stats/user-stats');
                  },
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
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Users in the last 24 hours',
                              style: GoogleFonts.urbanist(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  color: Colors.black)),
                          const SizedBox(
                            height: 10,
                          ),
                          Image.asset('assets/charts/users_chart.png')
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
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
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Admin statistics',
                            style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                color: Colors.black)),
                        const SizedBox(
                          height: 10,
                        ),
                        Image.asset('assets/charts/admin_chart.png')
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                        context, '/super-admin/all-stats/transaction-stats');
                  },
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
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Transaction statistics',
                              style: GoogleFonts.urbanist(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  color: Colors.black)),
                          const SizedBox(
                            height: 10,
                          ),
                          Image.asset('assets/charts/transaction_chart.png')
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
