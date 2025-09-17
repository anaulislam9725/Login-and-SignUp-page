import 'package:flutter/material.dart';

class AppTile extends StatelessWidget {
  final IconData? icon;
  final String text;
  const AppTile({super.key,this.icon,required this.text});

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: Icon(icon, color: Colors.white, size: 26),

      title: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
    ;
  }
}