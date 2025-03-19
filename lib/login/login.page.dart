import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trusted_profissional_app/config/pretty.dio.dart';
import 'package:trusted_profissional_app/home/home.page.dart';
import 'package:trusted_profissional_app/login/loginModel/loginBodyModel.dart';
import 'package:trusted_profissional_app/login/serviceLogin/loginController.dart';
import 'package:trusted_profissional_app/login/serviceLogin/loginService.dart';
import 'package:trusted_profissional_app/signUp/signUpScreen.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool islogin = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 440.w,
              height: 343.h,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 202, 222, 255),
                image: DecorationImage(
                  image: AssetImage("assets/cleanimage.png"),
                ),
              ),
            ),
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Back!",
                    style: GoogleFonts.inter(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 30, 30, 30),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Create have an account? ",
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 30, 30, 30),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => SignUpScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Sign Up ",
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 0, 97, 254),
                            decoration: TextDecoration.underline,
                            decorationColor: Color.fromARGB(
                              255,
                              0,
                              97,
                              254,
                            ), // Optional: Line ka color change karne ke liye
                            decorationThickness:
                                2, // Optional: Line ki thickness
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            RegisterField(lable: "Your Email", controller: emailController),
            RegisterField(lable: "Password", controller: passwordController),
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 30, 30, 30),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "By signing in you are agree to ",
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 102, 102, 102),
                      ),
                    ),
                    Text(
                      "terms & Condition ",
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 102, 102, 102),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "and ",
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 102, 102, 102),
                      ),
                    ),
                    Text(
                      "privacy policy ",
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 102, 102, 102),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(440.w, 53.h),
                  backgroundColor: Color.fromARGB(255, 0, 97, 254),
                ),
                onPressed: () async {
                  setState(() {
                    islogin = true;
                  });
                  try {
                    final body = LoginBodyModel(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                    final service = LoginService(await getDio());
                    //  final response = await compute(service.login, body); comput use
                    final response = await service.login(
                      body,
                    ); // without comput use
                    if (response != null) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(builder: (context) => HomePage()),
                        (route) => false,
                      );
                    } else {
                      Fluttertoast.showToast(msg: "Some thing went wrong");
                    }
                  } catch (_) {
                    setState(() {
                      islogin = false;
                      Fluttertoast.showToast(
                        msg: "Login email & password is invalid",
                      );
                    });
                  }
                },
                child:
                    islogin == false
                        ? Text(
                          "Login",
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        )
                        : Padding(
                          padding: EdgeInsets.all(6),
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
              ),
            ),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}
