import 'package:get/get.dart';
import 'package:rts/ui/home/home_vm.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeVM());
  }
}
