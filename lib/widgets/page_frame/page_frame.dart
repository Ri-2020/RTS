import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rts/constants/google_fonts.dart';

class PageFrame extends StatelessWidget {
  final List<Widget>? headerButtons;
  final double width;
  final String? imageUrl;
  final String pageTitle;
  final String? pageDescription;
  final List<Widget>? children;
  final bool isPadding;
  const PageFrame({
    super.key,
    this.headerButtons,
    this.imageUrl,
    required this.pageTitle,
    this.pageDescription,
    required this.width,
    this.children,
    this.isPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: width < 820 ? null : EdgeInsets.all(isPadding ? 20 : 0),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // GRADIENT STARTS HERE
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
                                  pageTitle,
                                  style: GoogleFonts.openSans(
                                    fontSize: width < 460 ? 20 : 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                pageDescription != null
                                    ? Text(
                                        pageDescription!,
                                        style: GoogleFonts.openSans(
                                          fontSize: 10,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w100,
                                        ),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            right: 20,
                            child: Row(
                              children:
                                  headerButtons != null ? headerButtons! : [],
                            ),
                          ),
                        ],
                      ),
                    ),
                    children != null
                        ? Column(children: children!)
                        : const SizedBox(),
                  ],
                ),

                //Profile Image of the Page
                imageUrl != null
                    ? Positioned(
                        top: 150,
                        left: 20,
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              imageUrl!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
