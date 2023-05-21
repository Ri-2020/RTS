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
                width: width,
                pageTitle: "Ask a doubt",
                children: [
                  Wrap(
                    spacing: 40,
                    children: [
                      Container(
                        width: width < Constants.mwidth + 50 ? width - 90 : 440,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(top: 20, bottom: 20),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 2,
                              offset: const Offset(
                                  0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: vm.loading
                            ? SizedBox(
                                height: Get.height,
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              )
                            : SizedBox(
                                width:
                                    width < Constants.commentSectionWidth + 50
                                        ? width - 80
                                        : Constants.commentSectionWidth - 80,
                                height: 600,
                                child: WillPopScope(
                                  child: Stack(
                                    children: [
                                      vm.chatList.isEmpty
                                          ? Center(
                                              child: Container(
                                                  child: Text("No question")),
                                            )
                                          : SizedBox(
                                              height: 600,
                                              child: ListView.builder(
                                                controller: vm.scrollController,
                                                // itemCount: messages.length,
                                                itemCount:
                                                    vm.chatList.length + 1,

                                                itemBuilder: (context, i) {
                                                  if (i == vm.chatList.length) {
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
                                                                    .chatList[i]
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
                                                                          const Text(
                                                                              "Do you want to delete this comment?"),
                                                                      actions: [
                                                                        TextButton(
                                                                            onPressed:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                const Text("No")),
                                                                        TextButton(
                                                                            onPressed:
                                                                                () {
                                                                              // commonVM.commentFuntionality(vm.chatList[i][index].postId, "delete", vm.chatList[i][index].id);
                                                                              // Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                const Text("Yes")),
                                                                      ],
                                                                    );
                                                                  });
                                                            },
                                                            child: Container(
                                                                width: width <
                                                                        Constants.mwidth +
                                                                            50
                                                                    ? width -
                                                                        190
                                                                    : 340,
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
                                                                          .chatList[
                                                                              i]
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
                                                                            onPressed: () {
                                                                              // commonVM.commentFuntionality(vm.chatList[i].postId, "likes", vm.chatList[i].id);
                                                                            },
                                                                            icon: Icon(
                                                                              Icons.thumb_up,
                                                                              color: Colors.grey.shade600,
                                                                              size: 20,
                                                                            )),
                                                                        TextButton(
                                                                            onPressed:
                                                                                () {},
                                                                            child:
                                                                                const Text("Reply")),
                                                                      ],
                                                                    ),
                                                                    i == vm.chatList.length - 1
                                                                        ? const SizedBox(
                                                                            height:
                                                                                40,
                                                                          )
                                                                        : const SizedBox()
                                                                  ],
                                                                )),
                                                          )
                                                        ]),
                                                  );

                                                  // if (vm.chatList[i]
                                                  //         .senderUserId !=
                                                  //     vm.senderUserId) {
                                                  //   return OwnMsgCard(
                                                  //       chatId:
                                                  //           vm.chatList[i].id,
                                                  //       text: vm.chatList[i]
                                                  //           .message,
                                                  //       index: i,
                                                  //       time: vm
                                                  //           .convertDateTime(vm
                                                  //               .chatList[i]
                                                  //               .createdAt));
                                                  // } else {
                                                  //   // print(
                                                  //   // "isit chala ${vm.chatList[i].id}, ${vm.senderUserId}");
                                                  //   return OtherSideMsgCard(
                                                  //       chatId:
                                                  //           vm.chatList[i].id,
                                                  //       text: vm.chatList[i]
                                                  //           .message,
                                                  //       time: vm
                                                  //           .convertDateTime(vm
                                                  //               .chatList[i]
                                                  //               .createdAt));
                                                  //   // if (vm.messages[i].type == "source") {
                                                  //   //   return OwnMsgCard(
                                                  //   //       text: vm.messages[i].msg,
                                                  //   //       time: vm.messages[i].time);
                                                  //   // } else {
                                                  //   //   return OtherSideMsgCard(
                                                  //   //       text: vm.messages[i].msg,
                                                  //   //       time: vm.messages[i].time);
                                                  // }
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
                      Container(
                        margin: EdgeInsets.only(left: 30, top: 30, bottom: 30),
                        height: vm.expandedList.where((e) => e == true).length *
                                150 +
                            vm.expandedList.where((e) => e == false).length *
                                50 +
                            100,
                        width: 400,
                        child: ListView.builder(
                          itemCount: vm.faqData.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                index == 0
                                    ? Padding(
                                        padding: const EdgeInsets.only(
                                            top: 30, bottom: 30, left: 15),
                                        child:
                                            Text("Frequently Asked Questions",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                      )
                                    : SizedBox(),
                                ExpansionPanelList(
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
                    ],
                  ),
                  // Container(
                  //   width: width < Constants.mwidth + 50 ? width - 80 : 440,
                  // )
                ],
              )
              // Column(
              //   children: [
              //     Container(
              //       color: Color.fromARGB(255, 243, 243, 243),
              //       padding: const EdgeInsets.all(20),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Container(
              //             margin: const EdgeInsets.all(10),
              //             padding: const EdgeInsets.all(20),
              //             decoration: BoxDecoration(
              //               color: Theme.of(context).scaffoldBackgroundColor,
              //               borderRadius: BorderRadius.circular(10),
              //             ),
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               children: [
              //                 Container(
              //                   height: 200,
              //                   width: double.infinity,
              //                   decoration: const BoxDecoration(
              //                       // borderRadius: BorderRadius.only(
              //                       //   topLeft: Radius.circular(10),
              //                       //   topRight: Radius.circular(10),
              //                       // ),
              //                       ),
              //                   child: Stack(
              //                     children: [
              //                       Container(
              //                         width: Get.width,
              //                         height: Get.height,
              //                         decoration: const BoxDecoration(
              //                           // borderRadius: BorderRadius.only(
              //                           //   topLeft: Radius.circular(10),
              //                           //   topRight: Radius.circular(10),
              //                           // ),
              //                           gradient: LinearGradient(
              //                             colors: [
              //                               Colors.black,
              //                               Color.fromARGB(255, 29, 2, 103),
              //                               Colors.deepPurpleAccent,
              //                               Colors.red,
              //                               Colors.black
              //                             ],
              //                             begin: Alignment.bottomLeft,
              //                             end: Alignment.topRight,
              //                             stops: [0.0, 0.1, 0.2, 0.76, 1.0],
              //                           ),
              //                         ),
              //                       ),
              //                       Positioned(
              //                         top: 0,
              //                         child: Container(
              //                             width: Get.width,
              //                             height: Get.height,
              //                             decoration: BoxDecoration(
              //                               // borderRadius: const BorderRadius.only(
              //                               //   topLeft: Radius.circular(10),
              //                               //   topRight: Radius.circular(10),
              //                               // ),
              //                               gradient: RadialGradient(
              //                                 colors: [
              //                                   Colors.black.withOpacity(0.51),
              //                                   Colors.transparent,
              //                                 ],
              //                                 radius: Get.width * 0.45,
              //                               ),
              //                             )),
              //                       ),
              //                       Center(
              //                         child: Column(
              //                           mainAxisAlignment:
              //                               MainAxisAlignment.center,
              //                           children: [
              //                             Text(
              //                               UseString.Get_Resources,
              //                               style: UseGoogleFont().openSans(
              //                                 size: 30,
              //                                 color: Colors.white,
              //                                 weight: FontWeight.bold,
              //                               ),
              //                             ),
              //                             Text(
              //                               "/${UseString.resources}",
              //                               style: TextStyle(
              //                                 fontSize: 10,
              //                                 color: Colors.white,
              //                                 fontWeight: FontWeight.w100,
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //                 Row(
              //                   children: [
              //                     Column(
              //                       children: [
              //                         Container(
              //                           width: width > Constants.webWidth
              //                               ? 500
              //                               : width,
              //                           height: 700,
              //                           color: Colors.white.withOpacity(0.9),
              //                         ),
              //                         Scaffold(
              //                           // backgroundColor: Colors.transparent,
              //                           appBar: AppBar(
              //                             leadingWidth: 35,
              //                             toolbarHeight: 55,
              //                             titleSpacing: 0,
              //                             elevation: 0,
              //                             leading: InkWell(
              //                               onTap: () {
              //                                 Navigator.pop(context);
              //                               },
              //                               child: const Icon(
              //                                 Icons.arrow_back,
              //                               ),
              //                             ),
              //                             title: InkWell(
              //                               onTap: () {
              //                                 // Get.to(() => const IndividualUserDetails());
              //                               },
              //                               child: Row(
              //                                 children: [
              //                                   CircleAvatar(
              //                                       radius: 20,
              //                                       child: Image.network(homeVM
              //                                               .user?.profileImage ??
              //                                           Constants.image)),
              //                                   const SizedBox(width: 10),
              //                                   Column(
              //                                     crossAxisAlignment:
              //                                         CrossAxisAlignment.start,
              //                                     children: [
              //                                       Text(
              //                                         homeVM.user?.name ?? "Name",
              //                                         style: const TextStyle(
              //                                           fontSize: 18.5,
              //                                           fontWeight:
              //                                               FontWeight.bold,
              //                                         ),
              //                                       ),
              //                                       Text(
              //                                         "Last seen today at ${vm.chatList.isNotEmpty ? vm.convertDateTime(vm.chatList[vm.chatList.length - 1].createdAt) : ""}",
              //                                         style: const TextStyle(
              //                                           fontSize: 13,
              //                                           fontWeight:
              //                                               FontWeight.w400,
              //                                         ),
              //                                       ),
              //                                     ],
              //                                   ),
              //                                 ],
              //                               ),
              //                             ),
              //                             actions: [
              //                               vm.selectedChatList.isNotEmpty
              //                                   ? IconButton(
              //                                       onPressed: () {
              //                                         vm.deleteChat();
              //                                       },
              //                                       icon:
              //                                           const Icon(Icons.delete))
              //                                   : IconButton(
              //                                       onPressed: () async {},
              //                                       icon: const Icon(Icons.call)),
              //                             ],
              //                           ),
              //                           body: vm.loading
              //                               ? SizedBox(
              //                                   height: Get.height,
              //                                   child: const Center(
              //                                     child:
              //                                         CircularProgressIndicator(),
              //                                   ),
              //                                 )
              //                               : SizedBox(
              //                                   width: MediaQuery.of(context)
              //                                       .size
              //                                       .width,
              //                                   height: MediaQuery.of(context)
              //                                       .size
              //                                       .height,
              //                                   child: WillPopScope(
              //                                     child: Column(
              //                                       children: [
              //                                         Expanded(
              //                                           child: ListView.builder(
              //                                             controller:
              //                                                 vm.scrollController,
              //                                             // itemCount: messages.length,
              //                                             itemCount:
              //                                                 vm.chatList.length +
              //                                                     1,

              //                                             itemBuilder:
              //                                                 (context, i) {
              //                                               if (i ==
              //                                                   vm.chatList
              //                                                       .length) {
              //                                                 return Container(
              //                                                   height: 20,
              //                                                 );
              //                                               }
              //                                               if (vm.chatList[i]
              //                                                       .senderUserId !=
              //                                                   vm.senderUserId) {
              //                                                 return OwnMsgCard(
              //                                                     chatId: vm
              //                                                         .chatList[i]
              //                                                         .id,
              //                                                     text: vm
              //                                                         .chatList[i]
              //                                                         .message,
              //                                                     index: i,
              //                                                     time: vm.convertDateTime(vm
              //                                                         .chatList[i]
              //                                                         .createdAt));
              //                                               } else {
              //                                                 // print(
              //                                                 // "isit chala ${vm.chatList[i].id}, ${vm.senderUserId}");
              //                                                 return OtherSideMsgCard(
              //                                                     chatId: vm
              //                                                         .chatList[i]
              //                                                         .id,
              //                                                     text: vm
              //                                                         .chatList[i]
              //                                                         .message,
              //                                                     time: vm.convertDateTime(vm
              //                                                         .chatList[i]
              //                                                         .createdAt));
              //                                                 // if (vm.messages[i].type == "source") {
              //                                                 //   return OwnMsgCard(
              //                                                 //       text: vm.messages[i].msg,
              //                                                 //       time: vm.messages[i].time);
              //                                                 // } else {
              //                                                 //   return OtherSideMsgCard(
              //                                                 //       text: vm.messages[i].msg,
              //                                                 //       time: vm.messages[i].time);
              //                                               }
              //                                             },
              //                                           ),
              //                                         ),
              //                                         vm.showBottomNavigation
              //                                             ? const SizedBox(
              //                                                 height: 0,
              //                                               )
              //                                             : BottomTextMessaging()
              //                                       ],
              //                                     ),
              //                                     onWillPop: () {
              //                                       if (vm.showEnojiOption ==
              //                                           true) {
              //                                         setState(() {
              //                                           vm.showEnojiOption =
              //                                               false;
              //                                         });
              //                                       } else {
              //                                         Navigator.pop(context);
              //                                       }
              //                                       return Future.value(false);
              //                                     },
              //                                   ),
              //                                 ),
              //                           bottomNavigationBar: vm
              //                                   .showBottomNavigation
              //                               ? bottomNavigationMsgOption()

              //                               : Container(
              //                                   height: 0,
              //                                 ),
              //                         ),
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //     Container(
              //       width: double.infinity,
              //       margin: const EdgeInsets.all(30),
              //       padding: const EdgeInsets.all(30),
              //       decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.circular(15),
              //       ),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Container(
              //             margin: const EdgeInsets.symmetric(vertical: 10),
              //             child: Text(
              //               "Contact Us",
              //               style: TextStyle(
              //                 color: Colors.blue[900],
              //                 fontSize: 20,
              //                 fontWeight: FontWeight.bold,
              //               ),
              //             ),
              //           ),
              //           Text(
              //             "Email: rohitgupta111abcd@gmail.com\nPhone: +91 1234567890",
              //             style: TextStyle(
              //               color: Colors.blue[900],
              //               fontSize: 10,
              //               fontWeight: FontWeight.w100,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              ),
        );
      });
    });
  }

  // Widget sendFiles(){
  //   return ;
  // }
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
