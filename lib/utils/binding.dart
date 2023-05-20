import 'package:get/get.dart';
import 'package:rts/ui/bootcamp_details_screen/bootcamp_details_vm.dart';
import 'package:rts/ui/home/home_vm.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeVM());
  }
}

class BootcampDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BootcampDetailsVM());
  }
}
