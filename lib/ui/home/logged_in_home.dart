import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts/constants/strings.dart';
import 'package:rts/ui/home/bootcamp_tile.dart';
import 'package:rts/ui/home/home_vm.dart';
import 'package:rts/widgets/page_frame/page_frame.dart';

class LoggedInHome extends StatelessWidget {
  const LoggedInHome({super.key});

  @override
  Widget build(BuildContext context) {
    HomeVM vm = Get.find<HomeVM>();
    double width = MediaQuery.of(context).size.width;
    return PageFrame(
      width: width,
      pageTitle: UseString.Bootcamps,
      pageDescription: "/home",
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          constraints: BoxConstraints(
            minWidth: Get.width - 300,
          ),
          child: Wrap(
            runAlignment: WrapAlignment.start,
            alignment: WrapAlignment.spaceBetween,
            children: [
              BootCampTile(
                width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
