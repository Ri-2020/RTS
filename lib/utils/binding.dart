import 'package:get/get.dart';
import 'package:rts/ui/bootcamp_details_screen/bootcamp_details_vm.dart';
import 'package:rts/ui/dashboard/dashboard_vm.dart';
import 'package:rts/ui/edit_profile/edit_profile_viewmodel.dart';
import 'package:rts/ui/home/home_vm.dart';
import 'package:rts/ui/resourses/resourcesvm.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeVM());
    Get.put(DashboardVM());
    Get.put(ResourcesVM());
  }
}

class BootcampDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BootcampDetailsVM());
  }
}

class EditProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(EditProfileVM());
  }
}
