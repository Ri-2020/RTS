import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts/ui/home/home_vm.dart';

class LoggedInHome extends StatelessWidget {
  const LoggedInHome({super.key});

  @override
  Widget build(BuildContext context) {
    HomeVM vm = Get.find<HomeVM>();
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              vm.homeTitle,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                Icon(Icons.arrow_forward_sharp),
                Text(
                  "Bootcamps",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: Get.width - 270,
                  minWidth: Get.width - 300,
                ),
                child: Wrap(
                  runAlignment: WrapAlignment.spaceBetween,
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    ...vm.test,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
