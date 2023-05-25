import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts/constants/google_fonts.dart';
import 'package:rts/constants/strings.dart';
import 'package:rts/ui/home/home_vm.dart';
import 'package:rts/utils/routes.dart';
import 'package:rts/widgets/media_query_style.dart';
import 'package:rts/widgets/page_frame/page_frame.dart';
import 'package:rts/widgets/page_frame/page_frame_header_button.dart';
import 'package:rts/widgets/round_container.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    // DashboardVM vm = Get.isRegistered<DashboardVM>()
    //     ? Get.find<DashboardVM>()
    //     : Get.put(DashboardVM());
    HomeVM homeVM =
        Get.isRegistered<HomeVM>() ? Get.find<HomeVM>() : Get.put(HomeVM());
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<HomeVM>(
      builder: (homeVM) {
        return PageFrame(
          // isPadding: width > 820,
          width: width,
          pageTitle: UseString.Dashboard,
          pageDescription: "/${UseString.dashboard}",
          imageUrl:
              "https://www.alexisdental.ca/files/alexis-dental-belle-river-fillings-1.jpg",
          headerButtons: [
            PageFrameHeaderButton(
              onTap: () {
                Get.toNamed(AppRotutes.editProfile);
              },
              label: UseString.edit_profile,
            ),
          ],
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 70),
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                homeVM.user?.name ?? UseString.user_name_not_found,
                style: TextStyle(
                  fontFamily: UseString.font_family,
                  color: Colors.black,
                  fontSize: width < 500 ? 15 : 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                left: 30,
                right: 15,
                // top: 15,
                bottom: 15,
              ),
              child: Text(
                "${homeVM.user?.email}",
                style: const TextStyle(
                  fontFamily: UseString.font_family,
                  color: Colors.grey,
                ),
              ),
            ),
            MediaQueryStyle(
              rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
              isColumn: width < 820,
              rowCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: width < 820
                      ? width * 0.8
                      : width < 1000
                          ? width * 0.30
                          : width * 0.35,
                  margin: EdgeInsets.all(width < 500 ? 0 : 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          "I am a passionate student at Rajkiya Engineering College Azamgarh, driven by my love for programming. Joining the Incandescent group has allowed me to further develop my skills and engage with like-minded individuals. Through their bootcamps, seminars, and talks, I am expanding my knowledge, gaining practical experience, and building a strong foundation for my programming journey. With Incandescent, I am excited to embrace challenges, pursue excellence, and unlock my full potential in the world of programming.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            //  GoogleFonts.openSans(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 1,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  width: width < 900
                      ? width < 800
                          ? width * 0.8
                          : width * 0.33
                      : width * 0.37,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Skills",
                        style: TextStyle(
                          //  GoogleFonts.openSans(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      homeVM.user!.skills.isNotEmpty
                          ? Wrap(
                              children: homeVM.user!.skills
                                  .map(
                                    (e) => RoundContainerStatic(
                                      skill: e,
                                    ),
                                  )
                                  .toList(),
                            )
                          : Text(
                              "Skills Not Added yet",
                              style: TextStyle(
                                // GoogleFonts.openSans(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                    ],
                  ),

                  // child: const Text("Skills unser Cnstruction"),
                ),
                const Divider(),
              ],
            ),
          ],
        );
      },
    );
  }
}
