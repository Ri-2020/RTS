import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rts/constants/colors.dart';
import 'package:rts/ui/edit_profile/edit_profile_viewmodel.dart';
import 'package:rts/utils/binding.dart';

class RoundContainer extends StatelessWidget {
  final String skill;
  const RoundContainer({
    super.key,
    required this.skill,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileVM>(builder: (vm) {
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
            const SizedBox(
              width: 10,
            ),
            CircleAvatar(
              radius: 7,
              backgroundColor: Colors.white,
              child: InkWell(
                onTap: () {
                  vm.removeSkill(skill);
                },
                child: const Icon(
                  Icons.close_outlined,
                  size: 14,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
