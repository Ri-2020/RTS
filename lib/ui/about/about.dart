import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts/constants/strings.dart';
import 'package:rts/ui/about/characterTile.dart';
import 'package:rts/ui/home/home_vm.dart';
import 'package:rts/widgets/contact_us.dart';
import 'package:rts/widgets/page_frame/page_frame.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    // HomeVM vm = Get.find<HomeVM>();
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<HomeVM>(builder: (vm) {
      return PageFrame(
        width: width,
        pageTitle: UseString.website_name,
        pageDescription: "/about",
        children: [
          AboutBoxes(
            title: "About Us",
            description:
                "Welcome to Incandescent, a group of passionate students dedicated to creating engaging bootcamps, seminars, and talks for fellow students like ourselves. We believe that education extends beyond the classroom, and we aim to provide valuable learning experiences that complement our academic journey.",
            width: width,
          ),
          AboutBoxes(
            title: "Purpose",
            description:
                "Our primary purpose is to empower students by offering practical knowledge, skill development, and inspiring insights. We understand the importance of acquiring real-world skills and staying informed about current trends and opportunities. Through our initiatives, we aim to bridge the gap between academic learning and practical application, helping students thrive in their personal and professional lives.",
            width: width,
          ),
          AboutBoxes(
            title: "Our Approach",
            description:
                "At Incandescent, we prioritize student engagement, interaction, and collaboration. We believe that learning is most effective when it is enjoyable, practical, and student-driven. Our events encourage active participation, fostering an inclusive environment where everyone can contribute, ask questions, and exchange ideas. We strive to create a platform that promotes lifelong learning, personal growth, and the development of essential skills beyond traditional academic settings.",
            width: width,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.amber[50],
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                  child: Text(
                    "Our Team",
                    style: TextStyle(
                      fontFamily: UseString.font_family,
                      color: Colors.blue[900],
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Wrap(
                  children: [
                    CharacterTile(
                      width: width,
                      name: "Rohit Gupta",
                      post: "Website Developer, Flutter Mentor",
                    ),
                    CharacterTile(
                      width: width,
                      name: "Vikram Negi",
                      post: "Website Developer, Flutter Mentor",
                    ),
                    CharacterTile(
                      width: width,
                      name: "Aman Tiwari",
                      post: "Dart Mentor",
                    ),
                    CharacterTile(
                      width: width,
                      name: "Yashwant Sahu",
                      post: "Dart Mentor",
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
          const ContactUs(),
        ],
      );
    });
  }
}

class AboutBoxes extends StatelessWidget {
  final String title;
  final String description;
  final double width;
  const AboutBoxes({
    super.key,
    required this.title,
    required this.description,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: width < 820 ? 10 : 20),
          padding: EdgeInsets.all(width < 600 ? 15 : 30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: width < 820
                ? null
                : [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 2,
                      offset: const Offset(0, 0),
                    ),
                  ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: UseString.font_family,
                    fontSize: width < 600 ? 20 : 30,
                    color: Colors.blue[900],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                description,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontFamily: UseString.font_family,
                  fontSize: width < 600 ? 14 : 17,
                  color: Colors.blue[900],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        width < 820 ? const Divider() : const SizedBox(),
      ],
    );
  }
}
