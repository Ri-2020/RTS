import 'package:flutter/material.dart';
import 'package:rts/constants/strings.dart';

class CharacterTile extends StatelessWidget {
  final String name;
  final String? post;
  final double width;

  const CharacterTile({
    super.key,
    required this.name,
    required this.width,
    this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width < 820 ? width * 0.8 : width * 0.2,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(100),
          //   child: Image.network(
          //     "https://www.alexisdental.ca/files/alexis-dental-belle-river-fillings-1.jpg",
          //     height: width < 600 ? 100 : 150,
          //     width: width < 600 ? 100 : 150,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          Text(
            name,
            style: const TextStyle(
              fontFamily: UseString.font_family,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          post != null
              ? Text(
                  post!,
                  style: const TextStyle(
                    fontFamily: UseString.font_family,
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                )
              : const SizedBox(),

          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: Image.asset(
                  "assets/images/intagram_icon.png",
                  height: 30,
                  width: 30,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {},
                child: Image.asset(
                  "assets/images/github_icon.png",
                  height: 30,
                  width: 30,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {},
                child: Image.asset(
                  "assets/images/linkedin_icon.png",
                  height: 30,
                  width: 30,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
