import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../model/otd/users/postUser.otd.dart';
import '../../utils/url.dart';

class PostUserController {
  Future<PostUserOtd?> postUser(PostUserOtd postUserOtd) async {
    final response = await http.post(
      Uri.parse('${url}users/register'),
      body: postUserOtdToJson(postUserOtd),
      headers: {
        "Content-Type": "application/json",
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return postUserOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
