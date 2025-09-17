import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_sigup_page/controller/pageController.dart';
import 'package:login_sigup_page/page/signUp.dart';
import 'package:login_sigup_page/utils/colors.dart';
import 'package:login_sigup_page/widgets/coustomButton.dart';
import 'package:login_sigup_page/widgets/customField.dart';

class LoginPage extends StatefulWidget {
  static final String path = "/LoginPage";

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    final PassShowHide visibol = Get.put(PassShowHide());
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
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                            fontFamily: "Raleway",
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        width: 100,
                        color: AppColors.bottonColor,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          color: Colors.white,
                          child: Image.asset(
                            "assets/undraw.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                          left: 35,
                          right: 35,
                          top: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: MyTextFild(
                                controller: emailContriller,
                                validator: (String? val) {
                                  if (val!.isEmpty) {
                                    return "email is required";
                                  }
                                  return null;
                                },
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: AppColors.bottonColor,
                                ),
                                suffixicons: Icon(
                                  Icons.email,
                                  color: AppColors.bottonColor,
                                ),
                                hintText: "email",
                                fillColor: AppColors.feelColorLogin,
                              ),
                            ),
                            Obx(
                              () => MyTextFild(
                                obscureText: visibol.isHide.value,
                                controller: passwordContriller,
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
                                    visibol.passIsHide();
                                  },
                                  icon: Icon(
                                    visibol.isHide.value
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Theme.of(context).primaryColorDark,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: AppColors.bottonColor,
                                ),
                                hintText: "password",
                                fillColor: AppColors.feelColorLogin,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: TextButton(
                                onPressed: () {},
                                child: Text("Forget Password"),
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
                        child: CouButton(
                          onPressed: signUserIn,
                          text: "LOGIN",
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.bottonColor,
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
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, SignUpPage.path);
                            },
                            child: Text(
                              "SignUp?",
                              style: TextStyle(
                                fontSize: 18,
                                color: AppColors.bottonColor,
                                fontWeight: FontWeight.w600,
                              ),
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
            Image.asset(
              "assets/photo.jpg",
              height: 110,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
