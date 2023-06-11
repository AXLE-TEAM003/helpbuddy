import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../api_client/api_client.dart';
import '../../mymodels/myusermodels.dart';
import '../../utils/toasts.dart';

class ProjectRequests extends StatefulWidget {
  const ProjectRequests({Key? key, required this.token, required this.uid})
      : super(key: key);
  final String token;
  final int uid;

  @override
  State<ProjectRequests> createState() => _ProjectRequestsState();
}

class _ProjectRequestsState extends State<ProjectRequests> {
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
          title: Text('Project Requests',
              style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Colors.black)),
          centerTitle: true,
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : projectsList.isEmpty
                ? const Center(
                    child: Text('No projects requests found'),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.only(top: 20),
                    itemCount: projectsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ProjectsRequestsCard(
                            item: projectsList[index],
                            token: widget.token,
                            uid: widget.uid,
                          ),
                          Container(
                            width: double.maxFinite,
                            height: 1,
                            color: Colors.grey,
                          )
                        ],
                      );
                    }));
  }
}

class ProjectsRequestsCard extends StatefulWidget {
  const ProjectsRequestsCard(
      {Key? key, required this.item, required this.token, required this.uid})
      : super(key: key);
  final Project item;
  final String token;
  final int uid;

  @override
  State<ProjectsRequestsCard> createState() => _ProjectsRequestsCardState();
}

class _ProjectsRequestsCardState extends State<ProjectsRequestsCard> {
  List? list;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Title',
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w400,
                // color: const Color(0xff2781E1),
                color: const Color.fromARGB(255, 116, 116, 116),
                fontSize: 14,
              )),
          Text(widget.item.title,
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w500,
                // color: const Color(0xff2781E1),
                color: Colors.black,
                fontSize: 14,
              )),
          const SizedBox(
            height: 8,
          ),
          Text('Time limit: 2 Weeks',
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w500,
                // color: const Color(0xff2781E1),
                color: Colors.black,
                fontSize: 14,
              )),
          const SizedBox(
            height: 8,
          ),
          Text('£${widget.item.budget}',
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w500,
                // color: const Color(0xff2781E1),
                color: Colors.black,
                fontSize: 14,
              )),
          Text('Budget',
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w400,
                // color: const Color(0xff2781E1),
                color: Colors.black,
                fontSize: 14,
              )),
          const SizedBox(
            height: 8,
          ),
          Text('Posted ${widget.item.deliveryDate}',
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w400,
                // color: const Color(0xff2781E1),
                color: const Color.fromARGB(255, 146, 146, 146),
                fontSize: 14,
              )),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Expanded(child: Container()),
              InkWell(
                onTap: () {
                  acceptProject(widget.token, widget.item.id).then((response) {
                    if (response is num) {
                      showSnackBar(context,
                          "Something happened. Try again later [$response]");
                    } else {
                      if (response['message'] != null &&
                          response['message'].isNotEmpty) {
                        showSuccessSnackBar(
                            context, "Project accepted successfully");
                        createConversation(
                                widget.token, widget.uid, response['user_id'])
                            .then((res) {
                          Future.delayed(const Duration(seconds: 2), () {
                            Navigator.pushReplacementNamed(
                                context, '/admin/side-bar/messages',
                                arguments: {
                                  'token': widget.token,
                                  'uid': widget.uid
                                });
                          });
                        });
                      } else {
                        showSnackBar(context, "Something happened. Try again.");
                      }
                    }
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Text('Accept',
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
    );
  }
}

Future<List<dynamic>> fetchProjects(String token) async {
  final response = await ApiClient(authToken: token).get('projects');
  return response;
}

acceptProject(String token, int id) async {
  final response =
      await ApiClient(authToken: token).post('projects/accept/$id', {});
  return response;
}

createConversation(String token, int userId, int partnerId) async {
  final response =
      await ApiClient(authToken: token).post('conversations/create', {
    "participants": [
      {"id": userId},
      {"id": partnerId}
    ],
    "content": "Project conversation"
  });
  return response;
}
