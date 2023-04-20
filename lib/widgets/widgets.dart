import 'package:flutter/material.dart';
import 'package:rts/constants/colors.dart';

class SearchBar extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 10),

      height: 55,
      // color: AppColors.whiteColor,
      child: Card(
        color: Colors.grey.shade200,
        elevation: 0,
        shape: RoundedRectangleBorder(
            // side: BorderSide(
            // ),
            borderRadius: BorderRadius.circular(15)),
        // color: AppColors.whiteColor,
        child: ListTile(
          dense: true,
          leading: const Icon(
            Icons.search,
            color: AppColors.blackColor,
          ),
          title: Text("Search here...", style: TextStyle(fontSize: 18)),
          // TextField(
          //   readOnly: true,
          //   controller: controller,
          //   decoration: const InputDecoration(
          //       hintStyle: TextStyle(color: Colors.black),
          //       // labelText: ,
          //       hintText: "Search here...",
          //       border: InputBorder.none),
          // ),
          trailing: const Icon(Icons.mic),
        ),
      ),
    );
  }
}
