import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts/ui/home/home_vm.dart';
import 'package:rts/ui/register/signin.dart';
import 'package:side_navigation/side_navigation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<HomeVM>(
      builder: (vm) {
        return Scaffold(
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SideNavigationBar(
                expandable: width > 600,
                initiallyExpanded: width > 600,
                toggler: width >= 600
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
                        width: 115,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text("RTS",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                    )),
                              ),
                              const SizedBox(height: 5),
                              // const Divider(
                              //   thickness: 1,
                              // ),
                              Container(
                                height: 2,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 206, 187, 15),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                width: 75,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(vm.user?.name ?? "name",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  subtitle: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(""),
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
                    icon: Icons.self_improvement,
                    label: "About",
                  ),
                ],
                footer: SideNavigationBarFooter(
                  label: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // const Text("Raah-Towards-Success"),
                      InkWell(
                        onTap: () {
                          Get.to(() => Signin());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              "Logout",
                              style: TextStyle(
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
                    ],
                  ),
                ),
                onTap: (i) {
                  vm.changeIndex(i);
                },
              ),
              Expanded(child: vm.views[vm.selectedIndex])
            ],
          ),
        );
      },
    );
  }
}
