import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:rts/constants/colors.dart';

class PageFrameHeaderButton extends StatelessWidget {
  final Function onTap;
  final String label;
  const PageFrameHeaderButton({
    super.key,
    required this.onTap,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            // GoogleFonts.openSans(
            fontSize: 12,
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w100,
          ),
        ),
      ),
    );
  }
}
