import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts/constants/strings.dart';
import 'package:rts/ui/register/signin.dart';
import 'package:rts/ui/register/signup_viewmodel.dart';
import 'package:rts/utils/snackbar.dart';
import 'package:rts/widgets/custom_text_form_field.dart';

import '../../utils/routes.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  SignupVM vm =
      Get.isRegistered<SignupVM>() ? Get.find<SignupVM>() : Get.put(SignupVM());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<SignupVM>(builder: (vm) {
      return Scaffold(
        backgroundColor: Colors.blueGrey.shade50,
        body: Padding(
          padding: const EdgeInsets.all(0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 25.0, horizontal: 40),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 125,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(UseString.website_name,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                    )),
                                const SizedBox(height: 5),
                                const Divider(thickness: 1),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Fultter Bootcamp",
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.grey.shade600,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    const Icon(Icons.arrow_forward, size: 15),
                                  ],
                                ),
                              ]),
                        ),
                        Row(children: [
                          ElevatedButton(
                              onPressed: () {
                                Get.toNamed(AppRotutes.signin);
                              },
                              child: Text("Sign in",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.shade800,
                                    fontWeight: FontWeight.w500,
                                  )))
                        ])
                      ]),
                ),
                const SizedBox(height: 50),
                Center(
                  child: Container(
                    width: width > 440 ? 400 : width * 0.95,
                    padding: EdgeInsets.symmetric(
                        vertical: 50, horizontal: width > 440 ? 35 : 25),
                    decoration: BoxDecoration(
                      color: width > 440 ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: vm.registerPage == 0
                                  ? Colors.grey
                                  : Colors.black,
                              child: IconButton(
                                onPressed: () {
                                  vm.registerPage = 0;
                                  vm.update();
                                },
                                icon: const Icon(Icons.arrow_back_ios,
                                    size: 15, color: Colors.white),
                              ),
                            ),
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: vm.registerPage == 1
                                  ? Colors.grey
                                  : Colors.black,
                              child: IconButton(
                                onPressed: () {
                                  vm.registerPage = 1;
                                  vm.update();
                                },
                                icon: const Icon(Icons.arrow_forward_ios,
                                    size: 15, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text("Student Registration",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.w900,
                            )),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 250,
                          child: Text(
                              textAlign: TextAlign.center,
                              "Welcome, Enter your details to register your account",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.w800,
                              )),
                        ),
                        vm.registerPage == 0
                            ? Column(
                                children: [
                                  const LabelField(name: "Email Address"),
                                  CustomTextFormField(
                                    hintText: "Enter Email/Phone No",
                                    controller: vm.registerEmailController,
                                  ),
                                  const LabelField(name: "Password"),
                                  SizedBox(
                                    height: 35,
                                    child: TextFormField(
                                      obscureText: !vm.showPassword,
                                      controller: vm.registerPasswordController,
                                      decoration: InputDecoration(
                                          hintText: "Enter Password",
                                          hintStyle: TextStyle(
                                            color: Colors.grey.shade500,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 20),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide:
                                                const BorderSide(width: 1),
                                          ),
                                          suffix: InkWell(
                                            onTap: () {
                                              vm.showPassword =
                                                  !vm.showPassword;

                                              vm.update();
                                            },
                                            child: Text(vm.showPassword
                                                ? "hide"
                                                : "show"),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide:
                                                const BorderSide(width: 1),
                                          )),
                                    ),
                                  ),
                                  const LabelField(name: "Password"),
                                  SizedBox(
                                    height: 35,
                                    child: TextFormField(
                                      obscureText: !vm.showConfirmPassword,
                                      controller: vm.confirmPasswordController,
                                      decoration: InputDecoration(
                                          hintText: "Confirm Password",
                                          hintStyle: TextStyle(
                                            color: Colors.grey.shade500,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 20),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide:
                                                const BorderSide(width: 1),
                                          ),
                                          suffix: InkWell(
                                            onTap: () {
                                              vm.showConfirmPassword =
                                                  !vm.showConfirmPassword;

                                              vm.update();
                                            },
                                            child: Text(vm.showConfirmPassword
                                                ? "hide"
                                                : "show"),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide:
                                                const BorderSide(width: 1),
                                          )),
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox(),
                        vm.registerPage == 1
                            ? Column(
                                children: [
                                  const LabelField(name: "Full Name"),
                                  CustomTextFormField(
                                    hintText: "Enter Your full Name",
                                    controller: vm.nameController,
                                  ),
                                  const LabelField(name: "Username"),
                                  CustomTextFormField(
                                    hintText: "Enter Your Username",
                                    controller: vm.usernameController,
                                  ),
                                  const LabelField(name: "Roll No"),
                                  CustomTextFormField(
                                    hintText: "Enter Roll No",
                                    controller: vm.rollNoController,
                                  ),
                                ],
                              )
                            : const SizedBox(),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Having trouble in sign up?",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            if (vm.registerPage == 1) {
                              vm.signupUser();
                            }
                            if (vm.registerEmailController.text.isEmpty ||
                                vm.registerPasswordController.text.isEmpty ||
                                vm.confirmPasswordController.text.isEmpty) {
                              showSnackBar(
                                  context, "Please Enter All fields", true);
                              return;
                            }
                            vm.registerPage = 1;
                            vm.update();
                          },
                          child: Container(
                            width: 360,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(240, 191, 78, 1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child:
                                (vm.isSignupBtnClicked && vm.registerPage == 1)
                                    ? const Center(
                                        child: SizedBox(
                                        height: 25,
                                        width: 25,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      ))
                                    : Center(
                                        child: Text(
                                        vm.registerPage == 0
                                            ? "Proceed Next"
                                            : "Sign up",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.white60,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      )),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                // Get.toNamed(AppRotutes.signin);
                                Get.to(() => Signin());
                              },
                              child: Text(
                                "Sign in",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.blue.shade300,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class LabelField extends StatelessWidget {
  const LabelField({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, bottom: 10),
        child: Text(
          name,
          style: const TextStyle(
            // color: Colors.grey.shade500,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
