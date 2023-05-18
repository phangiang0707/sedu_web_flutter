import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../model/otd/users/getDetailUser.otd.dart';
import '../../utils/url.dart';

class GetDetailUserController {
  Future<GetDetailUserOtd?> getDetailUser(String id) async {
    final response = await http.get(Uri.parse('${url}users/${id}'));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return getDetailUserOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
