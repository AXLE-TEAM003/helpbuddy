import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../mymodels/myusermodels.dart';

class HistoryDetail extends StatefulWidget {
  const HistoryDetail({Key? key, required this.token, required this.project})
      : super(key: key);
  final String token;
  final Project project;

  @override
  State<HistoryDetail> createState() => _HistoryDetailState();
}

class _HistoryDetailState extends State<HistoryDetail> {
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
          title: Text('History',
              style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Colors.black)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Project Details',
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 33, 2, 145))),
                const SizedBox(
                  height: 20,
                ),
                Text('Project Title',
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: const Color.fromARGB(255, 53, 123, 156))),
                Text(widget.project.title,
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: const Color.fromARGB(255, 33, 2, 145))),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Start Date',
                            style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color:
                                    const Color.fromARGB(255, 53, 123, 156))),
                        Text(widget.project.deliveryDate,
                            style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: const Color.fromARGB(255, 33, 2, 145))),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Status',
                            style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color:
                                    const Color.fromARGB(255, 53, 123, 156))),
                        Text(widget.project.status,
                            style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: const Color.fromARGB(255, 33, 2, 145))),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Text('Deadline',
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: const Color.fromARGB(255, 53, 123, 156))),
                Text(widget.project.deliveryDate,
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: const Color.fromARGB(255, 33, 2, 145))),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Department',
                            style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color:
                                    const Color.fromARGB(255, 53, 123, 156))),
                        Text(widget.project.department,
                            style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: const Color.fromARGB(255, 33, 2, 145))),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Amount Paid',
                            style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color:
                                    const Color.fromARGB(255, 53, 123, 156))),
                        Text(widget.project.budget,
                            style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: const Color.fromARGB(255, 33, 2, 145))),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Text('Project Type',
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: const Color.fromARGB(255, 53, 123, 156))),
                Text(widget.project.serviceType,
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: const Color.fromARGB(255, 33, 2, 145))),
                const SizedBox(
                  height: 25,
                ),
                Text('Writer',
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: const Color.fromARGB(255, 53, 123, 156))),
                Text(widget.project.admin ?? "-",
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: const Color.fromARGB(255, 33, 2, 145))),
                const SizedBox(
                  height: 25,
                ),
                Text('Document',
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: const Color.fromARGB(255, 33, 2, 145))),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Text('Project Title',
                            style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color:
                                    const Color.fromARGB(255, 53, 123, 156))),
                        Text('Document',
                            style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: const Color.fromARGB(255, 33, 2, 145))),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class HistoryCard extends StatelessWidget {
  const HistoryCard({Key? key, required this.data}) : super(key: key);
  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.only(right: 20, top: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 243, 243, 243),
            blurRadius: 2,
            offset: Offset(0.0, 2.0),
          ),
        ],
      ),
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(width: 5, height: 90, color: Colors.green),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data,
                      style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.black)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('History Details',
                      style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: const Color(0xff686868))),
                ],
              )
            ],
          ),
          Container(
            decoration: const BoxDecoration(color: Color(0xffD9FFEF)),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text('Complete',
                  style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: const Color(0xff006C3F))),
            ),
          ),
        ],
      ),
    );
  }
}
