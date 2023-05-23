import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts/models/user_model.dart';
import 'package:rts/ui/home/home_vm.dart';
import 'package:rts/utils/snackbar.dart';
import 'package:rts/widgets/round_container.dart';

class EditProfileVM extends GetxController {
  bool isAddingSkill = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController socialMediaNameController = TextEditingController();
  TextEditingController socialMediaUrlController = TextEditingController();
  TextEditingController addSkillController = TextEditingController();
  List<String> skills = [
    'Programming',
  ];

  void fetchUserData() {
    nameController.text = homeVM.user?.name ?? "";
    usernameController.text = homeVM.user?.username ?? "";
    emailController.text = homeVM.user?.email ?? "";
    phoneController.text = homeVM.user?.mobile ?? "";
    bioController.text = homeVM.user?.bio ?? "";
    if (homeVM.user!.socialMedia.isNotEmpty) {
      for (var e in homeVM.user!.socialMedia) {
        socialMedia.add(e);
      }
    }
    socialMedia.add(
        SocialMedia(link: "instagram.com/rohit_gupta_indu", name: "rohit"));
    skills = homeVM.user!.skills;
    skills.add("programming");
    update();
  }

  HomeVM homeVM =
      Get.isRegistered<HomeVM>() ? Get.find<HomeVM>() : Get.put(HomeVM());
  List<SocialMedia> socialMedia = [];
  // Map<String, String> socialMedia = {
  //   "Instagram": "instagram.com/rohit_gupta_indu",
  //   "Twitter": "twitter.com/rohitgupta",
  // };

  removeSkill(String skill) {
    skills.remove(skill);
    update();
  }

  addSkill() {
    if (addSkillController.text.isNotEmpty) {
      skills.add(addSkillController.text);
      addSkillController.clear();
      update();
    } else {
      showSnackBar(Get.context!, "Enter Skill", true);
    }
  }

  addSocialMedia() {
    if (socialMediaNameController.text.isNotEmpty &&
        socialMediaUrlController.text.isNotEmpty) {
      // socialMedia[socialMediaNameController.text] =
      // socialMediaUrlController.text;
      socialMediaNameController.clear();
      socialMediaUrlController.clear();
      update();
      showSnackBar(Get.context!, "Url Added", false);
    } else {
      showSnackBar(Get.context!, "Invalid Request", true);
    }
  }

  removeSocialMedia(SocialMedia key) {
    socialMedia.remove(key);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }
}
