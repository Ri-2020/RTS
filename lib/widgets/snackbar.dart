import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackBar(BuildContext context, String message) {
  double width = MediaQuery.of(context).size.width;
  Get.rawSnackbar(
    maxWidth: width > 450 ? 450 : width,
    message: message,
    backgroundColor: Theme.of(context).primaryColor,
    snackStyle: SnackStyle.FLOATING,
    snackPosition: SnackPosition.BOTTOM,
    // colorText: Colors.white,
    margin: const EdgeInsets.all(10),
    borderRadius: 10,
  );
}
