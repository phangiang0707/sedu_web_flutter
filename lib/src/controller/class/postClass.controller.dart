import '../../model/otd/class/postClass.otd.dart';

import 'package:http/http.dart' as http;

import '../../utils/url.dart';

class PostClassController {
  Future<PostClassOtd?> postClass(PostClassOtd postClassOtd) async {
    final response = await http.post(
      Uri.parse('${url}classrooms'),
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
