import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts/constants/google_fonts.dart';
import 'package:rts/ui/home/home_vm.dart';

class LoggedInHome extends StatelessWidget {
  const LoggedInHome({super.key});

  @override
  Widget build(BuildContext context) {
    HomeVM vm = Get.find<HomeVM>();
    return SingleChildScrollView(
      child: Container(
        color: const Color.fromARGB(255, 243, 243, 243),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                                "Bootcamps",
                                style: UseGoogleFont().openSans(
                                  size: 30,
                                  color: Colors.white,
                                  weight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                "/home",
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
          ],
        ),
      ),
    );
  }
}
