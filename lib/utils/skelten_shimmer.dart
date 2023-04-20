import 'package:flutter/material.dart';

class Skelton extends StatelessWidget {
  Skelton({super.key, this.height, this.width});
  double? height;
  double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black12.withOpacity(0.04),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
