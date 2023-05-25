import 'package:flutter/material.dart';
import 'package:rts/constants/strings.dart';
import 'package:url_launcher/url_launcher.dart';

class ResourceBox extends StatelessWidget {
  final String title;
  final String description;
  final String? url;
  const ResourceBox({
    super.key,
    required this.title,
    required this.description,
    this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
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
            title,
            style: TextStyle(
              // GoogleFonts.openSans(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(
              //  GoogleFonts.openSans(
              color: Colors.grey,
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 20),
          url != null
              ? InkWell(
                  onTap: () async {
                    final uriParsed = Uri.parse(url!);
                    if (await canLaunchUrl(uriParsed)) {
                      await launchUrl(uriParsed);
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
                      "Go to Resource",
                      style: TextStyle(
                        fontFamily: UseString.font_family,
                        color: Colors.blue,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
