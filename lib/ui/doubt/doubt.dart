import 'package:rts/constants/strings.dart';
import 'package:rts/ui/doubt/doubt_viewmodel.dart';
import 'package:rts/ui/home/home_vm.dart';
import 'package:rts/utils/constants.dart';
import 'package:rts/utils/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rts/widgets/doubt_textfield.dart';
import 'package:rts/widgets/page_frame/page_frame.dart';

class MoreOption {
  final String name;
  final IconData iconName;
  final Color color;

  MoreOption({required this.name, required this.iconName, required this.color});
}

class MessageModel {
  String type;
  String msg;
  String time;
  MessageModel({required this.msg, required this.type, required this.time});
}

class DoubtPage extends StatefulWidget {
  const DoubtPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DoubtPage> createState() => _UserChatPageState();
}

class _UserChatPageState extends State<DoubtPage> {
  HomeVM homeVM =
      Get.isRegistered<HomeVM>() ? Get.find<HomeVM>() : Get.put(HomeVM());
  DoubtVM vm = Get.put(DoubtVM());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<DoubtVM>(
      builder: (vm) {
        return GetBuilder<HomeVM>(
          builder: (homeVM) {
            return SingleChildScrollView(
              child: GestureDetector(
                onTap: () {
                  if (vm.focusNode.hasFocus) {
                    vm.focusNode.unfocus();
                  }
                  vm.update();
                },
                child: PageFrame(
                  pageDescription: "/ask_a_doubt",
                  width: width,
                  pageTitle: "Ask a doubt",
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Wrap(
                        alignment: WrapAlignment.spaceAround,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        spacing: 40,
                        children: [
                          FAQWidget(width: width),
                          Container(
                            width: width < 1180 ? double.infinity : 400,
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 5),
                            margin: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: width < 820
                                  ? width < 420
                                      ? 15
                                      : 20
                                  : 0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0.3,
                                  blurRadius: 3,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                            child: vm.loading
                                ? const SizedBox(
                                    height: 500,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                : SizedBox(
                                    height: 550,
                                    child: Stack(
                                      children: [
                                        vm.chatList.isEmpty
                                            ? Center(
                                                child: Column(
                                                  children: const [
                                                    Icon(Icons.error, size: 32),
                                                    Text("No question"),
                                                  ],
                                                ),
                                              )
                                            : SizedBox(
                                                height: 550,
                                                child: ListView.builder(
                                                  controller:
                                                      vm.scrollController,
                                                  itemCount:
                                                      vm.chatList.length + 1,
                                                  itemBuilder: (context, i) {
                                                    if (i ==
                                                        vm.chatList.length) {
                                                      return Container(
                                                        height: 80,
                                                      );
                                                    }
                                                    return doubtUser(
                                                      vm,
                                                      i,
                                                      context,
                                                      width,
                                                    );
                                                  },
                                                ),
                                              ),
                                        BottomTextMessaging(),
                                      ],
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Container doubtUser(DoubtVM vm, int i, BuildContext context, double width) {
    return Container(
      width: width < 1180 && width > 821 ? 400 : double.infinity,
      margin: EdgeInsets.symmetric(
          vertical: i == 0 ? 0 : 8, horizontal: width < 420 ? 4 : 10),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(vm.chatList[i].userImage),
          ),
          SizedBox(width: 15),
          Container(
            padding: const EdgeInsets.only(
              left: 10,
              bottom: 5,
            ),
            margin: const EdgeInsets.only(top: 15),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onLongPress: () {
                    showDialogBox(context);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vm.chatList[i].username,
                        style: TextStyle(
                          fontFamily: UseString.font_family,
                          fontSize: 15,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: width < 1180 && width > 821
                            ? 300
                            : width > 1180 || (width > 500 && width < 821)
                                ? 238
                                : homeVM.isSideBarVisible
                                    ? width - 256
                                    : width - 200,
                        child: RichText(
                          text: TextSpan(
                            text: vm.chatList[i].text,
                            style: const TextStyle(
                              fontFamily: UseString.font_family,
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton.icon(
                  label: Text("${vm.chatList[i].likes}"),
                  onPressed: () {},
                  icon: Icon(
                    Icons.thumb_up,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FAQWidget extends StatelessWidget {
  const FAQWidget({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoubtVM>(builder: (vm) {
      return Container(
        margin: const EdgeInsets.only(left: 30, top: 30, bottom: 30),
        height: vm.expandedList.where((e) => e == true).length * 195 +
            vm.expandedList.where((e) => e == false).length * 56 +
            100,
        width: width > 1180 ? 400 : double.infinity,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: vm.faqData.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                index == 0
                    ? const Padding(
                        padding: EdgeInsets.only(top: 30, bottom: 30, left: 15),
                        child: Text("Frequently Asked Questions",
                            style: TextStyle(
                              fontFamily: UseString.font_family,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                      )
                    : const SizedBox(),
                ExpansionPanelList(
                  animationDuration: const Duration(milliseconds: 200),
                  elevation: 1,
                  expandedHeaderPadding: EdgeInsets.zero,
                  expansionCallback: (panelIndex, isExpanded) {
                    vm.expandedList[index] = !isExpanded;
                    vm.update();
                  },
                  children: [
                    ExpansionPanel(
                      headerBuilder: (context, isExpanded) {
                        return ListTile(
                          title: Text(
                            vm.faqData[index]['question'] ?? "",
                            style: const TextStyle(
                              fontFamily: UseString.font_family,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      },
                      body: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Text(
                          vm.faqData[index]['answer'] ?? "",
                          style: const TextStyle(
                            fontFamily: UseString.font_family,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      isExpanded: vm.expandedList[index],
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      );
    });
  }
}

class bottomNavigationMsgOption extends StatelessWidget {
  bottomNavigationMsgOption({
    Key? key,
  }) : super(key: key);

  DoubtVM vm = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoubtVM>(
      builder: (vm) {
        return Container(
          height: 56 * 6.3,
          width: Get.width < Constants.mwidth ? Get.width : 500,
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.only(bottom: 10),
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xff344955),
            ),
            width: Get.width < Constants.mwidth ? Get.width * 0.95 : 500,
            height: 56 * 6.3,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                Container(
                  height: 20,
                ),
                ListTile(
                  title: const Text(
                    "Copy",
                    style: TextStyle(
                        fontFamily: UseString.font_family, color: Colors.white),
                  ),
                  leading: const Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Clipboard.setData(
                      ClipboardData(text: vm.chatList[vm.selectedIndex!].text),
                    );
                    vm.showBottomNavigation = false;
                    vm.update();
                    showSnackBar(context, "Copied to clipboard", false);
                  },
                ),
                ListTile(
                  title: const Text(
                    "Trash",
                    style: TextStyle(
                        fontFamily: UseString.font_family, color: Colors.white),
                  ),
                  leading: const Icon(
                    Icons.delete_outline,
                    color: Colors.white,
                  ),
                  onTap: () {
                    debugPrint("tapped on trash");
                    vm.deleteChat();
                    vm.showBottomNavigation = false;
                    vm.update();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

void showDialogBox(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: const Text("Do you want to delete this comment?"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("No")),
          TextButton(
            onPressed: () {},
            child: const Text("Yes"),
          ),
        ],
      );
    },
  );
}
