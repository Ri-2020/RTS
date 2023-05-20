import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rts/models/user_model.dart';
import 'package:rts/remote/register/register_api.dart';
import 'package:rts/ui/home/home.dart';
import 'package:rts/ui/register/signin.dart';
import 'package:rts/utils/routes.dart';
import 'package:rts/utils/shared_prefer.dart';
import 'package:rts/utils/snackbar.dart';

class SignupVM extends GetxController {
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController rollNoController = TextEditingController();

  int registerPage = 0;

  String validate() {
    if (registerEmailController.text.isEmpty ||
        rollNoController.text.isEmpty ||
        usernameController.text.isEmpty ||
        nameController.text.isEmpty ||
        registerPasswordController.text.isEmpty) {
      return "All Field required";
    }
    if (registerPasswordController.text != confirmPasswordController.text) {
      return "Password and confirm password must be same";
    }
    return "";
  }

  void signupUser() async {
    if (validate() != "") {
      showSnackBar(Get.context!, validate(), true);
      return;
    }

    Map<String, String> map = {
      "username": usernameController.text.trim(),
      "password": registerPasswordController.text.trim(),
      "rollNo": rollNoController.text.trim(),
      "name": nameController.text.trim(),
      "email": registerEmailController.text.trim(),
    };

    var res = await RegisterApi.signupUser(map);
    print("res :: $res");
    if (res["status"] == "success") {
      showSnackBar(Get.context!, "User created successfully", false);
      Get.offAll(Signin());
    } else {
      showSnackBar(
          Get.context!, res["message"] ?? "Error while creating user", true);
    }
  }

  bool isSigninClickedBool = false;

  void signinUser() async {
    isSigninClickedBool = true;
    update();
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      showSnackBar(Get.context!, "All Field require", true);
      return;
    }

    Map<String, String> map = {
      "password": passwordController.text.trim(),
      "email": emailController.text.trim(),
    };

    var response = await RegisterApi.signinUser(map);
    print("res :: $response");
    if (response["status"] == "success") {
      showSnackBar(
          Get.context!, response["message"] ?? "login successfully", false);
      await SharedPrefs.setString("user", jsonEncode(response["data"]));
      await SharedPrefs.setString("token", response["token"]);
      await SharedPrefs.setString("name", response["data"]["name"]);
      await SharedPrefs.setString("email", response["data"]["email"]);
      await SharedPrefs.setString("mobile", response["data"]["mobile"] ?? "");
      await SharedPrefs.setBool("isVerified", response["data"]["isVerified"]);
      await SharedPrefs.setString(
          "accountType", response["data"]["accountType"]);
      await SharedPrefs.setBool("isLoggedIn", true);
      print("chechhh");
      String userData = jsonEncode(response);
      // await sharedPrefs.setString("user_id", response["data"]["_id"]);
      await SharedPrefs.setString("userId", response["data"]["_id"]);
      await SharedPrefs.setString("username", response["data"]["username"]);
      print(response.toString());

      // userModel = userModelFromJson(userData);
      var userModel = UserModel.fromJson(userData);
      isSigninClickedBool = false;
      update();
      debugPrint(userModel.toString());
      print("sharef prefs : ${SharedPrefs.getString("userId")}");
      // Get.offAllNamed(AppRotutes.home);
      // Get.offAll(const HomePage());
    } else {
      showSnackBar(Get.context!,
          response["message"] ?? "Error while creating user", true);
    }
    isSigninClickedBool = false;
    update();
  }
}
