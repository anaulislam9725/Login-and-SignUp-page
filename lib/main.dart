import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_sigup_page/page/homePage.dart';
import 'package:login_sigup_page/page/loginPage.dart';
import 'package:login_sigup_page/page/signUp.dart';
import 'package:login_sigup_page/page/splase_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo',
    
      initialRoute: SplaseScreen.path,
      routes: {
        SplaseScreen.path: (context) => SplaseScreen(),
        LoginPage.path: (context) => LoginPage(),
        SignUpPage.path: (context) => SignUpPage(),

        HomePage.path: (context) => HomePage(),
      },
    );
  }
}
