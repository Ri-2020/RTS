import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rts/models/user_model.dart';
import 'package:rts/ui/about/about.dart';
import 'package:rts/ui/dashboard/dashboard.dart';
import 'package:rts/ui/home/logged_in_home.dart';
import 'package:rts/ui/resourses/resource_box.dart';
import 'package:rts/ui/resourses/resourses.dart';
import 'package:rts/ui/home/bootcamp_tile.dart';
import 'package:rts/utils/shared_prefer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeVM extends GetxController {
  UserModel user = UserModel();

  List<Widget> views = [
    const LoggedInHome(),
    const Resourses(),
    const Dashboard(),
    const About(),
  ];

  List<ResourceBox> resources = [
    // const ResourceBox(),
  ];

  List<Widget> test = [
    const BootCampTile(),
  ];

  String homeTitle = "Raah Towards Success";

  int selectedIndex = 0;

  @override
  void onInit() {
    super.onInit();
    getUserDetails();
  }

  void getUserDetails() async {
    user = UserModel.fromJson((await SharedPrefs.getString("user"))!);
    update();
  }

  void changeIndex(int i) {
    selectedIndex = i;
    update();
  }
}
