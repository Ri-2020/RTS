import 'package:flutter/material.dart';
import 'package:rts/constants/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ResourceBox extends StatelessWidget {
  const ResourceBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 2,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Learn Dart",
            style: UseGoogleFont().openSans(
              color: Colors.black,
              size: 20,
              weight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Click on Go to Docs button to find the Dart related Resources",
            style: UseGoogleFont().openSans(
              color: Colors.grey,
              size: 15,
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () async {
              // print("Working");
              if (await canLaunchUrl(Uri.parse("http://dart.dev"))) {
                await launchUrl(Uri.parse("http://dart.dev"));
              }
              // launchUrl(Uri.parse("http://dart.dev"));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 7,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "Go to Docs",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
