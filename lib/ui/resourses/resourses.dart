import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rts/constants/google_fonts.dart';
import 'package:rts/constants/strings.dart';
import 'package:rts/ui/home/home_vm.dart';
import 'package:rts/ui/resourses/resource_box.dart';
import 'package:rts/ui/resourses/resourcesvm.dart';

class Resourses extends StatelessWidget {
  const Resourses({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<ResourcesVM>(builder: (vm) {
      return SelectionArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Color.fromARGB(255, 243, 243, 243),
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
                                // borderRadius: BorderRadius.only(
                                //   topLeft: Radius.circular(10),
                                //   topRight: Radius.circular(10),
                                // ),
                                ),
                            child: Stack(
                              children: [
                                Container(
                                  width: Get.width,
                                  height: Get.height,
                                  decoration: const BoxDecoration(
                                    // borderRadius: BorderRadius.only(
                                    //   topLeft: Radius.circular(10),
                                    //   topRight: Radius.circular(10),
                                    // ),
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
                                        // borderRadius: const BorderRadius.only(
                                        //   topLeft: Radius.circular(10),
                                        //   topRight: Radius.circular(10),
                                        // ),
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
                                        UseString.Get_Resources,
                                        style: UseGoogleFont().openSans(
                                          size: 30,
                                          color: Colors.white,
                                          weight: FontWeight.bold,
                                        ),
                                      ),
                                      const Text(
                                        "/${UseString.resources}",
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
                            width: double.infinity,
                            child: vm.resources.isNotEmpty
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [...vm.resources],
                                  )
                                : Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(30),
                                        width: double.infinity,
                                        margin: const EdgeInsets.only(
                                            top: 20, bottom: 20),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 0,
                                              blurRadius: 2,
                                              offset: const Offset(0,
                                                  0), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Text(
                                          UseString.no_resources_available,
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.openSans(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.grey,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 200,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(30),
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Contact Us",
                        style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "Email: rohitgupta111abcd@gmail.com\nPhone: +91 1234567890",
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 10,
                        fontWeight: FontWeight.w100,
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
