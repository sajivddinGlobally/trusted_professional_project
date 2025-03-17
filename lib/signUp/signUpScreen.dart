import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trusted_profissional_app/login/login.page.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 440.w,
              height: 290.h,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 202, 222, 255),
                image: DecorationImage(
                  image: AssetImage("assets/signUpImage.png"),
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
                    "Create your account",
                    style: GoogleFonts.inter(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 30, 30, 30),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Already have an account? ",
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 30, 30, 30),
                        ),
                      ),
                      Text(
                        "Login",
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
                          decorationThickness: 2, // Optional: Line ki thickness
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            RegisterField(lable: 'Your Name', controller: nameController),
            RegisterField(lable: 'Your Phone', controller: phoneController),
            RegisterField(lable: 'Your Email', controller: emailController),
            RegisterField(lable: 'Password', controller: passwordController),
            RegisterField(
              lable: 'Confirm Password',
              controller: confirmpasswordController,
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(440.w, 53.h),
                  backgroundColor: Color.fromARGB(255, 0, 97, 254),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => Login()),
                  );
                },
                child: Text(
                  "Sign Up",
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
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

class RegisterField extends StatefulWidget {
  final String lable;
  final TextEditingController controller;
  const RegisterField({
    super.key,
    required this.lable,
    required this.controller,
  });

  @override
  State<RegisterField> createState() => _RegisterFieldState();
}

class _RegisterFieldState extends State<RegisterField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.lable,
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
            height: 55.h,
            width: MediaQuery.of(context).size.width,
            child: TextFormField(
              controller: widget.controller,
              textAlignVertical:
                  TextAlignVertical
                      .center, // 👈 Text aur cursor ko vertical center laane ke liye
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 12.h,
                  horizontal: 15.w,
                ), // 👈 Text ko center karne ke liye
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
