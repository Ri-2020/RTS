import 'package:get/get.dart';
import 'package:rts/ui/resourses/resource_box.dart';

class ResourcesVM extends GetxController {
  List<ResourceBox> resources = [
    const ResourceBox(
        title: "Learn Complete Dart",
        description:
            "Please click on the 'Go to Resource' button to reach the complete course and readmap to lear Dart Programming language which is required to lear flutter in futute",
        url:
            "https://www.youtube.com/watch?v=BqHOtlh3Dd4&pp=ygUYSG93IHRvIGluc3RhbGwgZmx1dHRlciAg"),
    const ResourceBox(
        title: "Install Required Softwares",
        description:
            "Please click on the 'Go to Resource' button to learn how to install the required software for your bootcamp. This will help ensure that your bootcamp journey is smooth and productive.",
        url:
            "https://www.youtube.com/watch?v=BqHOtlh3Dd4&pp=ygUYSG93IHRvIGluc3RhbGwgZmx1dHRlciAg"),
  ];
}
