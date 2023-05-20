import 'package:get/get.dart';
import 'package:rts/ui/home/home.dart';
import 'package:rts/ui/main/main_home.dart';
import 'package:rts/utils/binding.dart';

class AppRotutes {
  static const mainHome = '/';
  static const home = '/home';
  static const signin = '/signin';
  static const signup = '/signup';
  static const bootcamp = "/bootcamp";
  static const editProfile = "/editProfile";

  static final pages = [
    GetPage(
      name: AppRotutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRotutes.mainHome,
      page: () => const MainHomePage(),
    ),
    GetPage(
      name: AppRotutes.bootcamp,
      page: () => const HomePage(),
      binding: BootcampDetailsBinding(),
    ),
  ];
}
