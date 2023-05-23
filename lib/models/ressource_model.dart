import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Resource {
  String title;
  String id;
  String description;
  String? link;
  List<String> category;
  bool isEdited;
  Resource({
    required this.title,
    required this.id,
    required this.description,
    this.link,
    required this.category,
    required this.isEdited,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'link': link,
      "id": id,
      'category': category,
      'isEdited': isEdited,
    };
  }

  factory Resource.fromMap(Map<String, dynamic> map) {
    return Resource(
      title: map['title'] ?? "",
      id: map['_id'],
      description: map['description'] ?? "",
      link: map['link'] != null ? map['link'] as String : "",
      category: map['category'] != null
          ? List<String>.from((map['category'] as List<dynamic>))
          : [],
      isEdited: map['isEdited'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Resource.fromJson(String source) =>
      Resource.fromMap(json.decode(source) as Map<String, dynamic>);
}
