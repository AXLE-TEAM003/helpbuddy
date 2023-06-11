import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/constants/dimensions.dart';

class Refer extends StatefulWidget {
  const Refer({super.key});

  @override
  State<Refer> createState() => _ReferState();
}

class _ReferState extends State<Refer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF051532),
      body: Column(children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(color: Color(0xFF051532)),
            child: SafeArea(
              child: Column(
                children: [
                  Image.asset('assets/images/refer.png'),
                  Text('Earn Money',
                      style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontSize: 30 * factor,
                      )),
                  Text('By Refer',
                      style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontSize: 30 * factor,
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(144, 2, 0, 124),
                            borderRadius: BorderRadius.circular(18)),
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: const [
                            Text(
                              '1234456789098763',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 18,
                            ),
                            Text(
                              'Copy',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(18)),
                        padding: const EdgeInsets.all(16),
                        child: const Text(
                          'SHARE',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(25),
          height: MediaQuery.of(context).size.height * .47,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35), topRight: Radius.circular(35)),
              color: Colors.white),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Invite friend',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 59, 59, 59)),
                  ),
                  Expanded(child: Container()),
                  const Icon(Icons.search)
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      friends(),
                      friends(),
                      friends(),
                      friends(),
                      friends(),
                      friends(),
                      friends(),
                      friends(),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }

  Widget friends() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Image.asset('assets/images/Account Owner.png'),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Tongkun Lee',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 59, 59, 59)),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'Facebook',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 59, 59, 59)),
              )
            ],
          ),
          Expanded(child: Container()),
          Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(120, 196, 145, 191),
                borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Invite',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
