import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts/ui/home/home_vm.dart';
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
                  title: Container(
                    padding: const EdgeInsets.only(top: 20.0, right: 30),
                    child: const Text(
                      "RTS",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  subtitle: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(""),
                  ),
                  image: const Text(""),
                  //  ClipRRect(
                  //   borderRadius: BorderRadius.circular(50),
                  //   child: Image.network(
                  //     "https://th.bing.com/th/id/OIP.jryuUgIHWL-1FVD2ww8oWgHaHa?pid=ImgDet&rs=1",
                  //     fit: BoxFit.cover,
                  //     width: 50,
                  //     height: 50,
                  //   ),
                  // ),
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
                      Row(
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
