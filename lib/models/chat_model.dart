import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ChatModel {
  final String id;
  final String message;
  final String sendBy;
  final String senderUserId;
  final DateTime createdAt;
  final bool isSent;
  final String messageType;
  final bool isPinned;
  bool selected = false;
  ChatModel({
    required this.message,
    required this.sendBy,
    required this.senderUserId,
    required this.createdAt,
    required this.isSent,
    required this.id,
    required this.messageType,
    required this.isPinned,
    this.selected = false,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      '_id': id,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'isSent': isSent,
      'messageType': messageType,
      'isPinned': isPinned,
      'sendBy': sendBy,
      'senderUserId': senderUserId,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      message: map['message'] as String,
      id: map['_id'] as String,
      createdAt: DateTime.parse(map['timestamp']),
      isSent: map['isSent'] as bool,
      messageType: map['messageType'] as String,
      isPinned: map['isPinned'] as bool,
      sendBy: map['sendBy'] as String,
      senderUserId: map['senderUserId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) =>
      ChatModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
