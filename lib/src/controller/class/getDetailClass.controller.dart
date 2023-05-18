import '../../model/otd/class/getDetailClass.otd.dart';
import 'package:http/http.dart' as http;

import '../../utils/url.dart';

class GetDetailClassController {
  Future<GetDetailClassOtd?> getDetailClassOtd(String id) async {
    final response = await http.get(Uri.parse('${url}classrooms/${id}'));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return getDetailClassOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
