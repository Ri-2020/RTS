import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackBar(BuildContext context, String message) {
  Get.rawSnackbar(
    message: message,
    backgroundColor: Theme.of(context).primaryColor,
    snackStyle: SnackStyle.FLOATING,
    snackPosition: SnackPosition.TOP,
    // colorText: Colors.white,
    margin: const EdgeInsets.all(10),
    borderRadius: 10,
  );
}
