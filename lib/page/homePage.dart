import 'package:flutter/material.dart';
import 'package:login_sigup_page/page/loginPage.dart';
import 'package:login_sigup_page/utils/colors.dart';
import 'package:login_sigup_page/widgets/cuatomTile.dart';

class HomePage extends StatelessWidget {
  static final String path = "/HomePage";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page",
          style: TextStyle(
            fontFamily: "Raleway",
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Text("Back Boutton", style: TextStyle(fontSize: 24)),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.8,
        backgroundColor: AppColors.drawerBackgrond,
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: AppColors.heder,
              child: Padding(
                padding: const EdgeInsets.only(top: 48, left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: BoxBorder.all(color: Colors.white, width: 2),
                      ),
                      child: CircleAvatar(
                        radius: 38,
                        backgroundImage: AssetImage("assets/drawer.png.webp"),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "John Michael",
                      style: TextStyle(
                        fontFamily: "Raleway",

                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                    ),

                    Row(
                      children: [
                        Text(
                          "johnmichael4923@gmail.com",
                          style: TextStyle(
                            fontFamily: "Raleway",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withValues(alpha: 0.8),
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 28,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: 15),
                Container(
                  height: 54,
                  width: double.infinity,
                  color: Colors.grey.withValues(alpha: 0.2),
                  child: AppTile(icon: Icons.email, text: "Inbox"),
                ),
                AppTile(icon: Icons.send, text: "Outbox"),
                AppTile(icon: Icons.favorite, text: "Favorite"),
                AppTile(icon: Icons.archive, text: "Archive"),
                AppTile(icon: Icons.delete, text: "Trash"),
                AppTile(icon: Icons.info, text: "Spam"),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey.withValues(alpha: 0.2),
                ),
                AppTile(icon: Icons.person, text: "Profile"),
                AppTile(icon: Icons.settings, text: "Settings"),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, LoginPage.path);
                  },
                  child: AppTile(
                    icon: Icons.exit_to_app_rounded,
                    text: "Logout",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
