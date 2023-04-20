import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    Key? key,
    required this.hintText,
    required this.isNumber,
    required this.isEmail,
    required this.isZipCode,
  }) : super(key: key);

  final String hintText;
  final bool isNumber;
  final bool isEmail;
  final bool isZipCode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        maxLength: isZipCode ? 6 : (isNumber ? 10 : 50),
        keyboardType: (isNumber || isZipCode)
            ? TextInputType.number
            : (isEmail ? TextInputType.emailAddress : TextInputType.name),
        decoration: InputDecoration(
          counterText: "",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: const Color(0xff936FA8),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
