import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rts/ui/dashboard/dashboard.dart';
import 'package:rts/ui/home/logged_in_home.dart';
import 'package:rts/widgets/bootcamp_tile.dart';

class HomeVM extends GetxController {
  List<Widget> views = [
    const Dashboard(),
    const LoggedInHome(),
    const Text("Resourses"),
    const Text("About Section"),
  ];

  List<Widget> test = [
    const BootCampTile(),
    const BootCampTile(),
    const BootCampTile(),
    const BootCampTile(),
    const BootCampTile(),
    const BootCampTile(),
    const BootCampTile(),
    const BootCampTile(),
    const BootCampTile(),
    const BootCampTile(),
  ];

  String homeTitle = "Raah Towards Success";

  int selectedIndex = 0;

  void changeIndex(int i) {
    selectedIndex = i;
    update();
  }
}
