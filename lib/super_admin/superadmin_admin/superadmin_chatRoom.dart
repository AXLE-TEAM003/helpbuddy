/* import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:helpbuddy/user/chat/models/message_model.dart';
import 'package:helpbuddy/user/chat/models/user_model.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';



Uuid uuid = const Uuid();

class SuperAdminChatRoom extends StatefulWidget {
//  final ChatRoomModel? chatRoom;
  // final FirebaseUser ? firebaseUser;
  const SuperAdminChatRoom(
      {Key? key,
      //required this.chatRoom,
      required this.userModel,
      // required this.firebaseUser,
      required this.targetUser,
      this.reason})
      : super(key: key);
  final UserModel targetUser;
  final UserModel userModel;
  final String? reason;

  @override
  State<SuperAdminChatRoom> createState() => _SuperAdminChatRoomState();
}

class _SuperAdminChatRoomState extends State<SuperAdminChatRoom> {
  TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    messageController.text = '';
    super.initState();
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  Future<void> sendMessage() async {
    String? message = messageController.text.trim();
    messageController.clear();

    if (message.isNotEmpty) {
      MessageModel messageModel = MessageModel(
        text: message,
        messageId: uuid.v1(),
        sender: widget.userModel.userId,
        sentTime: DateTime.now(),
        seen: false,
      );

      // await not used, can store message when internet not available
      // await FirebaseFirestore.instance
      //     .collection("chatRooms")
      //     .doc(widget.chatRoom?.chatRoomId)
      //     .collection("messages")
      //     .doc(messageModel.messageId)
      //     .set(
      //       messageModel.toMap(),
      //     )
      //     .whenComplete(
      //   () {
      //     log("Message sent");
      //   },
      // );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.userModel.userId)
          .collection(widget.reason!)
          .doc(messageModel.messageId)
          .set(
            messageModel.toMap(),
          )
          .whenComplete(
        () {
          log('Message sent');
        },
      );
      //sender side

      await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.targetUser.userId)
          .collection('messages')
          .doc(messageModel.messageId)
          .set(
            messageModel.toMap(),
          )
          .whenComplete(
        () {
          log('Message sent');
        },
      );

      // await FirebaseFirestore.instance
      //     .collection("chatRooms")
      //     .doc(widget.chatRoom?.chatRoomId)
      //     .collection("messages")
      //     .doc(messageModel.messageId)
      //     .set(
      //       messageModel.toMap(),
      //     )
      //     .whenComplete(
      //   () {
      //     log("Message sent");
      //   },
      // );

      // widget.chatRoom?.lastMessage = message;
      // await FirebaseFirestore.instance
      //     .collection("chatRooms")
      //     .doc(widget.chatRoom?.chatRoomId)
      //     .set(
      //       widget.chatRoom!.toMap(),
      //     );
    }
  }

  DateFormat timeFormat = DateFormat('hh:mm a');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 15),
          title: Row(
            children: [
              widget.targetUser.userDpUrl.toString().isNotEmpty
                  ? CircleAvatar(
                      backgroundImage:
                          NetworkImage(widget.targetUser.userDpUrl.toString()),
                    )
                  : const CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person),
                    ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.reason.toString(),
                    style: const TextStyle(color: Colors.black),
                  ),
                  StreamBuilder(
                    // get user isOnline status
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .doc(widget.targetUser.userId)
                        .snapshots(),
                    builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                      // red color for offline , green color for online
                      return snapshot.hasData
                          ? snapshot.data!.get('isOnline')
                              ? const Text(
                                  'Online',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 12,
                                  ),
                                )
                              : const Text(
                                  'Offline',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                  ),
                                )
                          : const Text(
                              'Offline',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                              ),
                            );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .doc(widget.userModel.userId)
                      .collection(widget.reason!)
                      .orderBy('sentTime', descending: true)
                      .snapshots(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (snapshot.hasData) {
                        QuerySnapshot querySnapshot =
                            snapshot.data as QuerySnapshot;
                        return ListView.builder(
                          shrinkWrap: true,
                          reverse: false,
                          itemCount: querySnapshot.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            MessageModel currentMessage = MessageModel.fromMap(
                              querySnapshot.docs[index].data()
                                  as Map<String, dynamic>,
                            );
                            return Row(
                              mainAxisAlignment:
                                  currentMessage.sender == widget.userModel.userId
                                      ? MainAxisAlignment.end
                                      : MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  onLongPress: () async {
                                    await FirebaseFirestore.instance
                                        .collection('chatRooms')
                                        .doc(widget.userModel.userId)
                                        .collection('messages')
                                        .doc(currentMessage.messageId)
                                        .delete();
                                  },
                                  onDoubleTap: () async {
                                    // edit message
                                    if (messageController.text.isNotEmpty) {
                                      await FirebaseFirestore.instance
                                          .collection('chatRooms')
                                          .doc(widget.userModel.userId)
                                          .collection('messages')
                                          .doc(currentMessage.messageId)
                                          .update({
                                        'text': messageController.text,
                                      });
                                    }
                                  },
                                  borderRadius: BorderRadius.circular(20),
                                  splashColor: Colors.green,
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment: currentMessage.sender ==
                                              widget.userModel.userId
                                          ? CrossAxisAlignment.end
                                          : CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          // alignment: (currentMessage.sender ==
                                          //         widget.userModel.userId)
                                          //     ? Alignment.centerRight
                                          //     : Alignment.centerLeft,
                                          constraints: const BoxConstraints(
                                            maxWidth: 250,
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 10,
                                            horizontal: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: (currentMessage.sender ==
                                                    widget.userModel.userId)
                                                ? const Color(0xffD2D4D8)
                                                : const Color(0xffFFF0E6),
                                          ),
                                          child: Text(
                                            currentMessage.text.toString(),
                                            textAlign: currentMessage.sender ==
                                                    widget.userModel.userId
                                                ? TextAlign.end
                                                : TextAlign.start,
                                            style: const TextStyle(
                                              color: Color(0xff234C78),
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          //  + ${DateTime.parse(currentMessage.sentTime.toString()).second} + ${DateTime.parse(currentMessage.sentTime.toString()).millisecond}
                                          timeFormat
                                              .format(currentMessage.sentTime!),
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      } else {
                        return const Center(
                          child: Text('No messages'),
                        );
                      }
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: messageController,
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      onPressed: () {
                        // record voice message
                      },
                      icon: const Icon(
                        Icons.keyboard_voice_rounded,
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        sendMessage();
                      },
                      icon: const Icon(
                        Icons.send,
                      ),
                    ),
                    fillColor: const Color(0xffD2D4D8),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffD2D4D8),
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color(0xffD2D4D8),
                        width: 2,
                      ),
                    ),
                  ),
                  // styling
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 */