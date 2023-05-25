import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts/ui/doubt/doubt.dart';
import 'package:rts/ui/doubt/doubt_viewmodel.dart';
import 'package:rts/ui/home/home_vm.dart';

import '../utils/constants.dart';

class BottomTextMessaging extends StatelessWidget {
  // final BuildContext context;
  BottomTextMessaging({
    super.key,
    // required this.context,
  });
  HomeVM homeVM = Get.isRegistered<HomeVM>() ? Get.find() : Get.put(HomeVM());
  DoubtVM vm = Get.isRegistered<DoubtVM>() ? Get.find() : Get.put(DoubtVM());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.bottomCenter,
      child: GetBuilder<DoubtVM>(builder: (vm) {
        return SizedBox(
          // height: widget.isWeb! ? 70 : 500,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 2.0, right: 2),
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GetBuilder<HomeVM>(builder: (homeVM) {
                      return SizedBox(
                        width: width < 800
                            ? (homeVM.isSideBarVisible
                                ? width - 170
                                : width - 115)
                            : (width > 1180 ? 360 : width - 345),
                        // width < Constants.mwidth + 50
                        //     ? width - 160
                        //     : Constants.commentSectionWidth - 55,
                        child: Card(
                          margin: const EdgeInsets.only(
                              left: 4, right: 2, bottom: 6),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          child: TextFormField(
                            onChanged: (value) {
                              value.isNotEmpty
                                  ? vm.sendButton = true
                                  : vm.sendButton = false;
                              vm.update();
                            },
                            controller: vm.txtController,
                            focusNode: vm.focusNode,
                            textAlignVertical: TextAlignVertical.center,
                            maxLines: 2,
                            minLines: 1,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Ask question here",
                              hintStyle: const TextStyle(fontSize: 18),
                              // prefixIcon: IconButton(
                              //   icon: const Icon(
                              //     Icons.emoji_emotions_outlined,
                              //     size: 28,
                              //     color: Colors.grey,
                              //   ),
                              //   onPressed: () {
                              //     vm.focusNode.unfocus();
                              //     vm.focusNode.canRequestFocus = false;
                              //     vm.showEnojiOption = !vm.showEnojiOption;
                              //     vm.update();
                              //   },
                              // ),
                              contentPadding: const EdgeInsets.all(15),
                            ),
                          ),
                        ),
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: CircleAvatar(
                        radius: width < 555 ? 20 : 24.5,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: IconButton(
                            onPressed: () {
                              // vm.scrollController.animateTo(
                              //     vm.scrollController.position.maxScrollExtent +
                              //         40,
                              //     duration: const Duration(milliseconds: 300),
                              //     curve: Curves.easeOut);
                              vm.sendMessage();
                            },
                            icon: Icon(Icons.send,
                                color: Colors.white,
                                size: vm.sendButton ? 23 : 25)),
                      ),
                    ),
                  ],
                ),
              ),
              // vm.showEnojiOption ? emojiOptions() : Container(),
            ],
          ),
        );
      }),
    );
  }

//   GetBuilder emojiOptions() {
//     return GetBuilder<DoubtVM>(builder: (vm) {
//       return SizedBox(
//         height: 250,
//         child: EmojiPicker(
//           onEmojiSelected: (category, emoji) {
//             vm.txtController.text = vm.txtController.text + emoji.emoji;
//             vm.update();
//           },
//           onBackspacePressed: () {},
//           config: const Config(
//             columns: 8,
//             // emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0), // Issue: https://github.com/flutter/flutter/issues/28894
//             verticalSpacing: 0,
//             horizontalSpacing: 0,
//             gridPadding: EdgeInsets.zero,
//             initCategory: Category.RECENT,
//             bgColor: Color(0xFFF2F2F2),
//             indicatorColor: Colors.blue,
//             iconColor: Colors.grey,
//             iconColorSelected: Colors.blue,
//             // progressIndicatorColor: Colors.blue,
//             backspaceColor: Colors.blue,
//             skinToneDialogBgColor: Colors.white,
//             skinToneIndicatorColor: Colors.grey,
//             enableSkinTones: true,
//             showRecentsTab: true,
//             recentsLimit: 28,
//             noRecents: Text(
//               'No Recents',
//               style: TextStyle(fontSize: 20, color: Colors.black26),
//               textAlign: TextAlign.center,
//             ),
//             tabIndicatorAnimDuration: kTabScrollDuration,
//             categoryIcons: CategoryIcons(),
//             buttonMode: ButtonMode.MATERIAL,
//           ),
//         ),
//       );
//     });
//   }
}
