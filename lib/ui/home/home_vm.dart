import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rts/ui/about/about.dart';
import 'package:rts/ui/dashboard/dashboard.dart';
import 'package:rts/ui/home/logged_in_home.dart';
import 'package:rts/ui/resourses/resource_box.dart';
import 'package:rts/ui/resourses/resourses.dart';
import 'package:rts/widgets/bootcamp_tile.dart';

class HomeVM extends GetxController {
  List<Widget> views = [
    const LoggedInHome(),
    const Resourses(),
    const Dashboard(),
    const About(),
  ];

  List<ResourceBox> resources = [
    const ResourceBox(),
  ];

  List<Widget> test = [
    const BootCampTile(),
  ];

  String homeTitle = "Raah Towards Success";

  int selectedIndex = 0;

  void changeIndex(int i) {
    selectedIndex = i;
    update();
  }
}
