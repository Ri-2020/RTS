import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rts/constants/colors.dart';
import 'package:rts/constants/google_fonts.dart';
import 'package:rts/constants/strings.dart';
import 'package:rts/models/user_model.dart';
import 'package:rts/ui/edit_profile/edit_profile_viewmodel.dart';
import 'package:rts/ui/register/signup.dart';
import 'package:rts/utils/routes.dart';
import 'package:rts/widgets/custom_text_form_field.dart';
import 'package:rts/widgets/media_query_style.dart';
import 'package:rts/widgets/page_frame/page_frame.dart';
import 'package:rts/widgets/page_frame/page_frame_header_button.dart';
import 'package:rts/widgets/round_container.dart';
import 'package:url_launcher/url_launcher.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<EditProfileVM>(builder: (vm) {
      return Scaffold(
        body: PageFrame(
          width: width,
          pageTitle: UseString.edit_profile,
          pageDescription: "/edit_profile",
          isPadding: false,
          headerButtons: [
            PageFrameHeaderButton(
              label: UseString.save_changes,
              onTap: () {
                // vm.updateProfile();
                // Get.back();
                vm.updateProfile();
              },
            ),
          ],
          children: [
            vm.isUpdateProfile
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    margin: const EdgeInsets.all(30),
                    child: MediaQueryStyle(
                      rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                      isColumn: width < 1000,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          width: width < 1000 ? width * 0.95 : width * 0.25,
                          child: Column(
                            children: [
                              changeInput(
                                controller: vm.nameController,
                                title: "Name",
                                hint: "Enter Name",
                              ),
                              changeInput(
                                controller: vm.usernameController,
                                title: "Username",
                                hint: "Enter username",
                              ),
                              changeInput(
                                controller: vm.emailController,
                                title: "Email",
                                hint: "Enter Email",
                              ),
                              changeInput(
                                controller: vm.phoneController,
                                title: "Phone Number",
                                hint: "Enter Phone Number",
                              ),
                              const LabelField(name: "Bio"),
                              TextFormField(
                                minLines: 3,
                                maxLines: null,
                                controller: vm.bioController,
                                decoration: InputDecoration(
                                    hintText: "Tell us about yourself...",
                                    hintStyle: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: const BorderSide(width: 1),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: const BorderSide(width: 1),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              width: width < 1000 ? width * 0.95 : width * 0.65,
                              margin: const EdgeInsets.symmetric(vertical: 30),
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 0,
                                    blurRadius: 2,
                                    offset: const Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Skills",
                                        style: GoogleFonts.openSans(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(children: [
                                        AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          width: vm.isAddingSkill ? 250 : 0,
                                          child: TextField(
                                            controller: vm.addSkillController,
                                            decoration: InputDecoration(
                                              hintText: "Add Skill",
                                              suffixIcon: !vm.isAddingSkill
                                                  ? null
                                                  : Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              right: 6),
                                                      decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(36),
                                                      ),
                                                      child: IconButton(
                                                        onPressed: () {
                                                          vm.addSkill();
                                                        },
                                                        icon: const Icon(
                                                          Icons.add,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                              hintStyle: TextStyle(
                                                color: Colors.grey.shade500,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 10,
                                                horizontal: 20,
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(36),
                                                borderSide:
                                                    const BorderSide(width: 1),
                                              ),
                                              border: !vm.isAddingSkill
                                                  ? InputBorder.none
                                                  : OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              36),
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 0),
                                                    ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Colors.black,
                                          child: IconButton(
                                            onPressed: () {
                                              vm.isAddingSkill =
                                                  !vm.isAddingSkill;
                                              vm.update();
                                            },
                                            icon: Icon(
                                              vm.isAddingSkill
                                                  ? Icons.close
                                                  : Icons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ],
                                  ),
                                  Container(
                                    width: double.infinity,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: vm.skills.isNotEmpty
                                        ? Wrap(
                                            alignment: WrapAlignment.start,
                                            children: vm.skills
                                                .map(
                                                  (e) => RoundContainer(
                                                    skill: e,
                                                  ),
                                                )
                                                .toList(),
                                          )
                                        : Center(
                                            child: SizedBox(
                                              height: 50,
                                              child: Text(
                                                UseString.no_skills_added,
                                                style: GoogleFonts.openSans(
                                                  fontSize: 15,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: width < 1000 ? width * 0.95 : width * 0.65,
                              margin: const EdgeInsets.symmetric(
                                vertical: 15,
                              ),
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 0,
                                    blurRadius: 2,
                                    offset: const Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    "Social Media Links",
                                    style: GoogleFonts.openSans(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  MediaQueryStyle(
                                    isColumn: width < 600,
                                    children: [
                                      MediaQueryStyle(
                                        isColumn: width < 600,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            width:
                                                width < 600 ? width * 0.7 : 200,
                                            child: TextField(
                                              controller:
                                                  vm.socialMediaNameController,
                                              decoration: InputDecoration(
                                                hintText: "Social Media Name",
                                                hintStyle: TextStyle(
                                                  color: Colors.grey.shade500,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 20),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(36),
                                                  borderSide: const BorderSide(
                                                      width: 1),
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(36),
                                                  borderSide: const BorderSide(
                                                      width: 1),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            width:
                                                width < 600 ? width * 0.7 : 200,
                                            child: TextField(
                                              controller:
                                                  vm.socialMediaUrlController,
                                              decoration: InputDecoration(
                                                hintText: "Social Media Url",
                                                hintStyle: TextStyle(
                                                  color: Colors.grey.shade500,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 20),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(36),
                                                  borderSide: const BorderSide(
                                                      width: 1),
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(36),
                                                  borderSide: const BorderSide(
                                                      width: 1),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 10),
                                      InkWell(
                                        onTap: () {
                                          vm.addSocialMedia();
                                        },
                                        child: Container(
                                          width: width < 600 ? width * 0.7 : 70,
                                          height: 45,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          decoration: const BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(36),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Add",
                                              style: GoogleFonts.openSans(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    width: double.infinity,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: vm.socialMedia.isNotEmpty
                                        ? Column(
                                            // alignment: WrapAlignment.start,
                                            children: vm.socialMedia
                                                .map((entry) => SocialMediaTile(
                                                    width: width,
                                                    entry: entry,
                                                    onDelete: () {
                                                      entry.process = false;
                                                      vm.update();
                                                      vm.removeSkillAndSocialMedia(
                                                        type: 'socialMedia',
                                                        socialMed: entry,
                                                      );
                                                      // vm.removeSocialMedia(
                                                      //     entry);
                                                    }))
                                                .toList())
                                        : Center(
                                            child: SizedBox(
                                              height: 50,
                                              child: Text(
                                                UseString.no_social_media_added,
                                                style: GoogleFonts.openSans(
                                                  fontSize: 15,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      );
    });
  }
}

Widget changeInput({
  controller,
  title,
  hint,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      LabelField(
        name: title,
      ),
      CustomTextFormField(
        controller: controller,
        hintText: hint,
      ),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}

class SocialMediaTile extends StatelessWidget {
  final SocialMedia entry;
  final Function onDelete;
  final double width;
  const SocialMediaTile({
    super.key,
    required this.entry,
    required this.width,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: width < 1000 ? width * 0.65 : width * 0.5,
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(36),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 1,
                offset: const Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          child: MediaQueryStyle(
            isColumn: width < 600,
            children: [
              Container(
                margin: EdgeInsets.only(right: width < 600 ? 0 : 20),
                child: Text(
                  entry.name ?? "",
                  style: GoogleFonts.openSans(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                child: Text(
                  entry.link ?? "",
                  style: GoogleFonts.openSans(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            onDelete();
          },
          child: Container(
            width: width < 600 ? null : 45,
            padding: EdgeInsets.all(width < 600 ? 5 : 10),
            margin: EdgeInsets.only(left: width < 600 ? 0 : 20),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(30),
            ),
            child: entry.process
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
          ),
        ),
      ],
    );
  }
}



//   String name;
//   String email;
//   String? mobile;
//   String username;
//   String password;
//   String? profileImage;
//   String? gender;
//   String? bio;
//   List<SocialMedia>? socialMedia; //name and link
//   List<String>? skills;
