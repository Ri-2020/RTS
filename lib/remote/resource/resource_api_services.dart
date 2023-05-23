import 'dart:convert';

import 'package:rts/remote/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:rts/utils/shared_prefer.dart';

class ResourceApiService {
  Future<Map<String, dynamic>> getAllResources() async {
    const api = "$baseUrl/resource/get-resources";
    String token = (await SharedPrefs.getString("token"))!;
    var res = await http.get(
      Uri.parse(api),
      headers: {
        "Authorization": "Bearer $token",
      },
    );
    // print("res resources : ${res.body}");
    if (res != null) {
      return jsonDecode(res.body);
    }
    return {};
  }
}
