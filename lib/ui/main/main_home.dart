import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rts/constants/strings.dart';
import 'package:rts/ui/register/signin.dart';
import 'package:rts/utils/constants.dart';
import 'package:rts/utils/routes.dart';
import 'package:rts/utils/shared_prefer.dart';
import 'package:url_launcher/url_launcher.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  String name = "";

  void getUserName() async {
    name = await SharedPrefs.getString("name") != null
        ? "User Space"
        : UseString.signin;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserName();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: width,
          height: height,
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
        width < 1000
            ? Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.purple, width: 2),
                  ),
                  child: Text(
                    "Developed By:\n\nRohit Gupta\nVikram Negi",
                    textAlign: TextAlign.end,
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
              )
            : const SizedBox(),
        Positioned(
          width: Get.width,
          top: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 125,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(UseString.website_name,
                            style: TextStyle(
                              fontSize: width < 600 ? 16 : 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            )),
                        // const SizedBox(height: 5),
                        const Divider(
                          thickness: 1,
                          color: Colors.white,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Fultter Bootcamp",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey.shade200,
                                  fontWeight: FontWeight.bold,
                                )),
                            Icon(Icons.arrow_forward,
                                size: 15, color: Colors.grey.shade200),
                          ],
                        ),
                      ]),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (name == UseString.signin) {
                      Get.to(() => Signin());
                    } else {
                      Get.toNamed(AppRotutes.home);
                    }
                  },
                  child: Row(
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: width < 600 ? 10 : 14,
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Icon(
                        Icons.arrow_forward,
                        size: width < 600 ? 10 : null,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        width < 1000
            ? Positioned(
                bottom: 1,
                child: SizedBox(
                  width: width,
                  child: Center(
                    child: InkWell(
                      onTap: () {},
                      child: SizedBox(
                        width: 50,
                        child: Column(
                          children: [
                            Transform(
                              transform: Matrix4.rotationX(3.14),
                              child: Image.asset(
                                "assets/gifs/arrowdown.gif",
                                width: 50,
                                height: 23,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Transform(
                              transform: Matrix4.rotationX(3.14),
                              child: Image.asset(
                                "assets/gifs/arrowdown.gif",
                                width: 40,
                                height: 18,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Transform(
                              transform: Matrix4.rotationX(3.14),
                              child: Image.asset(
                                "assets/gifs/arrowdown.gif",
                                width: 30,
                                height: 13,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox(),
        Positioned(
          top: width < 600 ? height * 0.3 : height * 0.25,
          child: Container(
              margin: EdgeInsets.only(left: width < 600 ? 50 : 100, right: 20),
              height: Get.height,
              width: width < 1000 ? null : width - 120,
              decoration: const BoxDecoration(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                UseString.website_name_caps,
                                style: GoogleFonts.openSans(
                                  letterSpacing: 2.3,
                                  fontSize: width < 600 ? 40 : 48,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                height: 2,
                                width: width < 600 ? 100 : 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                width < 600
                                    ? "Where Brilliance Ignites and \nInnovation Glows"
                                    : "Where Brilliance Ignites and Innovation Glows",
                                style: GoogleFonts.openSans(
                                  fontSize: width < 600 ? 16 : 18,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                              width < 600
                                  ? "May 22 - May 25, 2023 \nIT Semenar Hall"
                                  : "May 22 - May 25, 2023 | IT Semenar Hall",
                              style: TextStyle(
                                fontSize: width < 600 ? 12 : 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 3,
                                color: Colors.white,
                              )),
                        ),
                        InkWell(
                          onTap: () async {
                            const url = "https://forms.gle/mn6dEC1LkTdxtJrT8";
                            if (await canLaunchUrl(Uri.parse(url))) {
                              await launchUrl(Uri.parse(url));
                            }
                          },
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 35),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.white,
                                  )),
                              child: Text(
                                "Register Now",
                                style: TextStyle(
                                  fontSize: width < 600 ? 13 : 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                ),
                              )),
                        )
                      ]),
                  width < 1000
                      ? const SizedBox()
                      : Column(
                          children: [
                            Container(
                              height: 350,
                              width: 400,
                              margin: const EdgeInsets.only(left: 40),
                              padding: const EdgeInsets.all(40),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  border: Border.all(
                                    color: Colors.purpleAccent,
                                    width: 2,
                                  )),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("LATEST",
                                      style: TextStyle(
                                          fontSize: 22, color: Colors.white)),
                                  const SizedBox(height: 30),
                                  const Text(
                                      "Get Ready For ${UseString.short_website_name}'s Flutter Bootcaamp",
                                      style: TextStyle(
                                          fontSize: 22, color: Colors.white)),
                                  const SizedBox(height: 40),
                                  const Text("Register Yourself",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white)),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    color: Colors.yellowAccent,
                                    height: 3,
                                    width: 150,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                            Container(
                              height: 50,
                              width: 400,
                              margin: const EdgeInsets.only(left: 40),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  border: Border.all(
                                    color: Colors.purpleAccent,
                                    width: 2,
                                  )),
                              child: const Text(
                                "Developed by Vikram Negi & Rohit Gupta",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                ],
              )),
        ),
        // Container(child: const Icon(Icons.menu)),
      ],
    ));
  }
}
