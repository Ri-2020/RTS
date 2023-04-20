import 'package:flutter/material.dart';

class TopReatedCourses extends StatelessWidget {
  TopReatedCourses({
    required this.count,
    required this.img,
    required this.title,
    required this.exp,
    Key? key,
  }) : super(key: key);
  final int count;
  final String img;
  final String title;
  final String exp;
  final List<Icon> starts = [];

  @override
  Widget build(BuildContext context) {
    for (var i = 1; i <= 5; i++) {
      starts.add(
        i <= count
            ? Icon(
                Icons.star,
                color: Colors.amber[400],
                size: 15,
              )
            : const Icon(
                Icons.star_border,
                size: 15,
                color: Colors.grey,
              ),
      );
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.415,
      height: 260,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0,
            child: Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  height: 80,
                  width: MediaQuery.of(context).size.width * 0.415,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: starts),
                      const SizedBox(height: 5),
                      Text("Exp : $exp Years",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          )),
                      const SizedBox(height: 5),
                      const Text(
                        "View Pakage",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff5D398C),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width * 0.4,
            top: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                img,
                scale: 0.85,
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            width: MediaQuery.of(context).size.width * 0.28,
            height: 30,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xff7C4F95),
              ),
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
            ),
          )
        ],
      ),
    );
  }
}
