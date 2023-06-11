import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Reviews extends StatefulWidget {
  const Reviews({super.key});

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
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
            size: 18,
          ),
        ),
        title: Container(),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Reviews',
                  style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w700,
                      fontSize: 26,
                      color: Colors.black)),
              const SizedBox(
                height: 50,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('4.3',
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w700,
                              fontSize: 36,
                              color: Colors.black)),
                      Text('23 Ratings',
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                              color: const Color.fromARGB(255, 143, 143, 143))),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      starRow(5),
                      starRow(4),
                      starRow(3),
                      starRow(2),
                      starRow(1),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      progress(12),
                      progress(5),
                      progress(4),
                      progress(2),
                      progress(0),
                    ],
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      vertText('12'),
                      vertText('5'),
                      vertText('4'),
                      vertText('2'),
                      vertText('0'),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text('8 reviews',
                  style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      color: Colors.black)),
              const SizedBox(
                height: 15,
              ),
              reviewBox(),
              reviewBox(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget reviewBox() {
  return Stack(
    children: [
      Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(30),
            width: double.maxFinite,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[200]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Helen Moore',
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.black)),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    starRowTicked(3),
                    Text('June 5, 2019',
                        style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            letterSpacing: 1.0,
                            color: const Color.fromARGB(255, 128, 128, 128)))
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                    "The dress is great! Very classy and comfortable. It fit perfectly! I'm 5'7\" and 130 pounds. I am a 34B chest. This dress would be too long for those who are shorter but could be hemmed. I wouldn't recommend it for those big chested as I am smaller chested and it fit me perfectly. The underarms were not too wide and the dress was made well.",
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        letterSpacing: 1.0,
                        color: Colors.black)),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Helpful',
                        style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            letterSpacing: 1.0,
                            color: const Color.fromARGB(255, 128, 128, 128))),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.thumb_up,
                      color: const Color.fromARGB(255, 128, 128, 128),
                    )
                  ],
                )
              ],
            ),
          )),
      Align(
        alignment: Alignment.topLeft,
        child: CircleAvatar(
          backgroundImage: Image.asset('assets/images/Account Owner.png').image,
        ),
      ),
    ],
  );
}

Widget starRow(int num) {
  List<Widget> stars = [];
  for (int i = 0; i < num; i++) {
    stars.add(const Icon(
      Icons.star,
      color: Color.fromARGB(255, 236, 213, 0),
      size: 16,
    ));
  }
  return Container(
    margin: const EdgeInsets.only(bottom: 4),
    child: Row(
      children: stars,
    ),
  );
}

Widget starRowTicked(int num) {
  List<Widget> stars = [];
  for (int i = 0; i < num; i++) {
    stars.add(const Icon(
      Icons.star,
      color: Color.fromARGB(255, 236, 213, 0),
      size: 18,
    ));
  }
  if (num < 5) {
    for (int i = 0; i < 5 - num; i++) {
      stars.add(const Icon(
        Icons.star_border_outlined,
        color: Color.fromARGB(255, 168, 168, 168),
        size: 18,
      ));
    }
  }
  return Row(
    children: stars,
  );
}

Widget progress(int rate) {
  return Container(
    margin: const EdgeInsets.only(bottom: 8, top: 4),
    height: 8,
    width: rate != 0 ? rate * 8 : 8,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 2, 23, 141),
            Color.fromARGB(255, 75, 134, 201),
          ],
        )),
  );
}

Widget vertText(String val) {
  return Container(
    margin: const EdgeInsets.only(bottom: 3),
    child: Text(val,
        style: GoogleFonts.urbanist(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: const Color.fromARGB(255, 121, 121, 121))),
  );
}
