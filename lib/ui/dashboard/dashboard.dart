import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts/constants/google_fonts.dart';
import 'package:rts/constants/strings.dart';
import 'package:rts/ui/dashboard/dashboard_vm.dart';
import 'package:rts/ui/home/home_vm.dart';
import 'package:rts/utils/constants.dart';
import 'package:rts/utils/routes.dart';
import 'package:rts/widgets/media_query_style.dart';
import 'package:rts/widgets/page_frame/page_frame.dart';
import 'package:rts/widgets/page_frame/page_frame_header_button.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardVM vm = Get.find<DashboardVM>();
    HomeVM homeVM = Get.find<HomeVM>();
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<HomeVM>(
      builder: (vm) {
        return PageFrame(
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
              isColumn: width < 819,
              rowCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: width < 819
                      ? width * 0.8
                      : width < 1000
                          ? width * 0.30
                          : width * 0.35,
                  margin: EdgeInsets.all(width < 500 ? 0 : 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          "John Doe is a software developer with over 10 years of experience. He is currently a senior software engineer at Google, where he works on the development of the company's search engine. John is a highly skilled developer with a strong understanding of computer science. ",
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
                            // color:
                            // Color.fromRGBO(101, 101, 101, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: width < 900
                      ? width < 800
                          ? width * 0.8
                          : width * 0.25
                      : width * 0.3,
                  child: const Text(
                      "John Doe is a software developer with over 10 years of experience. He is currently a senior software engineer at Google, where he works on the development of the company's search engine. John is a highly skilled developer with a strong understanding of computer science. He is also a talented problem solver and is able to quickly come up with creative solutions to complex problems. John is a valuable asset to any team and is always willing to help others. He is also a great communicator and is able to clearly explain complex technical concepts to both technical and non-technical audiences. John is a passionate developer who is always looking for new ways to improve his skills and knowledge. He is also a strong advocate for diversity and inclusion in the tech industry. John is a role model for aspiring developers and is an inspiration to his colleagues."),
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
