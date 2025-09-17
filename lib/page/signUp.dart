import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_sigup_page/controller/pageController.dart';
import 'package:login_sigup_page/page/homePage.dart';
import 'package:login_sigup_page/page/loginPage.dart';
import 'package:login_sigup_page/utils/colors.dart';
import 'package:login_sigup_page/widgets/coustomButton.dart';
import 'package:login_sigup_page/widgets/customContainar.dart';
import 'package:login_sigup_page/widgets/customField.dart';

class SignUpPage extends StatefulWidget {
  static final String path = "/SignUpPage";

  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final PassShowHide controller = Get.put(PassShowHide());
  final _formKey = GlobalKey<FormState>();
  void signUserIn() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Signin successful")));
      Navigator.pushNamed(context, HomePage.path);
      controller.emailContriller.clear();
      controller.passwordContriller.clear();
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("All fields are required")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.signUpBackground,

      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Center(
                        child: Row(
                          children: [
                            SizedBox(width: 30),
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                size: 28,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 78),
                            Text(
                              "SIGNUP",
                              style: TextStyle(
                                fontFamily: "Raleway",
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        width: 100,
                        color: AppColors.bottonSignup,
                      ),
                      SizedBox(height: 20),
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: Image.asset("assets/3.png"),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                          left: 30,
                          right: 30,
                          top: 30,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: MyTextFild(
                                controller: controller.emailContriller,
                                validator: (String? val) {
                                  if (val!.isEmpty) {
                                    return "email is required";
                                  }
                                  return null;
                                },
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: AppColors.bottonSignup,
                                ),
                                suffixicons: Icon(
                                  Icons.email,
                                  color: AppColors.bottonSignup,
                                ),
                                hintText: "email",
                                fillColor: AppColors.feelColorSignUp,
                              ),
                            ),
                            Obx(
                              () => MyTextFild(
                                obscureText: controller.isHide.value,
                                controller: controller.passwordContriller,
                                validator: (String? val) {
                                  if (val!.isEmpty) {
                                    return "password is required";
                                  } else if (val.length < 6) {
                                    return "Password should be in 6 characters";
                                  }
                                  return null;
                                },
                                suffixicons: IconButton(
                                  onPressed: () {
                                    controller.passIsHide();
                                  },
                                  icon: Icon(
                                    controller.isHide.value
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: AppColors.bottonSignup,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: AppColors.bottonSignup,
                                ),
                                hintText: "password",
                                fillColor: AppColors.feelColorSignUp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 30,
                          right: 30,
                          top: 30,
                          bottom: 30,
                        ),
                        child: CouButton(
                          onPressed: signUserIn,
                          text: "SIGNUP",
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.bottonSignup,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an Account?",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, LoginPage.path);
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 18,
                                color: AppColors.bottonSignup,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(height: 1, width: 100, color: Colors.grey),
                          Padding(
                            padding: const EdgeInsets.only(left: 4, right: 4),
                            child: Text(
                              "OR",
                              style: TextStyle(
                                color: AppColors.bottonSignup,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Container(height: 1, width: 100, color: Colors.grey),
                        ],
                      ),
                      SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialContainer(
                            image: Image.asset(
                              "assets/fb.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: SocialContainer(
                              image: Image.asset(
                                "assets/twitter.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SocialContainer(
                            image: Image.asset(
                              "assets/google.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 120,
              width: double.infinity,
              child: Image.asset(
                "assets/d2.png",

                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
