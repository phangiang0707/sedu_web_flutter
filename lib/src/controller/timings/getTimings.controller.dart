import '../../model/otd/timings/getTiming.otd.dart';
import 'package:http/http.dart' as http;

import '../../utils/url.dart';

class GetTimingsController {
  Future<List<GetTimingsOtd>?> getTiming(String id) async {
    final response =
        await http.get(Uri.parse('${url}classrooms/${id}/timings'));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return getTimingsOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
