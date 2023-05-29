import 'package:sedu_web_flutter/src/model/otd/class/getDetailClass.otd.dart';
import 'package:http/http.dart' as http;

import '../../utils/url.dart';

class CreateGroupChatController {
  Future<GetDetailClassOtd?> createGroupChat(String id) async {
    final response = await http.post(
      Uri.parse('${url}classrooms/${id}/createGroupChat'),
      headers: {
        "Content-Type": "application/json",
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 204) {
      return getDetailClassOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
