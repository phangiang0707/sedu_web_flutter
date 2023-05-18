import 'package:http/http.dart' as http;

import '../../model/otd/category/postCategory.otd.dart';
import '../../utils/url.dart';

class PostCategoryControllerr {
  Future<PostCategoryOtd?> postCategory(String name, String description) async {
    var response = await http.post(Uri.parse('${url}categories'),
        body: {"name": name, "description": description});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 201) {
      return postCategoryOtdFromJson(response.body);
      //return loginEmailOtdFromJson(json.decode(response.body)['data']);
    } else {
      print('Error');
      return null;
    }
  }
}
