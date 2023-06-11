class Info {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String nationality;
  final String gender;

  Info({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.nationality,
    required this.gender,
  });

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      nationality: json['nationality'],
      gender: json['gender'],
    );
  }
}

class Funds {
  final String totalBalance;
  final String deposit;
  final String referralBonus;

  Funds({
    required this.totalBalance,
    required this.deposit,
    required this.referralBonus,
  });

  factory Funds.fromJson(Map<String, dynamic> json) {
    return Funds(
      totalBalance: json['total_balance'],
      deposit: json['deposit'],
      referralBonus: json['referral_bonus'],
    );
  }
}

class UserInfo {
  final Info info;
  final Funds funds;

  UserInfo({
    required this.info,
    required this.funds,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      info: Info.fromJson(json['info']),
      funds: Funds.fromJson(json['funds']),
    );
  }
}

class Project {
  final int id;
  final String title;
  final String department;
  final String category;
  final String budget;
  final String serviceType;
  final String deliveryDate;
  final String user;
  final int? userId;
  final String? admin;
  final String status;

  Project({
    required this.id,
    required this.title,
    required this.department,
    required this.category,
    required this.budget,
    required this.serviceType,
    required this.deliveryDate,
    required this.user,
    required this.userId,
    required this.admin,
    required this.status,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      title: json['title'],
      department: json['department'],
      category: json['category'],
      budget: json['budget'],
      serviceType: json['service_type'],
      deliveryDate: json['delivery_date'],
      user: json['user'],
      userId: json['user_id'],
      admin: json['admin'],
      status: json['status'],
    );
  }
}

class Notifications {
  int id;
  int userId;
  String message;
  String details;
  bool isRead;
  String createdAt;

  Notifications({
    required this.id,
    required this.userId,
    required this.message,
    required this.details,
    required this.isRead,
    required this.createdAt,
  });

  factory Notifications.fromJson(Map<String, dynamic> json) {
    return Notifications(
      id: json['id'] as int,
      userId: json['user'] as int,
      message: json['message'] as String,
      details: json['details'] as String,
      isRead: json['is_read'] as bool,
      createdAt: json['created_at'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': userId,
      'message': message,
      'details': details,
      'is_read': isRead,
      'created_at': createdAt,
    };
  }

  @override
  String toString() {
    return message;
  }
}

class Conversation {
  final int id;
  final DateTime createdAt;
  final List<Participant> participants;
  final String title;
  final LatestMessage? latest;
  final int unread;

  Conversation(
      {required this.id,
      required this.createdAt,
      required this.participants,
      required this.latest,
      required this.unread,
      required this.title});

  factory Conversation.fromJson(Map<String, dynamic> json) {
    return Conversation(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      participants: List<Participant>.from(json['participants']
          .map((participant) => Participant.fromJson(participant))),
      title: json['title'],
      latest: json['latest_message'] == null
          ? null
          : LatestMessage.fromJson(json['latest_message']),
      unread: json['unread_messages_count'],
    );
  }
}

class LatestMessage {
  final int id;
  final String content;
  final int sender;
  final String senderName;
  final DateTime createdAt;

  LatestMessage({
    required this.id,
    required this.content,
    required this.sender,
    required this.senderName,
    required this.createdAt,
  });

  factory LatestMessage.fromJson(Map<String, dynamic> json) {
    return LatestMessage(
      id: json['id'],
      content: json['content'],
      sender: json['sender'],
      senderName: json['sender_name'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}

class Participant {
  final int id;
  final String name;

  Participant({
    required this.id,
    required this.name,
  });

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Message {
  int sender;
  String content;
  DateTime createdAt;

  Message({
    required this.sender,
    required this.content,
    required this.createdAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      sender: json['sender'],
      content: json['content'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
