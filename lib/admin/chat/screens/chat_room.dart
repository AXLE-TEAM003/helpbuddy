import 'package:flutter/material.dart';
import 'package:helpbuddy/admin/chat/plagiarism/plagiarism.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../../api_client/api_client.dart';
import '../../../mymodels/myusermodels.dart';

Uuid uuid = const Uuid();

class ChatRoom extends StatefulWidget {
  const ChatRoom({
    Key? key,
    required this.userId,
    required this.partnerName,
    required this.partnerId,
    required this.conversationId,
    required this.token,
  }) : super(key: key);
  final int userId;
  final String partnerName;
  final int partnerId;
  final int conversationId;
  final String token;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SafeArea(
            child: Stack(children: [
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
                ],
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
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
                          margin: const EdgeInsets.only(top: 8.0, right: 8.0),
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
                      clicked
                          ? InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PlagiarismCheck()));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    right: 8.0, bottom: 10),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 12),
                                decoration: BoxDecoration(
                                    color: const Color(0xFF0053A1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                        'assets/icons/submit_button.png'),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      'Submit Project',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container()
                    ],
                  ))
            ]),
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
                                      currentMessage.sender == widget.userId
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
                                        borderRadius: BorderRadius.circular(8),
                                        color: (currentMessage.sender ==
                                                widget.userId)
                                            ? const Color(0xffD2D4D8)
                                            : const Color(0xffFFF0E6),
                                      ),
                                      child: Text(
                                        currentMessage.content,
                                        textAlign: currentMessage.sender ==
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
                                      timeFormat
                                          .format(currentMessage.createdAt),
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
          MessageInputField(
              notifierRef: chatNotifierValue,
              conversationId: widget.conversationId,
              token: widget.token)
        ],
      ),
    );
  }
}

class MessageInputField extends StatefulWidget {
  MessageInputField(
      {required this.notifierRef,
      required this.conversationId,
      required this.token});
  ValueNotifier<int> notifierRef;
  String token;
  int conversationId;

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
