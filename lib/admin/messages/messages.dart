import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/admin/chat/screens/chat_room.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../api_client/api_client.dart';
import '../../mymodels/myusermodels.dart';

class AdminMessages extends StatefulWidget {
  const AdminMessages({Key? key, required this.token, required this.uid})
      : super(key: key);
  final String token;
  final int uid;

  @override
  State<AdminMessages> createState() => _AdminMessagesState();
}

class _AdminMessagesState extends State<AdminMessages> {
  List<Conversation> conversations = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getConversations(widget.token).then((response) {
      setState(() {
        conversations =
            response.map((json) => Conversation.fromJson(json)).toList();
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
                        child: Text('No messages'),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.only(top: 20),
                        itemCount: conversations.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (conversations[index].title == 'Get Work' ||
                              conversations[index].title == 'Support' ||
                              conversations[index].title ==
                                  'Accomondation Request' ||
                              conversations[index].title == 'Edu Consult') {
                            return Container();
                          }
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
                            latest: conversations[index].latest.content,
                            unread: conversations[index].unread,
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
      required this.unread,
      required this.latest,
      required this.conversationId})
      : super(key: key);
  final String title;
  final Participant participant;
  final int uid;
  final int conversationId;
  final IconData? icon;
  final DateTime date;
  final String token;
  final String? latest;
  final int unread;

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
                partnerId: participant.id,
                conversationId: conversationId,
                token: token,
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
                    Text(latest == null ? title : latest!,
                        style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: const Color.fromARGB(255, 143, 143, 143))),
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
                unread == 0
                    ? const SizedBox()
                    : CircleAvatar(
                        radius: 11,
                        child: Text(unread.toString(),
                            style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.white)),
                      ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                    DateTime.now() == date
                        ? date.toString().substring(0, 10)
                        : date.toString().substring(11, 16),
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: const Color.fromARGB(255, 104, 104, 104))),
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
