import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts/constants/google_fonts.dart';
import 'package:rts/constants/strings.dart';
import 'package:rts/ui/about/characterTile.dart';
import 'package:rts/ui/home/home_vm.dart';
import 'package:rts/widgets/page_frame/page_frame.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    HomeVM vm = Get.find<HomeVM>();
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<HomeVM>(builder: (vm) {
      return PageFrame(
        pageTitle: UseString.website_name,
        pageDescription: "/about",
        children: [
          Container(
            // width: 600,
            margin: const EdgeInsets.all(30),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
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
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Text(
                    "About Us",
                    style: UseGoogleFont().openSans(
                      size: 30,
                      color: Colors.blue[900],
                      weight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "John Doe is a software developer with over 10 years of experience. He is currently a senior software engineer at Google, where he works on the development of the company's search engine. John is a highly skilled developer with a strong understanding of computer science. He is also a talented problem solver and is able to quickly come up with creative solutions to complex problems. John is a valuable asset to any team and is always willing to help others. He is also a great communicator and is able to clearly explain complex technical concepts to both technical and non-technical audiences. John is a passionate developer who is always looking for new ways to improve his skills and knowledge. He is also a strong advocate for diversity and inclusion in the tech industry. John is a role model for aspiring developers and is an inspiration to his colleagues.",
                  textAlign: TextAlign.justify,
                  style: UseGoogleFont().openSans(
                      size: 17,
                      color: Colors.blue[900],
                      weight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
            child: Text(
              "Our Team",
              style: TextStyle(
                color: Colors.blue[900],
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              children: const [
                CharacterTile(
                  name: "Rohit Gupta",
                  post: "Chief Technology Head",
                ),
                CharacterTile(
                  name: "Vikram Negi",
                  post: "Chief Executive Head",
                ),
                CharacterTile(
                  name: "Aman Tiwari",
                  post: "Chief Managing Head",
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
          Container(
            margin: const EdgeInsets.only(left: 50),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Contact Us",
                    style: TextStyle(
                      color: Colors.blue[900],
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "Email: rohitgupta111abcd@gmail.com\nPhone: +91 1234567890",
                  style: TextStyle(
                    color: Colors.blue[900],
                    fontSize: 10,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ],
            ),
          )
        ],
      );
    });
  }
}
