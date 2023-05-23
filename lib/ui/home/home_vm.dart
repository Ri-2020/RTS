import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rts/models/user_model.dart';
import 'package:rts/repositories/home_repo/home_repo_imp.dart';
import 'package:rts/ui/about/about.dart';
import 'package:rts/ui/dashboard/dashboard.dart';
import 'package:rts/ui/doubt/doubt.dart';
import 'package:rts/ui/home/logged_in_home.dart';
import 'package:rts/ui/resourses/resourses.dart';
import 'package:rts/ui/home/bootcamp_tile.dart';
import 'package:rts/utils/routes.dart';
import 'package:rts/utils/shared_prefer.dart';
import 'package:rts/widgets/logout.dart';
import 'package:rts/widgets/snackbar.dart';

class HomeVM extends GetxController {
  UserData? user;
  // double width = MediaQuery.of(context).size.width;
  HomeRepoImp homeRepoImp = HomeRepoImp();

  List<Widget> views = [
    const LoggedInHome(),
    const Resourses(),
    const Dashboard(),
    const DoubtPage(),
    const About(),
    const Logout(),
  ];

  String homeTitle = "Raah Towards Success";

  int selectedIndex = 0;

  @override
  void onInit() async {
    super.onInit();
    getUserDetails();
  }

  bool userDataLoading = false;

  void getUserDetails() async {
    userDataLoading = true;
    update();
    var res = await homeRepoImp.getLoggedInUserData();
    if (res.isEmpty) {
      user = UserData.fromJson((await SharedPrefs.getString("user"))!);
    } else {
      user = UserData.fromMap(res["data"]);
    }
    userDataLoading = false;
    print("user skill ${user?.skills ?? "dnfko"}");
    String x = (await SharedPrefs.getString("token")) ?? "No Token";
    print(x);

    update();
  }

  void signout() async {
    bool isSignout = await SharedPrefs.clearPrefs();
    if (isSignout) {
      print("clear");
      showSnackBar(Get.context!, "Logged out successfully");
      Get.back();
      Get.offAllNamed(AppRotutes.mainHome);
    } else {
      showSnackBar(Get.context!, "Something went wrong");
    }
  }

  void changeIndex(int i) {
    selectedIndex = i;
    update();
  }
}
