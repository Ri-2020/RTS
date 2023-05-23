import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    'Data analysis',
    'Project management',
    'Communication',
    'Problem-solving',
    'Leadership',
    'Teamwork',
    'Time management',
    'Critical thinking',
    'Creativity',
    'Adaptability',
    'Decision-making',
    'Technical writing',
    'Graphic design',
    'Marketing',
    'Negotiation',
    'Public speaking',
    'Research',
    'Financial analysis',
    'Customer service',
  ];

  Map<String, String> socialMedia = {
    "Instagram": "instagram.com/rohit_gupta_indu",
    "Twitter": "twitter.com/rohitgupta",
  };

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
      socialMedia[socialMediaNameController.text] =
          socialMediaUrlController.text;
      socialMediaNameController.clear();
      socialMediaUrlController.clear();
      update();
      showSnackBar(Get.context!, "Url Added", false);
    } else {
      showSnackBar(Get.context!, "Invalid Request", true);
    }
  }

  removeSocialMedia(String key) {
    socialMedia.remove(key);
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
