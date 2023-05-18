import 'package:sedu_web_flutter/src/model/otd/class/postClass.otd.dart';
import 'package:http/http.dart' as http;

import '../../utils/url.dart';

class PutClassController {
  Future<PostClassOtd?> putClass(String id, PostClassOtd postClassOtd) async {
    final response = await http.put(
      Uri.parse('${url}classrooms/${id}'),
      body: postClassOtdToJson(postClassOtd),
      headers: {
        "Content-Type": "application/json",
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return postClassOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
