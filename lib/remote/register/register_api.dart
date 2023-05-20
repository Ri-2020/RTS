import 'dart:convert';

import 'package:rts/remote/api_constants.dart';
import 'package:http/http.dart' as http;

class RegisterApi {
  static Future<Map<String, dynamic>> signupUser(
      Map<String, String> data) async {
    const api = "$baseUrl/account/auth/signup";
    var res = await http.post(
      Uri.parse(api),
      body: data,
    );
    if (res != null) {
      return jsonDecode(res.body);
    }
    return {};
  }

  static Future<Map<String, dynamic>> signinUser(
      Map<String, String> data) async {
    const api = "$baseUrl/account/auth/signin";
    var res = await http.post(
      Uri.parse(api),
      body: data,
    );
    if (res != null) {
      return jsonDecode(res.body);
    }
    return {};
  }
}
