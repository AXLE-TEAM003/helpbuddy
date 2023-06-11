import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../mymodels/myusermodels.dart';

import '../../api_client/api_client.dart';

class History extends StatefulWidget {
  const History({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<Project> historyList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProjects(widget.token).then((response) {
      setState(() {
        historyList = response.map((json) => Project.fromJson(json)).toList();
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
        title: Text(
          'History',
          style: GoogleFonts.urbanist(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : historyList.isEmpty
              ? const Center(
                  child: Text('No history found'),
                )
              : ListView.builder(
                  padding: const EdgeInsets.only(top: 20),
                  itemCount: historyList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return HistoryCard(
                      item: historyList[index],
                      token: widget.token,
                    );
                  },
                ),
    );
  }
}

class HistoryCard extends StatelessWidget {
  const HistoryCard({Key? key, required this.item, required this.token})
      : super(key: key);
  final Project item;
  final String token;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        "/user/history-detail",
        arguments: {'token': token, 'project': item},
      ),
      child: Container(
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
                    Text(
                      item.title,
                      style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'History Details',
                      style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: const Color(0xff686868),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              decoration: const BoxDecoration(color: Color(0xffD9FFEF)),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  item.status,
                  style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: const Color(0xff006C3F),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<List<dynamic>> fetchProjects(String token) async {
  final response = await ApiClient(authToken: token).get('projects/user');
  return response;
}
