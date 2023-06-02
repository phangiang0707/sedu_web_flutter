// To parse this JSON data, do
//
//     final postCourseOtd = postCourseOtdFromJson(jsonString);

import 'dart:convert';

PostCourseOtd postCourseOtdFromJson(String str) =>
    PostCourseOtd.fromJson(json.decode(str));

String postCourseOtdToJson(PostCourseOtd data) => json.encode(data.toJson());

class PostCourseOtd {
  String name;
  String description;
  String rules;
  int price;
  String imageUrl;
  String categoryId;
  DateTime startDate;
  DateTime endDate;

  PostCourseOtd({
    required this.name,
    required this.description,
    required this.rules,
    required this.price,
    required this.imageUrl,
    required this.categoryId,
    required this.startDate,
    required this.endDate,
  });

  factory PostCourseOtd.fromJson(Map<String, dynamic> json) => PostCourseOtd(
        name: json["name"],
        description: json["description"],
        rules: json["rules"],
        price: json["price"],
        imageUrl: json["imageUrl"],
        categoryId: json["categoryId"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "rules": rules,
        "price": price,
        "imageUrl": imageUrl,
        "categoryId": categoryId,
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
      };
}
