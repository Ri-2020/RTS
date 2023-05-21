import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts/ui/doubt/doubt_viewmodel.dart';
import 'package:rts/utils/constants.dart';

class OtherSideMsgCard extends StatelessWidget {
  OtherSideMsgCard(
      {Key? key, required this.text, required this.time, required this.chatId})
      : super(key: key);
  final String text;
  final String chatId;
  final String time;
  DoubtVM vm = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoubtVM>(builder: (vm) {
      return Align(
        alignment: Alignment.centerLeft,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 45,
          ),
          child: GestureDetector(
            onLongPress: () {
              showModalBottomSheet(
                constraints: BoxConstraints(
                  maxWidth: 500,
                ),
                context: context,
                builder: (context) {
                  return Container(
                    height: 120,
                    width: Get.width < Constants.mwidth ? Get.width : 500,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text("Delete"),
                          onTap: () {
                            vm.deleteChat();
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text("Cancel"),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              color: Colors.white,
              margin: const EdgeInsets.only(top: 15, left: 15),
              child: Stack(
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                        top: 5,
                        bottom: ((text.length % 47)) < 38 ? 10 : 25,
                        left: 10,
                        right: text.length > 37 ? 20 : 75,
                      ),
                      child: Text(
                        text,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      )),
                  text.length > 30
                      ? const SizedBox(
                          width: 45,
                        )
                      : const SizedBox(width: 0),
                  Positioned(
                    bottom: 4,
                    right: 10,
                    child: Text(time,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400)),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
