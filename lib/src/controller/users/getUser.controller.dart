import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../model/otd/users/user.otd.dart';
import '../../utils/url.dart';

class GetUserController {
  Future<List<UserOtd>?> getUser() async {
    final response = await http.get(Uri.parse('${url}users'));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return userOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
