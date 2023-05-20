import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:rts/ui/edit_profile/edit_profile_viewmodel.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileVM>(builder: (vm) {
      return Scaffold(
        body: Container(
          child: Text("Edit Profile Page"),
        ),
      );
    });
  }
}
