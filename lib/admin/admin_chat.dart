/* import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helpbuddy/admin/chat/screens/chat_room.dart';
import 'package:helpbuddy/authentication/logins/admin_login.dart';
import 'package:helpbuddy/user/chat/models/chat_room_model.dart';
import 'package:helpbuddy/user/chat/models/firebase_helper.dart';
import 'package:helpbuddy/user/chat/models/user_model.dart';
import 'package:helpbuddy/user/chat/screens/search_screen.dart';
import 'package:helpbuddy/user/chat/util/snackbar.dart';
import 'package:helpbuddy/user/state/user_state.dart';
import 'package:provider/provider.dart';

class AdminChatList extends StatefulWidget {
  const AdminChatList(
      {Key? key, required this.userModel, required this.firebaseUser})
      : super(key: key);
  final UserModel? userModel;
  final User? firebaseUser;

  @override
  State<AdminChatList> createState() => _AdminChatListState();
}

class _AdminChatListState extends State<AdminChatList> {
  UserModel? adminData;

  @override
  void initState() {
    UserState userState = Provider.of<UserState>(context, listen: false);
    adminData = userState.userDetails;
   

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Welcome ${widget.userModel!.userName}'),
          actions: [
            IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut().then(
                  (value) {
                    // set isOnline = false
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(widget.firebaseUser!.uid)
                        .update({'isOnline': false});
                  },
                );
                // ignore: use_build_context_synchronously
                Navigator.popUntil(
                  context,
                  (Route route) {
                    return route.isFirst;
                  },
                );
                // ignore: use_build_context_synchronously
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const AdminLogin(),
                  ),
                );
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                  MySnackbar.successSnackBar('Logged Out Successfully'),
                );
              },
              icon: const Icon(Icons.logout),
            )
          ],
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(adminData?.userId)
                .collection('projectMessages')
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (snapshot.hasData) {
                  QuerySnapshot querySnapshot = snapshot.data as QuerySnapshot;
                  if (querySnapshot.docs.isEmpty) {
                    return const Center(
                      child: Text(
                        'No chats yet. Start chatting with someone',
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: querySnapshot.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      ChatRoomModel chatRoomModel = ChatRoomModel.fromMap(
                        querySnapshot.docs[index].data()
                            as Map<String, dynamic>,
                      );
                      // Map<String?, dynamic>? participants =
                      //     chatRoomModel.participants;

                      // List<String?> participantsKeys = participants!.keys
                      //     .where(
                      //         (element) => element != widget.userModel?.userId)
                      //     .toList();

                      return FutureBuilder(
                        future: FirebaseHelper.getUserModelById(
                            querySnapshot.docs[index]['sender']),
                        builder: (BuildContext context,
                            AsyncSnapshot<Object?> data) {
                          if (data.connectionState == ConnectionState.waiting) {
                            return Center(
                              child: Container(),
                            );
                          } else {
                            if (data.hasData) {
                              UserModel targetUser = data.data as UserModel;
                              // arrange the latest messages on top
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ChatRoom(
                                        //chatRoom: chatRoomModel,
                                        userModel: widget.userModel!,
                                        reason: targetUser.userName,
                                        targetUser: targetUser,
                                      ),
                                    ),
                                  );
                                },
                                // onLongPress: () {
                                //   // delete chat room
                                //   FirebaseFirestore.instance
                                //       .collection("chatRooms")
                                //       .doc(chatRoomModel.chatRoomId)
                                //       .delete();
                                // },
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(targetUser.userDpUrl!),
                                  ),
                                  title: Text(targetUser.userName!),
                                  //subtitle: Text(chatRoomModel.lastMessage!),
                                ),
                              );
                            } else if (data.hasError) {
                              return MySnackbar.faliureSnackBar(
                                  data.error.toString());
                            } else {
                              return const Center(
                                child: Text(
                                  'No chats yet. Start chatting with someone',
                                ),
                              );
                            }
                          }
                        },
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return const Center(
                      child: Text('No chats yet. Start chatting with someone'));
                }
              }
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint(widget.userModel?.userId);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => SearchScreen(
                  userModel: widget.userModel,
                  firebaseUser: widget.firebaseUser,
                ),
              ),
            );
          },
          child: const Icon(Icons.search),
        ),
      ),
    );
  }
}
 */