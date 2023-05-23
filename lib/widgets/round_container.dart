import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rts/constants/colors.dart';
import 'package:rts/ui/edit_profile/edit_profile_viewmodel.dart';
import 'package:rts/utils/binding.dart';

class RoundContainerStatic extends StatelessWidget {
  final String skill;
  RoundContainerStatic({
    super.key,
    required this.skill,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey[800]!,
        borderRadius: BorderRadius.circular(36),
      ),
      child: Text(
        skill,
        style: GoogleFonts.openSans(
          color: Colors.grey[300],
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}

class RoundContainer extends StatelessWidget {
  final String skill;
  final bool isRemoveable;
  RoundContainer({
    super.key,
    required this.skill,
    this.isRemoveable = true,
  });

  EditProfileVM editProfilevm = Get.isRegistered<EditProfileVM>()
      ? Get.find<EditProfileVM>()
      : Get.put(EditProfileVM());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileVM>(builder: (editProfilevm) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.grey[800]!,
          borderRadius: BorderRadius.circular(36),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              skill,
              style: GoogleFonts.openSans(
                color: Colors.grey[300],
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              width: isRemoveable ? 10 : 0,
            ),
            isRemoveable
                ? CircleAvatar(
                    radius: 7,
                    backgroundColor: Colors.white,
                    child: InkWell(
                      onTap: () {
                        editProfilevm.removeSkillAndSocialMedia(
                            type: "skill", skill: skill);
                      },
                      child: const Icon(
                        Icons.close_outlined,
                        size: 14,
                        color: Colors.black,
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      );
    });
  }
}
