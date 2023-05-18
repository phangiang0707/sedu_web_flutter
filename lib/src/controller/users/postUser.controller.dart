import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../model/otd/users/user.otd.dart';
import '../../utils/url.dart';

class postUserController {
  Future<List<UserOtd>> postUser() async {
    final response = await http.post(Uri.parse('${url}users/register'));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return userOtdFromJson(response.body);
    } else {
      return [];
    }
  }
}
