import 'package:flutter/material.dart';

class SocialContainer extends StatelessWidget {
  final Image image;
  const SocialContainer({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        border: BoxBorder.all(color: Colors.grey, width: 1.5),
      ),
      child: Padding(padding: const EdgeInsets.all(10.0), child: image),
    );
  }
}
