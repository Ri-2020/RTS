import 'dart:convert';

import 'package:rts/remote/api_constants.dart';
import 'package:http/http.dart' as http;

class ResourceApiService {
  Future<Map<String, dynamic>> getAllResources() async {
    const api = "$baseUrl/resource/get-resources";
    var res = await http.get(
      Uri.parse(api),
    );
    if (res != null) {
      return jsonDecode(res.body);
    }
    return {};
  }
}
