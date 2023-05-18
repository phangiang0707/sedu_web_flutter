import 'dart:convert';

List<CategoryOtd> categoryOtdFromJson(String str) => List<CategoryOtd>.from(
    json.decode(str).map((x) => CategoryOtd.fromJson(x)));

String categoryOtdToJson(List<CategoryOtd> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryOtd {
  String id;
  String name;
  String description;

  CategoryOtd({
    required this.id,
    required this.name,
    required this.description,
  });

  factory CategoryOtd.fromJson(Map<String, dynamic> json) => CategoryOtd(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };
}
