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
  TextEditingController socialMediaName = TextEditingController();
  TextEditingController socialMediaUrl = TextEditingController();
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

  Map<String, String> socialMediaLink = {};

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
