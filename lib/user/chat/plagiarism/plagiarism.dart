import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlagiarismCheck extends StatelessWidget {
  const PlagiarismCheck({super.key});

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
        title: Text('Plagiarism Check',
            style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 23, 81, 143),
                fontSize: 15,
                letterSpacing: 0.6)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Add Document',
                style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 80, 80, 80),
                    fontSize: 14,
                    letterSpacing: 0.6)),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  Text('Click here to upload a document',
                      style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 148, 148, 148),
                          fontSize: 15,
                          letterSpacing: 0.6)),
                  Expanded(child: Container()),
                  const Icon(
                    Icons.add,
                    color: Color.fromARGB(255, 148, 148, 148),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text('Document can be in .doc, .pdf, or .docx formats',
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 172, 172, 172),
                  fontSize: 11,
                )),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              decoration: BoxDecoration(
                  color: const Color(0xff2781E1),
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Text('Run Plagiarism Test',
                    style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 16,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
