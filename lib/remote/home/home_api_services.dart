import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rts/remote/api_constants.dart';
import 'package:rts/utils/shared_prefer.dart';

class HomeApiService {
  Future<Map<String, dynamic>> getLoggedInUser() async {
    const api = "$baseUrl/account/auth/";
    String token = (await SharedPrefs.getString("token"))!;
    var res = await http.get(Uri.parse(api), headers: {
      "Authorization": "Bearer $token",
    });
    if (res != null) return jsonDecode(res.body);
    return {};
  }
}
