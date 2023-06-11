import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../api_client/api_client.dart';
import '../../mymodels/myusermodels.dart';

class RequestHistory extends StatefulWidget {
  const RequestHistory({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  State<RequestHistory> createState() => _RequestHistoryState();
}

class _RequestHistoryState extends State<RequestHistory> {
  List<Project> projectsList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProjects(widget.token).then((response) {
      setState(() {
        projectsList = response.map((json) => Project.fromJson(json)).toList();
        isLoading = false;
      });
    }).catchError((error) {
      setState(() {
        isLoading = false;
      });
      // Handle the error here, e.g., show an error message
      print('Error fetching projects: $error');
    });
  }

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
                  fontSize: 18,
                  color: Colors.black)),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Any status',
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color.fromARGB(255, 104, 104, 104))),
                      const SizedBox(
                        width: 2,
                      ),
                      const Icon(Icons.arrow_drop_down),
                      const SizedBox(
                        width: 12,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('31/12/2022 - 01/03/2023',
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color.fromARGB(255, 0, 0, 0))),
                      const SizedBox(
                        width: 2,
                      ),
                      const Icon(Icons.arrow_drop_down),
                      const SizedBox(
                        width: 12,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Text('In: ',
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Color.fromARGB(255, 0, 0, 0))),
                      Text('£240,000.10',
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color.fromARGB(255, 102, 102, 102))),
                      Expanded(child: Container()),
                      Text('Out: ',
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Color.fromARGB(255, 0, 0, 0))),
                      Text('£240,000.10',
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color.fromARGB(255, 102, 102, 102))),
                    ],
                  ),
                  Expanded(
                    child: isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : projectsList.isEmpty
                            ? const Center(
                                child: Text('No projects found'),
                              )
                            : ListView.builder(
                                padding: const EdgeInsets.only(top: 20),
                                itemCount: projectsList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return RequestCard(
                                    item: projectsList[index],
                                    token: widget.token,
                                  );
                                },
                              ),
                  )
                ],
              ),
            )),
          ],
        ));
  }
}

class RequestCard extends StatelessWidget {
  const RequestCard({Key? key, required this.item, required this.token})
      : super(key: key);
  final Project item;
  final String token;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.arrow_drop_down),
          Image.asset(
            "assets/images/Twgo 1.png",
            width: 50,
            height: 50,
          ),
          SizedBox(
            width: 2,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('You started a project',
                  style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                      color: Colors.black)),
              const SizedBox(
                height: 2,
              ),
              Text('Budget',
                  style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w600,
                      fontSize: 11.5,
                      color: Color.fromARGB(255, 141, 141, 141))),
              const SizedBox(
                height: 2,
              ),
              Text('Status',
                  style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: const Color(0xff686868))),
            ],
          ),
          Expanded(child: Container()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(item.deliveryDate,
                  style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: const Color(0xff006C3F))),
              const SizedBox(
                height: 2,
              ),
              Text(item.serviceType,
                  style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Color.fromARGB(255, 102, 102, 102))),
              const SizedBox(
                height: 2,
              ),
              Text(
                  item.status.substring(0, 1).toUpperCase() +
                      item.status.substring(1),
                  style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Color.fromARGB(255, 0, 199, 50))),
            ],
          ),
        ],
      ),
    );
  }
}

Future<List<dynamic>> fetchProjects(String token) async {
  final response = await ApiClient(authToken: token).get('projects/admin');
  return response;
}
