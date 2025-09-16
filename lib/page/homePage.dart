import 'package:flutter/material.dart';
import 'package:login_sigup_page/page/loginPage.dart';
import 'package:login_sigup_page/utils/colors.dart';

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
                        backgroundImage: AssetImage("assets/fb.png"),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Rofik ahmed",
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
                          "rofikahmed4923@gmail.com",
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
                  child: _inbox(),
                ),

                _outbox(),
                _favorit(),
                _trash(),
                _archieve(),
                _logout(),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey.withValues(alpha: 0.2),
                ),
                _profile(),
                _settings(),
                _spam(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _inbox() {
    return ListTile(
      leading: Icon(Icons.email, color: Colors.white, size: 26),

      title: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          "Inbox",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }

  _outbox() {
    return ListTile(
      leading: Icon(Icons.send, color: Colors.white, size: 26),

      title: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          "OutBox",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }

  _favorit() {
    return ListTile(
      leading: Icon(Icons.favorite, color: Colors.white, size: 26),

      title: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          "Favorite",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }

  _archieve() {
    return ListTile(
      leading: Icon(Icons.archive, color: Colors.white, size: 26),

      title: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          "Archieve",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }

  _trash() {
    return ListTile(
      leading: Icon(Icons.delete, color: Colors.white, size: 26),

      title: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          "Trash",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }

  _spam(context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, LoginPage.path);
      },
      child: ListTile(
        leading: Icon(Icons.exit_to_app_rounded, color: Colors.white, size: 26),

        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            "Logout",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }

  _profile() {
    return ListTile(
      leading: Icon(Icons.person, color: Colors.white, size: 26),

      title: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }

  _settings() {
    return ListTile(
      leading: Icon(Icons.settings, color: Colors.white, size: 26),

      title: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          "Settings",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }

  _logout() {
    return ListTile(
      leading: Icon(Icons.info, color: Colors.white, size: 26),

      title: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          "Spam",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
