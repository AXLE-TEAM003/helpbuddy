import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/api_client/api_client.dart';
import 'package:helpbuddy/constants/dimensions.dart';
import 'package:helpbuddy/user/chat/screens/change_delivery_date.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../../mymodels/myusermodels.dart';

Uuid uuid = const Uuid();

class ChatRoom extends StatefulWidget {
  const ChatRoom(
      {Key? key,
      required this.userId,
      required this.partnerName,
      required this.conversationId,
      required this.token,
      this.support})
      : super(key: key);
  final int userId;
  final String partnerName;
  final int conversationId;
  final String token;
  final bool? support;

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  TextEditingController messageController = TextEditingController();
  ValueNotifier<int> chatNotifierValue = ValueNotifier<int>(0);
  ScrollController scrollController = ScrollController();

  List<Message> messages = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getMessages(widget.token, widget.conversationId).then((response) {
      print(response);
      setState(() {
        messages = response.map((json) => Message.fromJson(json)).toList();
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

  getMess() {
    getMessages(widget.token, widget.conversationId).then((response) {
      if (mounted) {
        setState(() {
          messages = response.map((json) => Message.fromJson(json)).toList();
        });
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    messageController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  DateFormat timeFormat = DateFormat('hh:mm a');

  bool clicked = false;

  bool blocked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Icon(Icons.arrow_back_ios,
                            color: Colors.black, size: 20),
                      ),
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.partnerName,
                          style: const TextStyle(color: Colors.black),
                        ),
                        const Text(
                          'Online',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                      'assets/icons/verified.png',
                      width: 20,
                      height: 20,
                    )
                  ],
                ),
                Container(
                  color: const Color.fromARGB(148, 158, 158, 158),
                  height: 1,
                  width: double.maxFinite,
                ),
                Expanded(
                    child: ValueListenableBuilder<int>(
                  valueListenable: chatNotifierValue,
                  builder: (BuildContext context, int value, Widget? child) {
                    chatNotifierValue.value != 0 ? getMess() : {};
                    return isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            shrinkWrap: true,
                            reverse: false,
                            controller: scrollController,
                            itemCount: messages.length,
                            itemBuilder: (BuildContext context, int index) {
                              Message currentMessage = messages[index];
                              return Row(
                                mainAxisAlignment:
                                    currentMessage.sender == widget.userId
                                        ? MainAxisAlignment.end
                                        : MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  InkWell(
                                    onLongPress: () async {},
                                    onDoubleTap: () async {
                                      // edit message
                                      if (messageController.text.isNotEmpty) {}
                                    },
                                    borderRadius: BorderRadius.circular(20),
                                    splashColor: Colors.green,
                                    child: Container(
                                      margin: const EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment:
                                            currentMessage.sender ==
                                                    widget.userId
                                                ? CrossAxisAlignment.end
                                                : CrossAxisAlignment.start,
                                        children: [
                                          Container(
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
                                                      widget.userId)
                                                  ? const Color(0xffD2D4D8)
                                                  : const Color(0xffFFF0E6),
                                            ),
                                            child: Text(
                                              currentMessage.content,
                                              textAlign:
                                                  currentMessage.sender ==
                                                          widget.userId
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
                                            timeFormat.format(
                                                currentMessage.createdAt),
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
                  },
                )),
                blocked
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 20.0),
                            child: Text(
                              'Chats blocked',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      )
                    : MessageInputField(
                        notifierRef: chatNotifierValue,
                        conversationId: widget.conversationId,
                        token: widget.token)
              ],
            ),
            Align(
                alignment: Alignment.topRight,
                child: Stack(
                  children: [
                    clicked
                        ? Align(
                            alignment: Alignment.topRight,
                            child: Container(
                                margin: const EdgeInsets.only(
                                    right: 8.0, bottom: 10, top: 30),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                    color: const Color(0xFF0053A1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      optionItem(
                                          'Change delivery date',
                                          const ChangeDate(),
                                          Image.asset('assets/icons/date.png')),
                                      InkWell(
                                        onTap: () => addBalanceModal(context),
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 3),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 10),
                                          decoration: const BoxDecoration(
                                            color:
                                                Color.fromARGB(19, 0, 49, 94),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Image.asset(
                                                  'assets/icons/payment.png'),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Text(
                                                'Make Payments',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            blocked = true;
                                          });
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 3),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 10),
                                          decoration: const BoxDecoration(
                                            color:
                                                Color.fromARGB(19, 0, 49, 94),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Image.asset(
                                                  'assets/icons/block.png'),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Text(
                                                'Block',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ])),
                          )
                        : Container(),
                    widget.support ?? false
                        ? Container()
                        : Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  if (clicked) {
                                    clicked = false;
                                  } else {
                                    clicked = true;
                                  }
                                });
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.only(top: 8.0, right: 8.0),
                                padding: const EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF0053A1),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      'Options',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Icon(
                                      clicked
                                          ? Icons.keyboard_arrow_up_rounded
                                          : Icons.keyboard_arrow_down_rounded,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget optionItem(String title, Widget destination, Image icon) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => destination));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 3),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: const BoxDecoration(
          color: Color.fromARGB(19, 0, 49, 94),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageInputField extends StatefulWidget {
  const MessageInputField(
      {super.key,
      required this.notifierRef,
      required this.conversationId,
      required this.token});
  final ValueNotifier<int> notifierRef;
  final String token;
  final int conversationId;

  @override
  _MessageInputFieldState createState() => _MessageInputFieldState();
}

class _MessageInputFieldState extends State<MessageInputField> {
  TextEditingController _textEditingController = TextEditingController();
  bool _isTyping = false;

  void _onTextChanged() {
    setState(() {
      _isTyping = _textEditingController.text.isNotEmpty;
    });
  }

  void _sendMessage() {
    if (_textEditingController.text.isNotEmpty) {
      // Implement your logic to send the message here
      sendMessage(
              widget.token, widget.conversationId, _textEditingController.text)
          .then((response) {
        widget.notifierRef.value++;
      });
      // Update message ui ...

      _textEditingController.clear();
      setState(() {
        _isTyping = false;
      });
    }
  }

  void _onMicPressed() {
    // Implement your logic for microphone button here
    print('Microphone button pressed');
  }

  void _onAttachmentPressed() {
    // Implement your logic for attachment button here
    print('Attachment button pressed');
  }

  void _onCameraPressed() {
    // Implement your logic for camera button here
    print('Camera button pressed');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.grey[300], // Set the background color
                borderRadius:
                    BorderRadius.circular(16), // Set the border radius
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      onChanged: (value) => _onTextChanged(),
                      decoration: const InputDecoration(
                        hintText: 'Type a message...',
                        border: InputBorder
                            .none, // Remove the default underline border
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.camera_alt_outlined),
                    color: Colors.blue, // Set the icon color
                    onPressed: _onCameraPressed,
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: _isTyping
                ? const Icon(Icons.send)
                : Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Transform.rotate(
                      alignment: Alignment.center,
                      angle: 0.785398,
                      child: IconButton(
                        icon: const Icon(Icons.attach_file),
                        color: Colors.blue, // Set the icon color
                        onPressed: _onAttachmentPressed,
                      ),
                    ),
                  ),
            color: _isTyping
                ? Theme.of(context)
                    .primaryColor // Use primary color for send icon
                : Colors.grey, // Set the icon color for microphone icon
            onPressed: _isTyping ? _sendMessage : _onMicPressed,
          ),
        ],
      ),
    );
  }
}

