
import 'package:flutter/material.dart';



class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({ this.onPressed,required this.text,super.key});

  final String text;
  VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(

          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 8,
            ),
          child:  Text(
            text,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          )),
    );
  }
}
