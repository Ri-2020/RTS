import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts/models/user_model.dart';
import 'package:rts/repositories/profile_repo/profile_repo_imp.dart';
import 'package:rts/ui/home/home_vm.dart';
import 'package:rts/widgets/round_container.dart';
import 'package:rts/widgets/snackbar.dart';

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
    // socialMedia.add(
    //     SocialMedia(link: "instagram.com/rohit_gupta_indu", name: "rohit"));
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
      // skills.add(addSkillController.text);
      addSkillAndSocialMedia("skill");
      // addSkillController.clear();
      update();
    } else {
      showSnackBar(Get.context!, "Enter Skill");
    }
  }

  bool isAddSocialMedia = false;

  addSocialMedia() {
    if (socialMediaNameController.text.isNotEmpty &&
        socialMediaUrlController.text.isNotEmpty) {
      // socialMedia[socialMediaNameController.text] =
      // socialMediaUrlController.text;
      addSkillAndSocialMedia("social media");
      socialMediaNameController.clear();
      socialMediaUrlController.clear();
      update();
    }
  }

  bool isUpdateProfile = false;

  ProfileRepoImp profileRepoImp = ProfileRepoImp();

  String validate() {
    if (emailController.text.isEmpty ||
        phoneController.text.isEmpty ||
        usernameController.text.isEmpty ||
        nameController.text.isEmpty ||
        bioController.text.isEmpty) {
      return "All Field required";
    }
    return "";
  }

  bool isAddSkillAndSocialMedia = false;

  void addSkillAndSocialMedia(String type) async {
    isAddSkillAndSocialMedia = true;
    update();
    Map<String, dynamic> data = {};
    data["type"] = type;
    if (type == "skill") {
      data["skill"] = addSkillController.text.trim();
    } else {
      data["socialMediaName"] = socialMediaNameController.text.trim();
      data["socialMediaLink"] = socialMediaUrlController.text.trim();
    }
    Map<String, dynamic> res =
        await profileRepoImp.addSkillAndSocialMedia(data);
    if (res["status"] == "success" && type == "skill") {
      print("skills");
      homeVM.user!.skills.add(addSkillController.text.trim());
      homeVM.update();
      showSnackBar(Get.context!, "${type} addedd successfully");
    } else if (res["status"] == "success") {
      homeVM.user!.socialMedia.add(SocialMedia.fromMap(res["data"]));
      socialMedia.add(SocialMedia.fromMap(res["data"]));
      homeVM.update();
      showSnackBar(Get.context!, "${type} addedd successfully");
    }
    isAddSkillAndSocialMedia = false;
    update();
  }

  bool isRemoveSkillAndSocialMedia = false;
  void removeSkillAndSocialMedia(
      {required String type, SocialMedia? socialMed, String? skill}) async {
    isRemoveSkillAndSocialMedia = true;

    update();
    Map<String, dynamic> data = {};
    data["type"] = type;
    if (type == "skill") {
      data["skill"] = skill;
    } else {
      data["socialMediaId"] = socialMed!.id;
    }
    bool res = await profileRepoImp.removeSkillAndSocialMedia(data);
    if (res) {
      if (type == "skill") {
        skills.remove(skill);
        homeVM.user!.skills.remove(skill);
        homeVM.update();
      } else {
        homeVM.user!.socialMedia.remove(socialMed);
        homeVM.update();
        socialMedia.remove(socialMed);
      }
      showSnackBar(Get.context!, "${type} removed  successfully");
    } else {
      showSnackBar(Get.context!, "Somthing went wrong");
    }
    isRemoveSkillAndSocialMedia = false;
    update();
  }

  void updateProfile() async {
    isUpdateProfile = true;
    update();
    if (validate() != "") {
      showSnackBar(Get.context!, validate());
      isUpdateProfile = false;
      update();
      return;
    }
    Map<String, dynamic> data = {};
    if (nameController.text.trim() != homeVM.user!.name) {
      data["name"] = nameController.text.trim();
    }
    if (usernameController.text.trim() != homeVM.user!.username) {
      data["username"] = usernameController.text.trim();
    }
    if (phoneController.text.trim() != homeVM.user!.mobile) {
      data["mobile"] = phoneController.text.trim();
    }
    if (emailController.text.trim() != homeVM.user!.email) {
      data["email"] = emailController.text.trim();
    }
    if (bioController.text.trim() != homeVM.user!.bio) {
      data["bio"] = bioController.text.trim();
    }
    bool res = await profileRepoImp.updateProfile(data);
    if (res) {
      showSnackBar(Get.context!, "Profile updated successfully");
    } else {
      showSnackBar(Get.context!, "Somthing went wrong");
    }
    isUpdateProfile = false;
    update();
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
