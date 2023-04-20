import 'dart:convert';

import 'package:rts/utils/shared_prefer.dart';
import 'package:rts/utils/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future callAndErrorHendling(
    {required Function callback,
    required Function errorOccurFunction,
    required String url,
    required String method,
    required Map body,
    required BuildContext context,
    String? error}) async {
  try {
    String token = (await SharedPrefs.getString("token")) ?? "";
    print("Calling api $url");
    final response;
    if (method == "get") {
      response = await http.get(Uri.parse(url), headers: {
        "authorization": "Bearer $token",
      });
    } else if (method == "post") {
      response = await http.post(Uri.parse(url), body: body, headers: {
        "authorization": "Bearer $token",
      });
    } else {
      response = await http.put(Uri.parse(url), body: body, headers: {
        "authorization": "Bearer $token",
      });
    }
    if (response != null &&
        (response.statusCode == 200 || response.statusCode == 201)) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print("data $data");
      callback(data);
    } else {
      Map<String, dynamic>? data;
      print("error 400 $url : ${response.body}");
      if (response != null) data = jsonDecode(response.body);
      errorOccurFunction();
      showSnackBar(context, jsonDecode(response.body)["msg"], true);
    }
  } catch (e) {
    showSnackBar(context, "Something went wrong", true);
    print("error catch  $url : ${e.toString()}");
  }
}
