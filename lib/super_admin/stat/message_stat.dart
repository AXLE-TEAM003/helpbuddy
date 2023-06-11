import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MessageStat extends StatefulWidget {
  const MessageStat({Key? key}) : super(key: key);

  @override
  State<MessageStat> createState() => _MessageStatState();
}

class _MessageStatState extends State<MessageStat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: const Color.fromARGB(255, 209, 209, 243),
          elevation: 7,
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
          title: Text('Message Stats',
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
                secondText: 'New Message',
                widget: Text('85',
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
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
                        fontSize: 25,
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
                        fontSize: 25,
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
                        fontSize: 25,
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
                fontWeight: FontWeight.w700,
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
