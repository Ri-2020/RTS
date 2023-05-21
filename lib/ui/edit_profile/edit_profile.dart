import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rts/constants/colors.dart';
import 'package:rts/constants/google_fonts.dart';
import 'package:rts/constants/strings.dart';
import 'package:rts/ui/edit_profile/edit_profile_viewmodel.dart';
import 'package:rts/ui/register/signup.dart';
import 'package:rts/utils/routes.dart';
import 'package:rts/widgets/custom_text_form_field.dart';
import 'package:rts/widgets/page_frame/page_frame.dart';
import 'package:rts/widgets/round_container.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<EditProfileVM>(builder: (vm) {
      return Scaffold(
        body: PageFrame(
          pageTitle: UseString.edit_profile,
          pageDescription: "/edit_profile",
          isPadding: false,
          headerButtons: [],
          children: [
            Container(
              margin: EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: width * 0.25,
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
                        LabelField(name: "Bio"),
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
                        width: width * 0.60,
                        margin: EdgeInsets.all(30),
                        padding: EdgeInsets.all(20),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    duration: const Duration(milliseconds: 300),
                                    width: vm.isAddingSkill ? 250 : 0,
                                    child: TextField(
                                      controller: vm.addSkillController,
                                      decoration: InputDecoration(
                                        hintText: "Add Skill",
                                        suffixIcon: !vm.isAddingSkill
                                            ? null
                                            : Container(
                                                margin:
                                                    EdgeInsets.only(right: 6),
                                                decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(36),
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
                                                    BorderRadius.circular(36),
                                                borderSide:
                                                    BorderSide(width: 0),
                                              ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.black,
                                    child: IconButton(
                                      onPressed: () {
                                        vm.isAddingSkill = !vm.isAddingSkill;
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
                              margin: const EdgeInsets.symmetric(vertical: 20),
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
                        width: width * 0.60,
                        margin: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 30,
                        ),
                        padding: EdgeInsets.all(20),
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
                        child: Text(
                          "Social Media Links",
                          style: GoogleFonts.openSans(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
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
      // Container(
      //   margin: EdgeInsets.all(10),
      //   child:
      //    Text(
      //     title,
      //     style: GoogleFonts.openSans(
      //       fontSize: 14,
      //       fontWeight: FontWeight.w500,
      //     ),
      //   ),
      // ),
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

// Container(
//                 margin: EdgeInsets.all(30),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.all(10),
//                       width: width * 0.25,
//                       child: Column(
//                         children: [
//                           changeInput(
//                             controller: vm.nameController,
//                             title: "Name",
//                             hint: "Enter Name",
//                           ),
//                           changeInput(
//                             controller: vm.usernameController,
//                             title: "Username",
//                             hint: "Enter username",
//                           ),
//                           changeInput(
//                             controller: vm.emailController,
//                             title: "Email",
//                             hint: "Enter Email",
//                           ),
//                           changeInput(
//                             controller: vm.phoneController,
//                             title: "Phone Number",
//                             hint: "Enter Phone Number",
//                           ),
//                           LabelField(name: "Bio"),
//                           TextFormField(
//                             minLines: 3,
//                             maxLines: null,
//                             controller: vm.bioController,
//                             decoration: InputDecoration(
//                                 hintText: "Tell us about yourself...",
//                                 hintStyle: TextStyle(
//                                   color: Colors.grey.shade500,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                                 contentPadding: const EdgeInsets.symmetric(
//                                     vertical: 10, horizontal: 20),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(4),
//                                   borderSide: const BorderSide(width: 1),
//                                 ),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(4),
//                                   borderSide: const BorderSide(width: 1),
//                                 )),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Column(
//                       children: [
//                         Container(
//                           width: width * 0.60,
//                           margin: EdgeInsets.all(30),
//                           padding: EdgeInsets.all(20),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(30),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.5),
//                                 spreadRadius: 0,
//                                 blurRadius: 2,
//                                 offset: const Offset(
//                                     0, 0), // changes position of shadow
//                               ),
//                             ],
//                           ),
//                           child: Column(
//                             children: [
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     "Skills",
//                                     style: GoogleFonts.openSans(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Row(children: [
//                                     AnimatedContainer(
//                                       duration:
//                                           const Duration(milliseconds: 300),
//                                       width: vm.isAddingSkill ? 250 : 0,
//                                       child: TextField(
//                                         controller: vm.addSkillController,
//                                         decoration: InputDecoration(
//                                           hintText: "Add Skill",
//                                           suffixIcon: !vm.isAddingSkill
//                                               ? null
//                                               : Container(
//                                                   margin:
//                                                       EdgeInsets.only(right: 6),
//                                                   decoration: BoxDecoration(
//                                                     color: Colors.black,
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             36),
//                                                   ),
//                                                   child: IconButton(
//                                                     onPressed: () {
//                                                       vm.addSkill();
//                                                     },
//                                                     icon: const Icon(
//                                                       Icons.add,
//                                                       color: Colors.white,
//                                                     ),
//                                                   ),
//                                                 ),
//                                           hintStyle: TextStyle(
//                                             color: Colors.grey.shade500,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                           contentPadding:
//                                               const EdgeInsets.symmetric(
//                                             vertical: 10,
//                                             horizontal: 20,
//                                           ),
//                                           focusedBorder: OutlineInputBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(36),
//                                             borderSide:
//                                                 const BorderSide(width: 1),
//                                           ),
//                                           border: !vm.isAddingSkill
//                                               ? InputBorder.none
//                                               : OutlineInputBorder(
//                                                   borderRadius:
//                                                       BorderRadius.circular(36),
//                                                   borderSide:
//                                                       BorderSide(width: 0),
//                                                 ),
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(width: 10),
//                                     CircleAvatar(
//                                       radius: 20,
//                                       backgroundColor: Colors.black,
//                                       child: IconButton(
//                                         onPressed: () {
//                                           vm.isAddingSkill = !vm.isAddingSkill;
//                                           vm.update();
//                                         },
//                                         icon: Icon(
//                                           vm.isAddingSkill
//                                               ? Icons.close
//                                               : Icons.add,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                     ),
//                                   ]),
//                                 ],
//                               ),
//                               Container(
//                                 width: double.infinity,
//                                 margin:
//                                     const EdgeInsets.symmetric(vertical: 20),
//                                 child: vm.skills.isNotEmpty
//                                     ? Wrap(
//                                         alignment: WrapAlignment.start,
//                                         children: vm.skills
//                                             .map(
//                                               (e) => RoundContainer(
//                                                 skill: e,
//                                               ),
//                                             )
//                                             .toList(),
//                                       )
//                                     : Center(
//                                         child: SizedBox(
//                                           height: 50,
//                                           child: Text(
//                                             UseString.no_skills_added,
//                                             style: GoogleFonts.openSans(
//                                               fontSize: 15,
//                                               color: Colors.grey,
//                                               fontWeight: FontWeight.w500,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           width: width * 0.60,
//                           margin: const EdgeInsets.symmetric(
//                             vertical: 15,
//                             horizontal: 30,
//                           ),
//                           padding: EdgeInsets.all(20),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(30),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.5),
//                                 spreadRadius: 0,
//                                 blurRadius: 2,
//                                 offset: const Offset(
//                                     0, 0), // changes position of shadow
//                               ),
//                             ],
//                           ),
//                           child: Text(
//                             "Social Media Links",
//                             style: GoogleFonts.openSans(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
