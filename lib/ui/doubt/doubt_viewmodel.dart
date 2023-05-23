import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rts/constants/strings.dart';
import 'package:rts/models/chat_model.dart';
import 'package:rts/remote/api_constants.dart';
import 'package:rts/repositories/doubt_repo/doubt_repo_imp.dart';
import 'package:rts/ui/doubt/doubt.dart';
import 'package:rts/ui/home/home_vm.dart';
import 'package:rts/utils/constants.dart';
import 'package:rts/utils/shared_prefer.dart';
import 'package:rts/widgets/snackbar.dart';

import 'package:socket_io_client/socket_io_client.dart' as io;

class DoubtVM extends GetxController {
  List<MessageModel> messages = [];
  List<Doubt> selectedChatList = [];
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
    getDoubts();
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
        print("chat reply $res");
        if (res["status"] == "success") {
          Doubt chat = Doubt.fromMap(res["data"]);
          // var response = doubtRepoImp.setIsSend(chat.id);
          // chatList.removeLast();
          setMessage(res["data"]);
        }
      });
    });
    socket.onDisconnect((_) => print('Connection Disconnection'));
    socket.onConnectError((err) => print(err));
    print("socket connection : ${socket.connected}");
  }

  HomeVM homeVM =
      Get.isRegistered<HomeVM>() ? Get.find<HomeVM>() : Get.put(HomeVM());

  void sendMessage() async {
    String meassge = txtController.text;
    if (meassge.trim().isEmpty) {
      showSnackBar(Get.context!, UseString.empty_message_snackbar_text);
      return;
    }
    print("caalled send messagage");
    chatList.add(Doubt(
      userImage: homeVM.user?.profileImage ?? Constants.image,
      username: homeVM.user?.username ?? "",
      text: meassge,
      createdAt: DateTime.now(),
      id: homeVM.user?.id ?? "",
      isEdited: false,
      name: homeVM.user?.name ?? "",
      userId: homeVM.user?.id ?? "",
    ));
    update();
    txtController.text;
    txtController.clear();

    var res = await doubtRepoImp.createDoubt(meassge);

    if (res != {}) {
      chatList.removeLast();
      setMessage(res["data"]);
    } else {
      showSnackBar(Get.context!, res["message"]);
    }
    update();
    // socket.emit("message", {
    //   "message": meassge,
    //   "userId": homeVM.user?.id ?? "",
    // });
  }

  List<Map<String, String>> faqData = [
    {
      'question': 'What is Flutter?',
      'answer':
          'Flutter is an open-source UI software development kit (SDK) developed by Google for building natively compiled applications for mobile, web, and desktop from a single codebase.'
    },
    {
      'question': 'Which programming language does Flutter use?',
      'answer':
          'Flutter uses the Dart programming language, which is also developed by Google. Dart is a modern, object-oriented language with a syntax similar to Java or JavaScript.'
    },
    {
      'question': 'Is Flutter only for mobile app development?',
      'answer':
          'No, Flutter is not limited to mobile app development. It also supports web and desktop app development. With Flutter, you can write code once and deploy it across multiple platforms.'
    },
    {
      'question': 'How does Flutter achieve cross-platform development?',
      'answer':
          'Flutter achieves cross-platform development by providing a framework that renders its own widgets, rather than using the native UI components of the underlying platform. This enables consistent app UI and behavior across different platforms.'
    },
    {
      'question':
          'Can I use existing Java/Kotlin or Objective-C/Swift code in Flutter?',
      'answer':
          'Yes, Flutter provides platform channels that allow you to integrate existing Java/Kotlin or Objective-C/Swift code into your Flutter app. This enables you to leverage existing codebases or access platform-specific APIs.'
    },
    {
      'question': 'Is Flutter suitable for building complex apps?',
      'answer':
          'Yes, Flutter is well-suited for building complex apps. Its reactive framework, hot-reload feature, and extensive widget library make it efficient for developing complex user interfaces and managing state.'
    },
    {
      'question':
          'How does Flutter compare to other cross-platform frameworks?',
      'answer':
          'Flutter offers a different approach compared to other cross-platform frameworks. It provides a complete UI toolkit, while other frameworks use native components. Flutter\'s performance, ease of use, and hot-reload feature make it a popular choice among developers.'
    },
    {
      'question': 'Is Flutter suitable for beginners?',
      'answer':
          'Yes, Flutter is beginner-friendly and has a gentle learning curve. The official documentation, online resources, and a supportive community make it easier for beginners to get started with Flutter development.'
    },
    {
      'question': 'Can I monetize my Flutter apps?',
      'answer':
          'Yes, you can monetize your Flutter apps using various methods like in-app purchases, advertisements, subscriptions, or by selling the app itself on app stores, similar to any other mobile or web application.'
    },
  ];
  List expandedList = List.generate(9, (index) => false);

  String time = DateFormat.jm().format(DateTime.now()).toString();
  void setMessage(Map<String, dynamic> map) {
    Doubt chat = Doubt.fromMap(map);
    print("chat : ${chat.text}");
    chatList.add(chat);
    update();
    scrollController.animateTo(scrollController.position.maxScrollExtent + 40,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    update();
  }

  DoubtRepoImp doubtRepoImp = DoubtRepoImp();
  List<Doubt> chatList = [];

  void getDoubts() async {
    loading = true;
    update();
    List<Doubt> chatModelList = await doubtRepoImp.getDoubts();
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
