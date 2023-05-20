import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rts/constants/colors.dart';
import 'package:rts/constants/google_fonts.dart';
import 'package:rts/constants/strings.dart';
import 'package:rts/ui/edit_profile/edit_profile_viewmodel.dart';
import 'package:rts/utils/routes.dart';
import 'package:rts/widgets/custom_text_form_field.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<EditProfileVM>(builder: (vm) {
      return Scaffold(
        body: Container(
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      width: Get.width,
                      height: Get.height,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black,
                            Color.fromARGB(255, 29, 2, 103),
                            Colors.deepPurpleAccent,
                            Colors.red,
                            Colors.black
                          ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          stops: [0.0, 0.1, 0.2, 0.76, 1.0],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      child: Container(
                          width: Get.width,
                          height: Get.height,
                          decoration: BoxDecoration(
                            gradient: RadialGradient(
                              colors: [
                                Colors.black.withOpacity(0.51),
                                Colors.transparent,
                              ],
                              radius: Get.width * 0.45,
                            ),
                          )),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            UseString.edit_profile,
                            style: UseGoogleFont().openSans(
                              size: 30,
                              color: Colors.white,
                              weight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            AppRotutes.editProfile,
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
                        ],
                      ),
                    ),
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
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.add),
                              ),
                            ],
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(vertical: 20),
                            child: Wrap(
                              alignment: WrapAlignment.start,
                              children: vm.skills
                                  .map((e) => RoundContainer(skill: e))
                                  .toList(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
      Container(
        margin: EdgeInsets.all(10),
        child: Text(
          title,
          style: GoogleFonts.openSans(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
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

class RoundContainer extends StatelessWidget {
  final String skill;
  const RoundContainer({
    super.key,
    required this.skill,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.blackColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        skill,
        style: GoogleFonts.openSans(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
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
