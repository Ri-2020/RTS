import 'package:flutter/material.dart';

class MediaQueryStyle extends StatelessWidget {
  final List<Widget> children;
  final bool isColumn;
  const MediaQueryStyle({
    super.key,
    required this.children,
    required this.isColumn,
  });

  @override
  Widget build(BuildContext context) {
    return isColumn
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: children,
          );
  }
}
