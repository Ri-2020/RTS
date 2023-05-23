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
import 'package:socket_io_client/socket_io_client.dart' as io;

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
    return GetBuilder<DoubtVM>(builder: (vm) {
      return GetBuilder<HomeVM>(builder: (homeVM) {
        return SingleChildScrollView(
          child: GestureDetector(
              onTap: () {
                if (vm.focusNode.hasFocus) {
                  vm.focusNode.unfocus();
                }
                if (vm.showEnojiOption) {
                  vm.showEnojiOption = false;
                }
                vm.showBottomNavigation = false;
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
                        Container(
                          margin:
                              EdgeInsets.only(left: 30, top: 30, bottom: 30),
                          height: vm.expandedList
                                      .where((e) => e == true)
                                      .length *
                                  190 +
                              vm.expandedList.where((e) => e == false).length *
                                  55 +
                              100,
                          width: width > 1180 ? 400 : double.infinity,
                          child: ListView.builder(
                            itemCount: vm.faqData.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  index == 0
                                      ? const Padding(
                                          padding: EdgeInsets.only(
                                              top: 30, bottom: 30, left: 15),
                                          child:
                                              Text("Frequently Asked Questions",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                        )
                                      : const SizedBox(),
                                  ExpansionPanelList(
                                    elevation: 1,
                                    expandedHeaderPadding: EdgeInsets.zero,
                                    expansionCallback:
                                        (panelIndex, isExpanded) {
                                      vm.expandedList[index] = !isExpanded;
                                      vm.update();
                                    },
                                    children: [
                                      ExpansionPanel(
                                        headerBuilder: (context, isExpanded) {
                                          return ListTile(
                                            title: Text(
                                              vm.faqData[index]['question'] ??
                                                  "",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          );
                                        },
                                        body: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 8.0),
                                          child: Text(
                                            vm.faqData[index]['answer'] ?? "",
                                            style: TextStyle(fontSize: 16.0),
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
                        ),
                        Container(
                          width: width < 1180 ? double.infinity : 440,
                          padding: const EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: width < 820 ? 20 : 0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0,
                                blurRadius: 2,
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
                              : Container(
                                  width:
                                      width < Constants.commentSectionWidth + 50
                                          ? width - 90
                                          : Constants.commentSectionWidth - 90,
                                  height: 550,
                                  child: WillPopScope(
                                    child: Stack(
                                      children: [
                                        vm.chatList.isEmpty
                                            ? Center(
                                                child: Container(
                                                    child: Text("No question")),
                                              )
                                            : SizedBox(
                                                height: 550,
                                                child: ListView.builder(
                                                  controller:
                                                      vm.scrollController,
                                                  // itemCount: messages.length,
                                                  itemCount:
                                                      vm.chatList.length + 1,

                                                  itemBuilder: (context, i) {
                                                    if (i ==
                                                        vm.chatList.length) {
                                                      return Container(
                                                        height: 20,
                                                      );
                                                    }
                                                    return Container(
                                                      margin: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 10,
                                                          horizontal: 10),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            CircleAvatar(
                                                              radius: 25,
                                                              backgroundImage:
                                                                  NetworkImage(vm
                                                                      .chatList[
                                                                          i]
                                                                      .userImage),
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            GestureDetector(
                                                              onLongPress: () {
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return AlertDialog(
                                                                        content:
                                                                            const Text("Do you want to delete this comment?"),
                                                                        actions: [
                                                                          TextButton(
                                                                              onPressed: () {
                                                                                Navigator.pop(context);
                                                                              },
                                                                              child: const Text("No")),
                                                                          TextButton(
                                                                              onPressed: () {},
                                                                              child: const Text("Yes")),
                                                                        ],
                                                                      );
                                                                    });
                                                              },
                                                              child: Container(
                                                                  width: width <
                                                                          Constants.mwidth +
                                                                              50
                                                                      ? width -
                                                                          195
                                                                      : 330,
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        vm.chatList[i]
                                                                            .username,
                                                                        style: const TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.w400),
                                                                      ),
                                                                      RichText(
                                                                          text:
                                                                              TextSpan(
                                                                        text: vm
                                                                            .chatList[i]
                                                                            .text,
                                                                        style: const TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.w400),
                                                                      )),
                                                                      Row(
                                                                        children: [
                                                                          TextButton.icon(
                                                                              label: Text("${vm.chatList[i].likes}"),
                                                                              onPressed: () {},
                                                                              icon: Icon(
                                                                                Icons.thumb_up,
                                                                                color: Colors.grey.shade600,
                                                                                size: 20,
                                                                              )),
                                                                        ],
                                                                      ),
                                                                      i == vm.chatList.length - 1
                                                                          ? const SizedBox(
                                                                              height: 40,
                                                                            )
                                                                          : const SizedBox()
                                                                    ],
                                                                  )),
                                                            )
                                                          ]),
                                                    );
                                                  },
                                                ),
                                              ),
                                        vm.showBottomNavigation
                                            ? const SizedBox(
                                                height: 0,
                                              )
                                            : BottomTextMessaging()
                                      ],
                                    ),
                                    onWillPop: () {
                                      if (vm.showEnojiOption == true) {
                                        setState(() {
                                          vm.showEnojiOption = false;
                                        });
                                      } else {
                                        Navigator.pop(context);
                                      }
                                      return Future.value(false);
                                    },
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        );
      });
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
    return GetBuilder<DoubtVM>(builder: (vm) {
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
                    style: TextStyle(color: Colors.white),
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
                    "React",
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: const Icon(
                    Icons.add_reaction,
                    color: Colors.white,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text(
                    "Forword",
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: const Icon(
                    CupertinoIcons.arrowshape_turn_up_right_fill,
                    color: Colors.white,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text(
                    "Trash",
                    style: TextStyle(color: Colors.white),
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
                ListTile(
                  title: const Text(
                    "Spam",
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: const Icon(
                    Icons.error,
                    color: Colors.white,
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ));
    });
  }
}

class IconBtn extends StatelessWidget {
  const IconBtn({
    Key? key,
    this.iconColor,
    this.iconSize,
    required this.icon,
    this.iconOnPress,
  }) : super(key: key);

  // final List<MoreOption> moreOptionsToSend;
  final IconData icon;
  final Color? iconColor;
  final double? iconSize;
  final void Function()? iconOnPress;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: iconOnPress ?? () {},
        icon: Icon(
          icon,
          color: iconColor ?? Colors.grey,
          size: iconSize ?? 24,
        ));
  }
}
