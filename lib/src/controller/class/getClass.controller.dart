import '../../model/otd/class/getClass.otd.dart';

import 'package:http/http.dart' as http;

import '../../utils/url.dart';

class GetClassController {
  Future<List<GetClassOtd>?> getClass() async {
    final response = await http.get(Uri.parse('${url}classrooms'));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return getClassOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
