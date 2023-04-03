class ChatRoomModel {

  ChatRoomModel({
    this.chatRoomId,
    this.participants,
    this.lastMessage,
  });

  factory ChatRoomModel.fromMap(Map<String, dynamic> map) {
    return ChatRoomModel(
      chatRoomId: map['chatRoomId'],
      participants: map['participants'],
      lastMessage: map['lastMessage'],
    );
  }
  String? chatRoomId;
  Map<String?, dynamic>? participants;
  String? lastMessage;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'chatRoomId': chatRoomId,
      'participants': participants,
      'lastMessage': lastMessage,
    };
  }
}
