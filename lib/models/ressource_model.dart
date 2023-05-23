import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Resource {
  String title;
  String description;
  String? link;
  List<String> category;
  String createdAt;
  String updatedAt;
  bool isEdited;
  Resource({
    required this.title,
    required this.description,
    this.link,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
    required this.isEdited,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'link': link,
      'category': category,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'isEdited': isEdited,
    };
  }

  factory Resource.fromMap(Map<String, dynamic> map) {
    return Resource(
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      link: map['link'] != null ? map['link'] as String : null,
      category: List<String>.from((map['category'] as List<String>)),
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      isEdited: map['isEdited'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Resource.fromJson(String source) =>
      Resource.fromMap(json.decode(source) as Map<String, dynamic>);
}
