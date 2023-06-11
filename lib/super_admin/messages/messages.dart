import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../api_client/api_client.dart';
import '../../mymodels/myusermodels.dart';
import '../../user/chat/screens/chat_room.dart';

class SuperAdminMessages extends StatefulWidget {
  const SuperAdminMessages({Key? key, required this.token, required this.uid})
      : super(key: key);
  final String token;
  final int uid;

  @override
  State<SuperAdminMessages> createState() => _AdminMessagesState();
}

class _AdminMessagesState extends State<SuperAdminMessages> {
  List<Conversation> conversations = [];
  bool isLoading = true;

  Timer? timer;

  void refreshMessages() {
    getConversations(widget.token).then((response) {
      if (mounted) {
        setState(() {
          conversations =
              response.map((json) => Conversation.fromJson(json)).toList();
          isLoading = false;
        });
      }
    }).catchError((error) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
      // Handle the error here, e.g., show an error message
      print('Error fetching projects: $error');
    });
  }

  @override
  void initState() {
    super.initState();
    refreshMessages(); // Call the method immediately
    timer = Timer.periodic(
        const Duration(seconds: 5), (Timer t) => refreshMessages());
  }

  @override
  void dispose() {
    timer?.cancel(); // Cancel the timer
    super.dispose();
  }

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
        title: Text('Chats',
            style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 23, 81, 143),
                fontSize: 15,
                letterSpacing: 0.6)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Text('Chats',
                    style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff2781E1),
                        fontSize: 14,
                        letterSpacing: 0.6)),
                Expanded(child: Container()),
                Text('Broadcast Messages',
                    style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff2781E1),
                        fontSize: 14,
                        letterSpacing: 0.6)),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : conversations.isEmpty
                    ? Center(
                        child: Text('No messages yet'),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.only(top: 20),
                        itemCount: conversations.length,
                        itemBuilder: (BuildContext context, int index) {
                          return MessageCard(
                            title: conversations[index].title,
                            participant:
                                conversations[index].participants.length >= 2
                                    ? conversations[index].participants[0].id ==
                                            widget.uid
                                        ? conversations[index].participants[1]
                                        : conversations[index].participants[0]
                                    : conversations[index].participants[0],
                            icon: MdiIcons.schoolOutline,
                            date: conversations[index].createdAt,
                            uid: widget.uid,
                            conversationId: conversations[index].id,
                            token: widget.token,
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}

class MessageCard extends StatelessWidget {
  const MessageCard(
      {Key? key,
      required this.title,
      required this.participant,
      this.icon,
      required this.date,
      required this.uid,
      required this.token,
      required this.conversationId})
      : super(key: key);
  final String title;
  final Participant participant;
  final int uid;
  final int conversationId;
  final IconData? icon;
  final DateTime date;
  final String token;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatRoom(
                userId: uid,
                partnerName: participant.name,
                conversationId: conversationId,
                token: token,
                support: true,
              ),
            ));
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/Account Owner.png',
                  height: 50,
                  width: 50,
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(participant.name,
                        style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: Colors.black)),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(title,
                        style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Color.fromARGB(255, 21, 12, 150))),
                    const SizedBox(
                      height: 2,
                    ),
                    /* const Text('Delivered',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                            fontSize: 12,
                            color: /* Color.fromARGB(255, 160, 160, 160) */
                                Color(0xff2781E1))), */
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    DateTime.now() == date
                        ? date.toString().substring(0, 10)
                        : date.toString().substring(11, 16),
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: const Color.fromARGB(255, 104, 104, 104))),
                const SizedBox(
                  height: 4,
                ),
                /*   CircleAvatar(
                  radius: 11,
                  child: Text('3',
                      style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.white)),
                ), */
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<List<dynamic>> getConversations(String token) async {
  final response = await ApiClient(authToken: token).get('conversations/list');
  return response;
}
