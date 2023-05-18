import '../../model/otd/timings/postTiming.otd.dart';
import 'package:http/http.dart' as http;

import '../../utils/url.dart';

class PostTimingsController {
  Future<PostTimingsOtd?> postTimings(
      PostTimingsOtd postTimingsOtd, String id) async {
    final response = await http.post(
      Uri.parse('${url}classrooms/${id}/timings/add'),
      body: postTimingsOtdToJson(postTimingsOtd),
      headers: {
        "Content-Type": "application/json",
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 201) {
      return postTimingsOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
