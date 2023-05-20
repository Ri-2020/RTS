import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:rts/ui/bootcamp_details_screen/bootcamp_details_vm.dart';

class BootcampDetailsScreen extends StatelessWidget {
  const BootcampDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BootcampDetailsVM>(builder: (vm) {
      return const Scaffold();
    });
  }
}
