import 'package:flutter/material.dart';

class CouButton extends StatelessWidget {
  final ButtonStyle? style;
  final String text;
  final void Function()? onPressed;
  const CouButton({super.key, this.style, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            spreadRadius: 4,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),

      child: ElevatedButton(
        style: style,
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: "Raleway",
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
