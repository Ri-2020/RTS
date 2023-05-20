import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rts/models/user_model.dart';
import 'package:rts/ui/about/about.dart';
import 'package:rts/ui/dashboard/dashboard.dart';
import 'package:rts/ui/home/logged_in_home.dart';
import 'package:rts/ui/resourses/resourses.dart';
import 'package:rts/ui/home/bootcamp_tile.dart';
import 'package:rts/utils/shared_prefer.dart';

class HomeVM extends GetxController {
  UserData? user;

  List<Widget> views = [
    const LoggedInHome(),
    const Resourses(),
    const Dashboard(),
    const About(),
  ];

  List<Widget> test = [
    const BootCampTile(),
  ];

  String homeTitle = "Raah Towards Success";

  int selectedIndex = 0;

  @override
  void onInit() async {
    super.onInit();
    getUserDetails();
  }

  void getUserDetails() async {
    user = UserData.fromJson((await SharedPrefs.getString("user"))!);
    update();
  }

  void changeIndex(int i) {
    selectedIndex = i;
    update();
  }
}
