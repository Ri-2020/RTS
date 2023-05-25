import 'package:flutter/material.dart';
import 'package:rts/constants/strings.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                fontFamily: UseString.font_family,
                color: Colors.blue[900],
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            "Email: incandescent.rec@gmail.com",
            style: TextStyle(
              fontFamily: UseString.font_family,
              color: Colors.blue[900],
              fontSize: 13,
              fontWeight: FontWeight.w100,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
