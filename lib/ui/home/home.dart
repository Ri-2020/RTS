import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts/constants/strings.dart';
import 'package:rts/ui/home/home_vm.dart';
import 'package:rts/ui/register/signin.dart';
import 'package:rts/utils/constants.dart';
import 'package:side_navigation/side_navigation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<HomeVM>(
      builder: (vm) {
        return Scaffold(
          body: vm.userDataLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          // width: width < Constants.webWidth ? 55 : 280,
                          child: width < Constants.webWidth
                              ? vm.isSideBarVisible
                                  ? SizedBox(
                                      width: 55,
                                      child: SideNavigationBar(
                                        expandable: false,
                                        initiallyExpanded: false,
                                        toggler: null,
                                        header: SideNavigationBarHeader(
                                          title: const Align(
                                            alignment: Alignment.centerLeft,
                                            child: SizedBox(
                                              child: Text("hii",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        UseString.font_family,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w900,
                                                  )),
                                            ),
                                          ),
                                          subtitle: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(""),
                                          ),
                                          image: Container(
                                            margin: const EdgeInsets.only(
                                                top: 10, bottom: 20),
                                            height: 45,
                                            width: 45,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/incandesent_logo.png"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        selectedIndex: vm.selectedIndex,
                                        items: const [
                                          SideNavigationBarItem(
                                            icon: Icons.home,
                                            label: "Home",
                                          ),
                                          SideNavigationBarItem(
                                            icon: Icons.water_drop,
                                            label: "Resources",
                                          ),
                                          SideNavigationBarItem(
                                            icon: Icons.dashboard,
                                            label: "Dashboard",
                                          ),
                                          SideNavigationBarItem(
                                            icon: Icons.question_answer,
                                            label: "Ask a Doubt",
                                          ),
                                          SideNavigationBarItem(
                                            icon: Icons.self_improvement,
                                            label: "About",
                                          ),
                                          SideNavigationBarItem(
                                            icon: Icons.logout,
                                            label: "Logout",
                                          ),
                                        ],
                                        footer: SideNavigationBarFooter(
                                          label: InkWell(
                                            onTap: () {
                                              Get.to(() => Signin());
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: const [
                                                Text(
                                                  "Logout",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        UseString.font_family,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Icon(
                                                  Icons.logout,
                                                  color: Colors.red,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        onTap: (i) {
                                          vm.changeIndex(i);
                                        },
                                      ),
                                    )
                                  : const SizedBox()
                              : SideNavigationBar(
                                  expandable: true,
                                  initiallyExpanded: width > Constants.webWidth,
                                  toggler: width >= Constants.webWidth
                                      ? SideBarToggler(
                                          shrinkIcon: Icons.arrow_back,
                                          expandIcon: Icons.arrow_forward,
                                          onToggle: () {
                                            print('Toggle');
                                          },
                                        )
                                      : null,
                                  header: SideNavigationBarHeader(
                                    title: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          width: 145,
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                    UseString.website_name_caps,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          UseString.font_family,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    )),
                                                Container(
                                                  height: 2,
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        255, 206, 187, 15),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                  ),
                                                  width: 135,
                                                ),
                                              ]),
                                        ),
                                      ),
                                    ),
                                    subtitle: Container(
                                      width: 145,
                                      margin: const EdgeInsets.only(left: 10),
                                      child: Text(vm.user?.name ?? "name",
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontFamily: UseString.font_family,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    image: const Text(""),
                                  ),
                                  selectedIndex: vm.selectedIndex,
                                  items: const [
                                    SideNavigationBarItem(
                                      icon: Icons.home,
                                      label: "Home",
                                    ),
                                    SideNavigationBarItem(
                                      icon: Icons.water_drop,
                                      label: "Resourses",
                                    ),
                                    SideNavigationBarItem(
                                      icon: Icons.dashboard,
                                      label: "Dashboard",
                                    ),
                                    SideNavigationBarItem(
                                      icon: Icons.question_answer,
                                      label: "Ask a Doubt",
                                    ),
                                    SideNavigationBarItem(
                                      icon: Icons.self_improvement,
                                      label: "About",
                                    ),
                                  ],
                                  footer: SideNavigationBarFooter(
                                    label: InkWell(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                content: const Text(
                                                    "Are you sure you want to logged out?"),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text("No")),
                                                  TextButton(
                                                      onPressed: () {
                                                        vm.signout();
                                                      },
                                                      child: const Text("Yes")),
                                                ],
                                              );
                                            });
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: const [
                                          Text(
                                            "Logout",
                                            style: TextStyle(
                                              fontFamily: UseString.font_family,
                                              color: Colors.red,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            Icons.logout,
                                            color: Colors.red,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  onTap: (i) {
                                    vm.changeIndex(i);
                                  },
                                ),
                        ),
                        Expanded(child: vm.views[vm.selectedIndex])
                      ],
                    ),
                    width < Constants.webWidth
                        ? Positioned(
                            bottom: 0,
                            child: InkWell(
                              onTap: () {
                                vm.isSideBarVisible = !vm.isSideBarVisible;
                                vm.update();
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                child: Icon(vm.isSideBarVisible
                                    ? Icons.arrow_back
                                    : Icons.arrow_forward),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
        );
      },
    );
  }
}
