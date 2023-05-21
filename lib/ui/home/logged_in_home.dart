import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts/constants/google_fonts.dart';
import 'package:rts/constants/strings.dart';
import 'package:rts/ui/home/bootcamp_tile.dart';
import 'package:rts/ui/home/home_vm.dart';
import 'package:rts/widgets/page_frame/page_frame.dart';

class LoggedInHome extends StatelessWidget {
  const LoggedInHome({super.key});

  @override
  Widget build(BuildContext context) {
    HomeVM vm = Get.find<HomeVM>();
    return PageFrame(
      pageTitle: UseString.Bootcamps,
      pageDescription: "/home",
      children: [
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: Get.width - 270,
              minWidth: Get.width - 300,
            ),
            child: Wrap(
              runAlignment: WrapAlignment.spaceAround,
              alignment: WrapAlignment.spaceAround,
              children: [
                BootCampTile(
                  width: MediaQuery.of(context).size.width,
                ),
                BootCampTile(
                  width: MediaQuery.of(context).size.width,
                ),
                BootCampTile(
                  width: MediaQuery.of(context).size.width,
                ),
                BootCampTile(
                  width: MediaQuery.of(context).size.width,
                ),
                BootCampTile(
                  width: MediaQuery.of(context).size.width,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
