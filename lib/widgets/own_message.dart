import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

import 'package:rts/ui/doubt/doubt_viewmodel.dart';

class OwnMsgCard extends StatelessWidget {
  const OwnMsgCard(
      {Key? key,
      required this.text,
      required this.time,
      required this.chatId,
      required this.index})
      : super(key: key);
  final String text;
  final String time;
  final String chatId;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoubtVM>(builder: (vm) {
      return Container(
        // padding: const EdgeInsets.only(bottom: 20),

        alignment: Alignment.centerRight,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 45,
          ),
          child: GestureDetector(
            onLongPress: () {
              vm.showBottomNavigation = true;
              vm.selectedChatId = chatId;
              vm.selectedIndex = index;
              vm.update();
            },
            child: Stack(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  color: const Color(0xffdcf8c6),
                  margin: const EdgeInsets.only(top: 8, right: 15, bottom: 8),
                  child: Stack(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                            top: 5,
                            bottom: ((text.length % 47)) < 38 ? 10 : 25,
                            left: 10,
                            right: text.length > 37 ? 30 : 85,
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
                        child: Row(
                          children: [
                            Text(time,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400)),
                            const SizedBox(
                              width: 3,
                            ),
                            const Icon(
                              Icons.done_all,
                              size: 18,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
