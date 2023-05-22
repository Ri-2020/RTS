import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              "https://www.alexisdental.ca/files/alexis-dental-belle-river-fillings-1.jpg",
              height: width < 600 ? 100 : 150,
              width: width < 600 ? 100 : 150,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          post != null
              ? Text(
                  post!,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