void addBalanceModal(BuildContext context) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40 * factor),
            topRight: Radius.circular(40 * factor)),
      ),
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(left: 30 * factor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: Container()),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 15.0 * factor, right: 15.0 * factor),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.clear_rounded,
                          size: 30 * factor,
                        )),
                  )
                ],
              ),
              balanceLabels('Your Total balance:', '£1000'),
              balanceLabels('Amount Deposited:', '£750'),
              balanceLabels('Referral Bonus:', '£250'),
              Text('*Note that 1twgo = £20',
                  style: GoogleFonts.urbanist(
                    fontSize: 14 * factor,
                    color: const Color.fromARGB(255, 129, 129, 129),
                    fontWeight: FontWeight.w600,
                  )),
              Expanded(child: Container()),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, '/user/add-balance/make-payment');
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 8 * factor, horizontal: 12 * factor),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12 * factor),
                          color: const Color(0xff2781E1)),
                      child: Center(
                        child: Text('Add balance',
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 14 * factor,
                            )),
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 8 * factor, horizontal: 12 * factor),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12 * factor),
                          border: Border.all(
                              color: const Color.fromARGB(255, 37, 37, 37),
                              width: 1.2 * factor)
                          // color: const Color(0xff2781E1)
                          ),
                      child: Center(
                        child: Text('View history',
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w400,
                              color: const Color.fromARGB(255, 37, 37, 37),
                              fontSize: 14 * factor,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30 * factor,
                  )
                ],
              ),
              SizedBox(
                height: 20 * factor,
              )
            ],
          ),
        );
      });
}

Widget balanceLabels(String label, String balance) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: GoogleFonts.urbanist(
          fontSize: 16 * factor,
          fontWeight: FontWeight.w600,
        ),
      ),
      SizedBox(
        height: 4 * factor,
      ),
      Text(balance,
          style: TextStyle(
              fontSize: 32 * factor,
              fontWeight: FontWeight.w500,
              color: const Color.fromARGB(255, 85, 85, 85))),
      SizedBox(
        height: 12 * factor,
      )
    ],
  );
}

Future<List<dynamic>> getMessages(String token, int conversationId) async {
  final response = await ApiClient(authToken: token)
      .get('conversations/$conversationId/messages');
  return response;
}

sendMessage(String token, int conversationId, String message) async {
  final response = await ApiClient(authToken: token).post(
      'conversations/send-message',
      {"conversation_id": conversationId, "content": message});
  return response;
}
