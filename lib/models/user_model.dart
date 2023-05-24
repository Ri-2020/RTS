import 'dart:convert';

import 'package:rts/utils/constants.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? jwtoken;
  UserData? data;
  String? status;
  String? message;
  String? accountType;

  UserModel({
    this.jwtoken,
    this.data,
    this.status,
    this.message,
    this.accountType,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'jwtoken': jwtoken,
      'data': data?.toMap(),
      'status': status,
      'message': message,
      'accountType': accountType,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      jwtoken: map['jwtoken'] != null ? map['jwtoken'] as String : null,
      data: map['data'] != null
          ? UserData.fromMap(map['data'] as Map<String, dynamic>)
          : null,
      status: map['status'] != null ? map['status'] as String : null,
      message: map['message'] != null ? map['message'] as String : null,
      accountType:
          map['accountType'] != null ? map['accountType'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class UserData {
  String name;
  DateTime? birthDate;
  String rollNo;
  String email;
  String? mobile;
  String username;
  String id;
  String? profileImage;
  String? profileCreatedAt;
  LastUpdate? lastUpdate;
  bool? isOnline;
  bool? isProfileCompleted;
  bool? isMobileVerified;
  bool? isEmailVerified;
  List<dynamic>? follower;
  List<dynamic>? following;
  int? age;
  String? gender;
  String? bio;
  String? website;
  List<SocialMedia> socialMedia;
  List<String> skills;
  int? profileViews;
  UserData({
    required this.name,
    required this.rollNo,
    this.birthDate,
    required this.email,
    this.mobile,
    required this.username,
    required this.id,
    this.profileImage,
    this.profileCreatedAt,
    this.lastUpdate,
    this.isOnline,
    this.isProfileCompleted,
    this.isMobileVerified,
    this.isEmailVerified,
    this.follower,
    this.following,
    this.age,
    this.gender,
    this.bio,
    this.website,
    required this.socialMedia,
    required this.skills,
    this.profileViews,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'birthDate': birthDate?.millisecondsSinceEpoch,
      'email': email,
      'mobile': mobile,
      'username': username,
      '_id': id,
      'profileImage': profileImage,
      'profileCreatedAt': profileCreatedAt,
      'lastUpdate': lastUpdate?.toMap(),
      'isOnline': isOnline,
      'isProfileCompleted': isProfileCompleted,
      'isMobileVerified': isMobileVerified,
      'isEmailVerified': isEmailVerified,
      'follower': follower,
      'following': following,
      'age': age,
      'gender': gender,
      'bio': bio,
      'website': website,
      'socialMedia': socialMedia.map((x) => x.toMap()).toList(),
      'skills': skills,
      'profileViews': profileViews,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      name: map['name'],
      rollNo: map['rolNo'] ?? "",
      birthDate: map['birthDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['birthDate'] as int)
          : DateTime.now(),
      email: map['email'],
      mobile: map['mobile'] != null ? map['mobile'] as String : null,
      username: map['username'] ?? "",
      id: map['_id'],
      profileImage: map['profileImage'] != null
          ? map['profileImage']["url"] as String
          : Constants.image,
      profileCreatedAt: map['profileCreatedAt'] != null
          ? map['profileCreatedAt'] as String
          : "",
      lastUpdate: map['lastUpdate'] != null
          ? LastUpdate.fromMap(map['lastUpdate'] as Map<String, dynamic>)
          : null,
      isOnline: map['isOnline'] != null ? map['isOnline'] as bool : false,
      isProfileCompleted: map['isProfileCompleted'] != null
          ? map['isProfileCompleted'] as bool
          : false,
      isMobileVerified: map['isMobileVerified'] != null
          ? map['isMobileVerified'] as bool
          : false,
      isEmailVerified: map['isEmailVerified'] != null
          ? map['isEmailVerified'] as bool
          : false,
      follower: map['follower'] != null
          ? List<dynamic>.from(map['follower'] as List<dynamic>)
          : [],
      following: map['following'] != null
          ? List<dynamic>.from(map['following'] as List<dynamic>)
          : [],
      age: map['age'] != null ? map['age'] as int : 0,
      gender: map['gender'] ?? "",
      bio: map['bio'] ?? "",
      website: map['website'] ?? "",
      socialMedia: map['socialMedia'] != null
          ? List<SocialMedia>.from(
              (map['socialMedia'] as List<dynamic>).map<SocialMedia>(
                (x) => SocialMedia.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
      skills: map['skills'] == null ? [] : List<String>.from(map["skills"]),
      profileViews:
          map['profileViews'] != null ? map['profileViews'] as int : 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source) as Map<String, dynamic>);
}

class LastUpdate {
  String? whatUpdated;
  dynamic previousData;
  DateTime? dateTime;
  LastUpdate({
    this.whatUpdated,
    required this.previousData,
    this.dateTime,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'whatUpdated': whatUpdated,
      'previousData': previousData,
      'dateTime': dateTime?.millisecondsSinceEpoch,
    };
  }

  factory LastUpdate.fromMap(Map<String, dynamic> map) {
    return LastUpdate(
      whatUpdated:
          map['whatUpdated'] != null ? map['whatUpdated'] as String : null,
      previousData: map['previousData'] as dynamic,
      dateTime: map['dateTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LastUpdate.fromJson(String source) =>
      LastUpdate.fromMap(json.decode(source) as Map<String, dynamic>);
}

class SocialMedia {
  String? name;
  String id;
  String? link;
  bool process;
  SocialMedia({
    this.name,
    this.process = false,
    required this.id,
    this.link,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'link': link,
    };
  }

  factory SocialMedia.fromMap(Map<String, dynamic> map) {
    return SocialMedia(
      name: map['name'] != null ? map['name'] as String : null,
      id: map['_id'],
      link: map['link'] != null ? map['link'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SocialMedia.fromJson(String source) =>
      SocialMedia.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Document {
  String? documentName;
  String? documentType;
  dynamic documentImage;
  String? documentId;
  String? documentCreatedAt;
  String? documentLastUpdate;
  bool? isVerifiedDocument = false;
  bool? isRejectedDocument = false;
  bool? isProfileCompletedDocument = false;
  bool? isRequiredDocument;
  Document({
    this.documentName,
    this.documentType,
    required this.documentImage,
    this.documentId,
    this.documentCreatedAt,
    this.documentLastUpdate,
    this.isVerifiedDocument,
    this.isRejectedDocument,
    this.isProfileCompletedDocument,
    this.isRequiredDocument,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'documentName': documentName,
      'documentType': documentType,
      'documentImage': documentImage,
      'documentId': documentId,
      'documentCreatedAt': documentCreatedAt,
      'documentLastUpdate': documentLastUpdate,
      'isVerifiedDocument': isVerifiedDocument,
      'isRejectedDocument': isRejectedDocument,
      'isProfileCompletedDocument': isProfileCompletedDocument,
      'isRequiredDocument': isRequiredDocument,
    };
  }

  factory Document.fromMap(Map<String, dynamic> map) {
    return Document(
      documentName:
          map['documentName'] != null ? map['documentName'] as String : null,
      documentType:
          map['documentType'] != null ? map['documentType'] as String : null,
      documentImage: map['documentImage'] as dynamic,
      documentId:
          map['documentId'] != null ? map['documentId'] as String : null,
      documentCreatedAt: map['documentCreatedAt'] != null
          ? map['documentCreatedAt'] as String
          : null,
      documentLastUpdate: map['documentLastUpdate'] != null
          ? map['documentLastUpdate'] as String
          : null,
      isVerifiedDocument: map['isVerifiedDocument'] != null
          ? map['isVerifiedDocument'] as bool
          : null,
      isRejectedDocument: map['isRejectedDocument'] != null
          ? map['isRejectedDocument'] as bool
          : null,
      isProfileCompletedDocument: map['isProfileCompletedDocument'] != null
          ? map['isProfileCompletedDocument'] as bool
          : null,
      isRequiredDocument: map['isRequiredDocument'] != null
          ? map['isRequiredDocument'] as bool
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Document.fromJson(String source) =>
      Document.fromMap(json.decode(source) as Map<String, dynamic>);
}
