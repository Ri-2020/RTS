import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts/ui/doubt/doubt_viewmodel.dart';
import 'package:rts/ui/home/home_vm.dart';

class BottomTextMessaging extends StatelessWidget {
  BottomTextMessaging({
    super.key,
  });
  HomeVM homeVM = Get.isRegistered<HomeVM>() ? Get.find() : Get.put(HomeVM());
  DoubtVM vm = Get.isRegistered<DoubtVM>() ? Get.find() : Get.put(DoubtVM());

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GetBuilder<DoubtVM>(builder: (vm) {
        return GetBuilder<HomeVM>(builder: (homeVM) {
          return Card(
            margin: const EdgeInsets.only(left: 2, right: 2, bottom: 6),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(36)),
            child: TextFormField(
              controller: vm.txtController,
              focusNode: vm.focusNode,
              textAlignVertical: TextAlignVertical.center,
              maxLines: 2,
              minLines: 1,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Ask question here",
                hintStyle: const TextStyle(fontSize: 18),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(
                    radius: 20.5,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: IconButton(
                        onPressed: () {
                          vm.sendMessage();
                        },
                        icon: const Icon(Icons.send,
                            color: Colors.white, size: 25)),
                  ),
                ),
                contentPadding: const EdgeInsets.all(14),
              ),
            ),
          );
        });
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
