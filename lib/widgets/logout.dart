import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rts/ui/home/home_vm.dart';
import 'package:rts/widgets/page_frame/page_frame.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    HomeVM homeVM = Get.find<HomeVM>();
    double width = MediaQuery.of(context).size.width;

    return PageFrame(
      pageTitle: "Logout",
      width: width,
      children: [
        InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: const Text("Are you sure you want to logged out?"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("No")),
                      TextButton(
                          onPressed: () {
                            homeVM.signout();
                          },
                          child: const Text("Yes")),
                    ],
                  );
                });
          },
          child: Container(
            margin: const EdgeInsets.all(30),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.red[50],
            ),
            child: Center(
                child: Text(
              "Logout Now",
              style: GoogleFonts.openSans(
                color: Colors.red,
              ),
            )),
          ),
        )
      ],
    );
  }
}
