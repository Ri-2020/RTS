import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts/constants/strings.dart';
import 'package:rts/ui/resourses/resource_box.dart';
import 'package:rts/ui/resourses/resourcesvm.dart';
import 'package:rts/widgets/contact_us.dart';
import 'package:rts/widgets/page_frame/page_frame.dart';

class Resourses extends StatelessWidget {
  const Resourses({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<ResourcesVM>(builder: (vm) {
      return SelectionArea(
        child: vm.resourceLoading
            ? const Center(child: CircularProgressIndicator())
            : PageFrame(
                width: width,
                pageTitle: UseString.Resources,
                pageDescription: "/${UseString.resources}",
                children: [
                  Container(
                    width: double.infinity,
                    child: vm.resources.isNotEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: vm.resources
                                .map((e) => ResourceBox(
                                      title: e.title,
                                      description: e.description,
                                      url: e.link,
                                    ))
                                .toList(),
                          )
                        : Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(30),
                                width: double.infinity,
                                margin:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 0,
                                      blurRadius: 2,
                                      offset: const Offset(
                                          0, 0), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const Text(
                                  UseString.no_resources_available,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: UseString.font_family,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                  const Divider(),
                  const ContactUs(),
                ],
              ),
      );
    });
  }
}
