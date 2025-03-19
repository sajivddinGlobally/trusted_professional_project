import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trusted_profissional_app/login/login.page.dart';
import 'package:trusted_profissional_app/signUp/registerModel/registerBodyModel.dart';
import 'package:trusted_profissional_app/signUp/registerService/registerController.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isCircular = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
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
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(builder: (context) => Login()),
                            );
                          },
                          child: Text(
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
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (passwordController.text !=
                          confirmpasswordController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Password not match")),
                        );
                        return;
                      }

                      // Show Circular Indicator
                      setState(() {
                        isCircular = true;
                      });

                      await Future.delayed(
                        Duration(seconds: 2),
                      ); // 👈 2-second delay for loading simulation

                      await ref.watch(
                        registerProvider(
                          RegisterBodyModel(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            passwordConfirmation:
                                confirmpasswordController.text,
                            phone: phoneController.text,
                          ),
                        ),
                      );
                      // Hide Circular Indicator and navigate
                      setState(() {
                        isCircular = false;
                      });

                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => Login()),
                      );
                    }
                  },
                  child:
                      isCircular
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text(
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
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "${widget.lable} field required";
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
