import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rts/models/chat_model.dart';
import 'package:rts/remote/doubt/doubt_api_services.dart';
import 'package:rts/repositories/doubt_repo/doubt_repo.dart';

class DoubtRepoImp extends DoubtRepo {
  DoubtApiServices doubtApiServices = DoubtApiServices();
  @override
  Future<List<ChatModel>> getDoubts() async {
    Map<String, dynamic>? res = await doubtApiServices.getDoubts();
    List<ChatModel> chats;
    // debugPrint("common Repo Imp $res");
    if (res != null && res["data"].isNotEmpty) {
      chats = res["data"].map((e) => ChatModel.fromMap(e)).toList();
      return chats;
    }
    return [];
  }

  // @override
  // Future<List<UserData>> getSearchedUsers(String query) async {
  //   Map<String, dynamic>? res = await doubtApiServices.getSearchedUsers(query);
  //   List<UserData> chatUsers = [];
  //   debugPrint("getSearchedUsers response : $res");
  //   if (res != null && res.isNotEmpty) {
  //     chatUsers =
  //         res["data"].map<UserData>((e) => UserData.fromMap(e)).toList();
  //     return chatUsers;
  //   }
  //   showSnackBar(Get.context!, res!["message"], false);
  //   return [];
  // }

  @override
  Future<Map<String, dynamic>> sendMessageToUser(
      String receiverUserId, String message) async {
    Map<String, dynamic>? res =
        await doubtApiServices.sendMessageToUser(receiverUserId, message);
    debugPrint("send message Repo Imp $res");
    if (res != null && res.isNotEmpty) {
      return res["data"];
    }
    return {};
  }

  @override
  Future<Map<String, dynamic>> deleteChat(
    String senderReceiverId,
    List<String> idsForDelete,
  ) async {
    Map<String, dynamic>? res =
        await doubtApiServices.deleteChat(senderReceiverId, idsForDelete);
    debugPrint("chat detele Repo Imp $res");
    if (res != null && res.isNotEmpty) {
      return res;
    }
    return {};
  }

  @override
  Future<bool> setIsSend(String chatId) async {
    Map<String, dynamic>? res = await doubtApiServices.setIsSend(chatId);
    debugPrint("chat setIsSend Repo Imp $res");
    if (res != null && res["status"] == "success") {
      return true;
    }
    return false;
  }

  @override
  Future<Map<String, dynamic>> functionality(
      String senderReceiverId, String chatId, Map body) async {
    Map<String, dynamic>? res =
        await doubtApiServices.functionality(senderReceiverId, chatId, body);
    debugPrint("chat functionality Repo Imp $res");
    if (res != null && res.isNotEmpty) {
      return res;
    }
    return {};
  }
}
