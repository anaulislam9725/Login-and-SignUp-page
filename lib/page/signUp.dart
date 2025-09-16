import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_sigup_page/controller/pageController.dart';
import 'package:login_sigup_page/page/homePage.dart';
import 'package:login_sigup_page/page/loginPage.dart';

import 'package:login_sigup_page/utils/colors.dart';

class SignUpPage extends StatefulWidget {
  static final String path = "/SignUpPage";

  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // bool isHide = true;
  final emailContriller = TextEditingController();
  final passwordContriller = TextEditingController();
  int passlan = 0;

  final _formKey = GlobalKey<FormState>();
  void signUserIn() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Login successful")));
      Navigator.pushNamed(context, HomePage.path);
      emailContriller.clear();
      passwordContriller.clear();
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("All fields are required")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final PassShowHide controller = Get.put(PassShowHide());
    return Scaffold(
      backgroundColor: AppColors.signUpBackground,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20),
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
                Container(height: 1, width: 100, color: AppColors.bottonSignup),
                SizedBox(height: 30),
                Container(
                  color: Colors.white,
                  child: Image.asset("assets/3.png"),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400,
                                spreadRadius: 4,
                                blurRadius: 8,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: TextFormField(
                            validator: (String? val) {
                              if (val!.isEmpty) {
                                return "Email is required";
                              }
                            },

                            controller: emailContriller,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                top: 18,
                                bottom: 18,
                                right: 18,
                                left: 18,
                              ),
                              prefixIcon: Icon(
                                Icons.person,
                                size: 28,
                                color: AppColors.bottonColor,
                              ),
                              hintText: "Email",
                              hintStyle: TextStyle(
                                color: AppColors.bottonColor.withValues(
                                  alpha: 0.8,
                                ),
                              ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(),
                                child: Icon(
                                  Icons.email,
                                  color: AppColors.bottonColor,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              errorStyle: TextStyle(color: Colors.red),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              fillColor: AppColors.feelColorSignUp,
                              filled: true,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              spreadRadius: 4,
                              blurRadius: 8,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          validator: (String? val) {
                            if (val!.isEmpty) {
                              return "Password is required";
                            } else if (val.length < 6) {
                              return "Password should be in 6 characters";
                            }
                          },

                          controller: passwordContriller,

                          obscureText: controller.passIsHide(),
                          decoration: InputDecoration(
                            hintText: "Password",

                            contentPadding: EdgeInsets.only(
                              top: 18,
                              bottom: 18,
                              right: 18,
                              left: 18,
                            ),
                            prefixIcon: Icon(
                              Icons.lock,
                              size: 28,
                              color: AppColors.bottonColor,
                            ),

                            hintStyle: TextStyle(
                              color: AppColors.bottonColor.withValues(
                                alpha: 0.8,
                              ),
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(),
                              child: Obx(
                                () => IconButton(
                                  onPressed: () {
                                    controller.passIsHide();
                                  },
                                  icon: Icon(
                                    controller.passIsHide()
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  color: AppColors.bottonColor,
                                ),
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            errorStyle: TextStyle(color: Colors.red),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            fillColor: AppColors.feelColorSignUp,
                            filled: true,
                          ),
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
                  child: SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: Container(
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
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.bottonSignup,
                        ),
                        onPressed: signUserIn,
                        child: Text(
                          "SIGNUP",
                          style: TextStyle(
                            fontFamily: "Raleway",
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
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
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        border: BoxBorder.all(color: Colors.grey, width: 1.5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/fb.png", fit: BoxFit.cover),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 18, left: 18),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          border: BoxBorder.all(color: Colors.grey, width: 1.5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            "assets/twitter.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        border: BoxBorder.all(color: Colors.grey, width: 1.5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          "assets/google.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Image.asset("assets/d2.png", fit: BoxFit.cover),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: Image(
      //   image: AssetImage("assets/d2.png"),
      //   fit: BoxFit.cover,
      // ),
    );
  }
}
