import '../../model/otd/class/postClass.otd.dart';

import 'package:http/http.dart' as http;

import '../../utils/url.dart';

class DeleteClassController {
  Future<PostClassOtd?> deleteClass(String id) async {
    final response = await http.delete(Uri.parse('${url}classrooms/${id}'));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return postClassOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
