
import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  CustomTextField({this.onChange,

    required this.hintText,
    required this.labelText,
    super.key,
  });
  final String hintText;
  final String labelText;

  Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10,left: 10,bottom: 10,top: 2),
      child: TextField(
        onChanged: onChange,

        cursorColor: Colors.blue,
        decoration: InputDecoration(
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 20),

            suffixIconColor: Colors.blue,
            hintText: hintText,
            labelText: labelText,
            // labelStyle: const TextStyle(color: Colors.blue),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                    width: 1.2, color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                const BorderSide(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(20)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
