import '../../model/otd/users/getDetailUser.otd.dart';
import 'package:http/http.dart' as http;

import '../../utils/url.dart';

class LoginController {
  Future<GetDetailUserOtd?> login(String email) async {
    final response = await http
        .post(Uri.parse('${url}users/loginByEmail'), body: {"email": email});
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 201) {
      return getDetailUserOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
