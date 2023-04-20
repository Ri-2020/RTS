import 'package:flutter/material.dart';

class ServisesTitle extends StatelessWidget {
  const ServisesTitle({
    Key? key,
    required this.title,
    required this.description,
    required this.isTopRated,
    required this.isHomeSalon,
  }) : super(key: key);

  final String title;
  final String description;
  final bool isTopRated;
  final bool isHomeSalon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, bottom: 30),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isHomeSalon
                ? Text(
                    title.toUpperCase(),
                    style: const TextStyle(fontSize: 20),
                  )
                : Text(
                    title,
                    style: const TextStyle(fontSize: 20),
                  ),
            Container(
              width: MediaQuery.of(context).size.width * 0.54,
              height: 2,
              color: const Color(0xff442E61),
            ),
            isHomeSalon
                ? const SizedBox(
                    height: 15,
                  )
                : const SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: isHomeSalon
                  ? Text(
                      description.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    )
                  : Text(
                      description.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
