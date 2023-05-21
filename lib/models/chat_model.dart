import 'dart:convert';

import 'package:rts/utils/constants.dart';

class Doubt {
  final String username; //
  final String userImage;
  final String name; //
  final String userId; //
  final String id; //
  final List<Reply>? replies; //
  bool isEdited; //
  final String text; //
  final List? images; //
  final DateTime createdAt; //
  final DateTime? updatedAt;
  final int? likes; //

  Doubt({
    required this.userId,
    this.replies,
    this.likes,
    required this.username, //
    required this.id,
    required this.userImage, //
    required this.name, //
    required this.isEdited,
    required this.text,
    this.images,
    required this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'isEdited': isEdited,
      'text': text,
      'images': images,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt!.millisecondsSinceEpoch,
      '_id': id,
      'userId': userId,
      'name': name,
      'userImage': userImage,
    };
  }

  factory Doubt.fromMap(Map<String, dynamic> map) {
    return Doubt(
      username: map['username'] as String,
      isEdited: map['isEdited'] ?? false,
      text: map['text'] as String,
      images: map['image'] != null && map['image'] != []
          ? List<dynamic>.from((map['image'] as List<dynamic>))
          : [],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt:
          map['updatedAt'] != null ? DateTime.parse(map['updatedAt']) : null,
      id: map['_id'] as String,
      name: map['name'] ?? "",
      userImage: map['userImage']["url"] ?? Constants.image,
      replies: map['image'] != null && map['replies'] != []
          ? List<Reply>.from((map['replies'] as List))
          : [],
      likes: map['likes'] != null ? map["likes"].length : 0,
      userId: map['userId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Doubt.fromJson(String source) =>
      Doubt.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Reply {
  final String user;
  bool isEdited;
  final String text;
  final DateTime createdAt;
  final DateTime updatedAt;
  Reply({
    required this.user,
    required this.isEdited,
    required this.text,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user,
      'isEdited': isEdited,
      'text': text,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory Reply.fromMap(Map<String, dynamic> map) {
    return Reply(
      user: map['user'] as String,
      isEdited: map['isEdited'] as bool,
      text: map['text'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Reply.fromJson(String source) =>
      Reply.fromMap(json.decode(source) as Map<String, dynamic>);
}
