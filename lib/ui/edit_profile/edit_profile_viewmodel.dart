import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts/utils/snackbar.dart';

class EditProfileVM extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController socialMediaName = TextEditingController();
  TextEditingController socialMediaUrl = TextEditingController();
  List<String> skills = ["Python", "C++", "Flutter"];

  Map<String, String> socialMediaLink = {};

  addSocialMedia() {
    if (socialMediaName.text.isNotEmpty && socialMediaUrl.text.isNotEmpty) {
      socialMediaLink[socialMediaName.text] = socialMediaUrl.text;
      socialMediaName.clear();
      socialMediaUrl.clear();
      update();
      showSnackBar(Get.context!, "Url Added", false);
    }
    showSnackBar(Get.context!, "Invalid Request", true);
  }

  removeSocialMedia(String key) {
    socialMediaLink.remove(key);
    update();
  }
}
