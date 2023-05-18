// To parse this JSON data, do
//
//     final postCategoryOtd = postCategoryOtdFromJson(jsonString);

import 'dart:convert';

PostCategoryOtd postCategoryOtdFromJson(String str) =>
    PostCategoryOtd.fromJson(json.decode(str));

String postCategoryOtdToJson(PostCategoryOtd data) =>
    json.encode(data.toJson());

class PostCategoryOtd {
  String name;
  String description;
  String id;

  PostCategoryOtd({
    required this.name,
    required this.description,
    required this.id,
  });

  factory PostCategoryOtd.fromJson(Map<String, dynamic> json) =>
      PostCategoryOtd(
        name: json["name"],
        description: json["description"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "id": id,
      };
}
