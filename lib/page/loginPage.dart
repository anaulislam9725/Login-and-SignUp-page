import 'package:flutter/material.dart';
import 'package:login_sigup_page/page/homePage.dart';

import 'package:login_sigup_page/page/signUp.dart';
import 'package:login_sigup_page/utils/colors.dart';

class LoginPage extends StatefulWidget {
  static final String path = "/LoginPage";

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isHide = true;
  final emailContriller = TextEditingController();
  final passwordContriller = TextEditingController();
  int passlan = 0;
  final _formKey = GlobalKey<FormState>();
  void signUserIn() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Login successful")));
      Navigator.pushNamed(context, SignUpPage.path);
      emailContriller.clear();
      passwordContriller.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "All fields are required",
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.signUpBackground,
      body: SafeArea(
        maintainBottomViewPadding: true,
        minimum: EdgeInsets.zero,
        bottom: false,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Center(
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(height: 1, width: 100, color: AppColors.bottonColor),

                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    color: Colors.white,
                    child: Image.asset("assets/undraw.png"),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 35, right: 35, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
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
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              errorStyle: TextStyle(color: Colors.red),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              fillColor: AppColors.feelColorLogin,
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
                              return "password is required";
                            } else if (val.length < 6) {
                              return "Password should be in 6 characters";
                            }
                          },
                          obscureText: isHide,
                          controller: passwordContriller,
                          decoration: InputDecoration(
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
                            hintText: "Password",
                            hintStyle: TextStyle(
                              color: AppColors.bottonColor.withValues(
                                alpha: 0.8,
                              ),
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(),
                              child: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  isHide
                                      ? Icons.visibility_off
                                      // ignore: dead_code
                                      : Icons.visibility,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    isHide = !isHide;
                                  });
                                },
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            errorStyle: TextStyle(color: Colors.red),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            fillColor: AppColors.feelColorLogin,
                            filled: true,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Colors.grey.withValues(alpha: 9),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 35,
                    right: 35,
                    top: 10,
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
                          backgroundColor: AppColors.bottonColor,
                        ),
                        onPressed: signUserIn,
                        child: Text(
                          "LOGIN",
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
                      "Don't have an Account?",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "SignUp?",
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.bottonColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 8),
                SizedBox(
                  height: 120,
                  width: double.infinity,
                  // child: Image.asset("assets/photo.jpg"),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Image(image: AssetImage("assets/photo.jpg")),
    );
  }
}
