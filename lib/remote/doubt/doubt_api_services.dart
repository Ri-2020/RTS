import 'dart:convert';
import 'package:rts/remote/api_constants.dart';
import 'package:rts/remote/api_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class DoubtApiServices extends DoubtApiInterface {
  @override
  Future<Map<String, dynamic>>? getDoubts() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token")!;
    String senderUserId = sharedPreferences.getString("userId")!;

    String api = "$baseUrl/api/user/chat/getChat/";

    var response = await http.get(Uri.parse(api), headers: {
      "Authorization": "Bearer $token",
    });
    if (response == null) {
      return {};
    }
    Map<String, dynamic> res = jsonDecode(response.body);
    return res;
  }

  @override
  Future<Map<String, dynamic>>? getAllChatUsers() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token")!;
    String senderUserId = sharedPreferences.getString("userId")!;
    String api = "$baseUrl/chat/getAllUser/$senderUserId";
    var response = await http.get(Uri.parse(api), headers: {
      "Authorization": "Bearer $token",
    });
    if (response == null) {
      return {};
    }
    Map<String, dynamic> res = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (res.isNotEmpty) {
        return res;
      }
    }
    return res;
  }

  @override
  Future<Map<String, dynamic>>? sendMessageToUser(
      String receiverUserId, String message) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token")!;
    String senderUserId = sharedPreferences.getString("userId")!;
    String api =
        "$baseUrl/api/user/chat/sendMessage/$senderUserId/$receiverUserId";
    var response = await http.post(
      Uri.parse(api),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: {"message": message, "timestamp": DateTime.now().toString()},
    );
    if (response == null) {
      return {};
    }
    Map<String, dynamic> res = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (res.isNotEmpty) {
        return res;
      }
    }
    return res;
  }

  @override
  Future<Map<String, dynamic>>? deleteChat(
      String chatId, List<String> idsForDelete) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token")!;
    // // print("chatId : $chatId");
    String api = "$baseUrl/api/user/chat/deleteChat/$chatId";
    var response = await http.post(
      Uri.parse(api),
      body: {},
      headers: {
        "Authorization": "Bearer $token",
      },
    );
    if (response == null) {
      return {};
    }
    Map<String, dynamic> res = jsonDecode(response.body);
    return res;
  }

  @override
  Future<Map<String, dynamic>>? functionality(
      String chatId, String id, Map body) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token")!;
    // // print("chatId : $chatId");
    String api = "$baseUrl/api/user/chat/functionality/$chatId";
    var response = await http.post(Uri.parse(api),
        headers: {
          "Authorization": "Bearer $token",
        },
        body: body);
    // print("response : ${response.body}");
    if (response == null) {
      return {};
    }
    Map<String, dynamic> res = jsonDecode(response.body);
    return res;
  }

  @override
  Future<Map<String, dynamic>>? getSearchedUsers(String query) {
    // TODO: implement getSearchedUsers
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>>? setIsSend(String chatId) {
    // TODO: implement setIsSend
    throw UnimplementedError();
  }
}
