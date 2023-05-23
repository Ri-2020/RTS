import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rts/constants/google_fonts.dart';
import 'package:rts/constants/strings.dart';
import 'package:rts/ui/dashboard/dashboard_vm.dart';
import 'package:rts/ui/home/home_vm.dart';
import 'package:rts/utils/constants.dart';
import 'package:rts/utils/routes.dart';
import 'package:rts/widgets/media_query_style.dart';
import 'package:rts/widgets/page_frame/page_frame.dart';
import 'package:rts/widgets/page_frame/page_frame_header_button.dart';
import 'package:rts/widgets/round_container.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardVM vm = Get.find<DashboardVM>();
    HomeVM homeVM =
        Get.isRegistered<HomeVM>() ? Get.find<HomeVM>() : Get.put(HomeVM());
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<HomeVM>(
      builder: (vm) {
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
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                homeVM.user?.username ?? UseString.user_name_not_found,
                style: UseGoogleFont().openSans(
                  color: Colors.black,
                  size: width < 500 ? 15 : 20,
                  weight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              // color: Colors.black,
              padding: const EdgeInsets.only(
                left: 20,
                right: 15,
                // top: 15,
                bottom: 15,
              ),
              child: Text(
                "${vm.user?.email}",
                style: UseGoogleFont().openSans(
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
                        child: const Text(
                          "I am a B.Tech. Student at Rajkiya Engineering College Azamgarh.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Container(
                        width: width < Constants.mwidth
                            ? width * 0.8
                            : width * 0.25,
                        margin: const EdgeInsets.only(top: 20),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          "Some thing here",
                          style: TextStyle(
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
                        style: GoogleFonts.openSans(
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
                                    (e) => RoundContainer(
                                      skill: e,
                                      isRemoveable: false,
                                    ),
                                  )
                                  .toList(),
                            )
                          : Text(
                              "Skills Not Added yet",
                              style: GoogleFonts.openSans(
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
