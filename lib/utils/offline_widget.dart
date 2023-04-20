import 'package:flutter/material.dart';
import 'package:get/get.dart';

class offlineWidget extends StatelessWidget {
  const offlineWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/offline.png',
                width: 150,
                height: 150,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Seem's like you aren't connected\n to internet",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ));
  }
}
