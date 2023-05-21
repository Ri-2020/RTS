import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rts/models/chat_model.dart';
import 'package:rts/remote/api_constants.dart';
import 'package:rts/repositories/doubt_repo/doubt_repo_imp.dart';
import 'package:rts/ui/doubt/doubt.dart';
import 'package:rts/ui/home/home_vm.dart';
import 'package:rts/utils/shared_prefer.dart';
import 'package:rts/widgets/snackbar.dart';

import 'package:socket_io_client/socket_io_client.dart' as io;

class DoubtVM extends GetxController {
  List<MessageModel> messages = [];
  List<ChatModel> selectedChatList = [];
  bool showBottomNavigation = false;

  bool showEnojiOption = false;
  String selectedChatId = "";
  int? selectedIndex;
  bool sendButton = false;
  bool loading = false;
  String frowardedText = "";
  final ScrollController scrollController = ScrollController();
  FocusNode focusNode = FocusNode();
  final TextEditingController txtController = TextEditingController();
  late io.Socket socket;
  String? senderUserId;

  @override
  void onInit() {
    super.onInit();
    // initSocket();
    // getDoubts();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        showEnojiOption = false;
      }
      update();
    });
  }

  void initSocket() async {
    print("init socket");
    socket = io.io(baseUrl, <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false
    });
    senderUserId = await SharedPrefs.getString("userId");
    socket.connect();
    print("socket connection : $senderUserId");
    socket.emit("signin", senderUserId);

    socket.onConnect((data) {
      print("message : $data");
      socket.on("message", (msg) {
        print("message : $msg");
        Map<String, dynamic> res = msg;
        if (res["status"] == "success") {
          ChatModel chat = ChatModel.fromMap(res["data"]);
          var response = doubtRepoImp.setIsSend(chat.id);
          setMessage(res["data"]);
        }
      });
    });
    socket.onDisconnect((_) => print('Connection Disconnection'));
    socket.onConnectError((err) => print(err));
    print("socket connection : ${socket.connected}");
  }

  void sendMessage() async {
    String meassge = txtController.text;
    chatList.add(ChatModel(
      message: meassge,
      createdAt: DateTime.now(),
      id: senderUserId!,
      isPinned: false,
      isSent: false,
      messageType: "text",
      sendBy: await SharedPrefs.getString("username") ?? "",
      senderUserId: senderUserId ?? "",
    ));
    txtController.text;
    txtController.clear();

    socket.emit("message", {
      "message": meassge,
      "senderUserId": senderUserId,
    });
  }

  String time = DateFormat.jm().format(DateTime.now()).toString();
  void setMessage(Map<String, dynamic> map) {
    ChatModel chat = ChatModel.fromMap(map);
    print("chat : ${chat.message}");
    chatList.add(chat);
    update();
    scrollController.animateTo(scrollController.position.maxScrollExtent + 40,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    update();
  }

  DoubtRepoImp doubtRepoImp = DoubtRepoImp();
  List<ChatModel> chatList = [];

  void getDoubts() async {
    loading = true;
    update();
    List<ChatModel> chatModelList = await doubtRepoImp.getDoubts();
    chatList = chatModelList;
    loading = false;
    update();
  }

  bool functionalityLoding = false;
  bool multipleSelect = false;

  void deleteChat() async {
    functionalityLoding = true;
    List<String> idsForDelete = [];

    if (!multipleSelect) {
      idsForDelete.add(selectedChatId);
    } else {
      idsForDelete = selectedChatList.map((e) => e.id).toList();
      for (var chat in selectedChatList) {
        chatList.removeWhere((element) => element.id == chat.id);
      }
    }
    update();
    print("ids for delete : $idsForDelete");
    Map<String, dynamic>? deleteMessage =
        await doubtRepoImp.deleteChat(chatList[0].id, idsForDelete);
    update();
    print("chat list : $deleteMessage");
    if (deleteMessage == {} || deleteMessage["status"] == "failed") {
      showSnackBar(Get.context!,
          deleteMessage["message"] ?? "Error in Deleting Message");
    }
    if (deleteMessage["status"] == "success") {
      showSnackBar(Get.context!, "Message Deleted");
      if (!multipleSelect) {
        chatList.removeWhere((element) => idsForDelete.contains(element.id));
      } else {
        chatList.removeWhere((element) => selectedChatList.contains(element));
      }
      selectedChatId = "";
      selectedChatList = [];
    }
    multipleSelect = false;
    // getUserChat();
    functionalityLoding = false;
    update();
  }

  void functionality(String chatId, String type, String trueFalse) async {
    Map body = {type: trueFalse};
    Map<String, dynamic>? deleteMessage =
        await doubtRepoImp.functionality(chatList[0].id, chatId, body);
    update();
    print("chat list : $deleteMessage");
    if (deleteMessage == {} || deleteMessage["status"] == "failed") {
      Get.snackbar("Message Deleted",
          deleteMessage["message"] ?? "Error in Deleting Message");
    }
    if (deleteMessage["status"] == "success") {
      Get.snackbar("Success", "Message Deleted");
    }
    getDoubts();
    update();
  }

  String getDateTime(String datetime) {
    return DateFormat("h:mma").format(DateTime.parse(datetime));
  }

  @override
  void onClose() {
    socket.disconnect();
    socket.dispose();
    super.dispose();
  }

  String convertDateTime(DateTime dateTime) {
    // print("ttttttttttttttt");
    // print("dateTime : $dateTime");
    dateTime = dateTime.toUtc().toLocal();
    String date = dateTime.toString().substring(8, 10);
    String month = dateTime.toString().substring(5, 7);
    String year = dateTime.toString().substring(2, 4);
    String time = dateTime.toString().substring(11, 16);
    // function to convert time in 12 hours format
    String hour = time.substring(0, 2);
    String min = time.substring(3, 5);
    String ampm = "AM";
    if (int.parse(hour) > 12) {
      hour = (int.parse(hour) - 12).toString();
      ampm = "PM";
    }
    return "$hour:$min $ampm";
  }
}
