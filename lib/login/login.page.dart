import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:trusted_profissional_app/config/pretty.dio.dart';
import 'package:trusted_profissional_app/forgot_password/forgot_password.dart';
import 'package:trusted_profissional_app/home/home.page.dart';
import 'package:trusted_profissional_app/login/loginModel/loginBodyModel.dart';

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
  bool secure = true;
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
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Password",
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 30, 30, 30),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    // height: 55.h,
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      obscureText: secure == true ? secure : false,
                      controller: passwordController,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              secure = !secure;
                            });
                          },
                          child:
                              secure == true
                                  ? Icon(
                                    Icons.visibility_off,
                                    color: Color.fromARGB(150, 30, 30, 30),
                                  )
                                  : Icon(
                                    Icons.visibility,
                                    color: Color.fromARGB(150, 30, 30, 30),
                                  ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 12.h,
                          horizontal: 15.w,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 17, 17, 25),
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 17, 17, 25),
                            width: 1,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 17, 17, 25),
                            width: 1,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 17, 17, 25),
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => ForgotPassword(),
                      ),
                    );
                  },
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
                      // *Hive me user credentials save karein**
                      var box = Hive.box('authBox');
                      box.put('email', response.data.email);
                      box.put('token', response.data.token);

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
