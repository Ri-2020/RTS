import 'package:get/get.dart';
import 'package:rts/models/ressource_model.dart';
import 'package:rts/repositories/resource_repo/resource_repo_imp.dart';
import 'package:rts/ui/resourses/resource_box.dart';
import 'package:rts/widgets/snackbar.dart';

class ResourcesVM extends GetxController {
  // List<ResourceBox> resources = [
  // const ResourceBox(
  //     title: "Learn Complete Dart",
  //     description:
  //         "Please click on the 'Go to Resource' button to reach the complete course and readmap to lear Dart Programming language which is required to lear flutter in futute",
  //     url:
  //         "https://www.google.com/url?sa=i&url=https%3A%2F%2Fmedium.flutterdevs.com%2Fexplore-table-in-flutter-28726b28b5d6&psig=AOvVaw2JFF7FNhHEof5vLLSAVyaI&ust=1684693168458000&source=images&cd=vfe&ved=0CA4QjRxqFwoTCJj-uaHBhP8CFQAAAAAdAAAAABAD"),
  // const ResourceBox(
  //     title: "Install Required Softwares",
  //     description:
  //         "Please click on the 'Go to Resource' button to learn how to install the required software for your bootcamp. This will help ensure that your bootcamp journey is smooth and productive.",
  //     url:
  //         "https://www.youtube.com/watch?v=BqHOtlh3Dd4&pp=ygUYSG93IHRvIGluc3RhbGwgZmx1dHRlciAg"),
  // ];
  List<Resource> resources = [];
  ResourceRepoImp resourceRepoImp = ResourceRepoImp();

  bool resourceLoading = false;

  void getAllResources() async {
    resourceLoading = true;
    update();
    try {
      var res = await resourceRepoImp.getAllResources();
      // print(res);
      if (res["status"] == "success") {
        // for (var e in res["data"]) {
        //   resources.add(Resource.fromMap(e));
        // }
        resources = resources = (res['data'] as List<dynamic>)
            .map((e) => Resource.fromMap(e as Map<String, dynamic>))
            .toList();
        print(resources.length);
      }
      // resources = res;
      update();
    } catch (e) {
      showSnackBar(Get.context!, "Error while fetching resources");
      resourceLoading = false;
    }
    resourceLoading = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getAllResources();
  }
}
