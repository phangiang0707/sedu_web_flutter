import 'package:sedu_web_flutter/src/model/otd/class/getDetailClass.otd.dart';
import 'package:http/http.dart' as http;

import '../../utils/url.dart';

class RemoveGroupChatController {
  Future<GetDetailClassOtd?> removeGroupChat(String id) async {
    final response =
        await http.delete(Uri.parse('${url}classrooms/${id}/deleteGroupChat'));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 204) {
      return getDetailClassOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
