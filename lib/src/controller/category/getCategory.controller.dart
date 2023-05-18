import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sedu_web_flutter/src/model/otd/category/category.otd.dart';

import '../../utils/url.dart';

class CategoryController {
  Future<List<CategoryOtd>> getCategory() async {
    final response = await http.get(Uri.parse('${url}categories'));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return categoryOtdFromJson(response.body);
    } else {
      return [];
    }
  }
}
