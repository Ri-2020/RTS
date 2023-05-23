import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rts/remote/api_constants.dart';
import 'package:rts/utils/shared_prefer.dart';

class ProfileApiServices {
  Future<Map<String, dynamic>> updateProfile(Map<String, dynamic> data) async {
    String api = "$baseUrl/account/auth/update-profile";
    String token = (await SharedPrefs.getString("token"))!;
    var res = await http.post(Uri.parse(api),
        headers: {
          "Authorization": "Bearer $token",
        },
        body: data);
    print(res.body);
    if (res != null) {
      return jsonDecode(res.body);
    }
    return {};
  }

  Future<Map<String, dynamic>> addSkillAndSocialMedia(
      Map<String, dynamic> data) async {
    String api = "$baseUrl/account/auth/add-skill-socialMedia";
    String token = (await SharedPrefs.getString("token"))!;
    var res = await http.post(Uri.parse(api),
        headers: {
          "Authorization": "Bearer $token",
        },
        body: data);
    print(res.body);
    if (res != null) {
      return jsonDecode(res.body);
    }
    return {};
  }

  Future<Map<String, dynamic>> removeSkillAndSocialMedia(
      Map<String, dynamic> data) async {
    String api = "$baseUrl/account/auth/remove-skill-socialMedia";
    String token = (await SharedPrefs.getString("token"))!;
    var res = await http.post(Uri.parse(api),
        headers: {
          "Authorization": "Bearer $token",
        },
        body: data);
    print(res.body);
    if (res != null) {
      return jsonDecode(res.body);
    }
    return {};
  }
}
