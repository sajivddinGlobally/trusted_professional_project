import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:trusted_profissional_app/add_service/add_service_page.dart';
import 'package:trusted_profissional_app/login/login.page.dart';
import 'package:trusted_profissional_app/signUp/signUpScreen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var box = Hive.box("authBox");
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            Row(
              children: [
                SizedBox(width: 20.w),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 44.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 232, 232, 232),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 20.sp,
                          color: Color.fromARGB(255, 30, 30, 30),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 100.w),
                Text(
                  "Your profile",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 17, 17, 28),
                    fontSize: 20.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.h),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    // "assets/profile.png"
                    box.get('imageFile') ?? "assets/profile.png",
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.h),
                    child: Text(
                      // "Robert Johnson",
                      "${box.get('name') ?? "Hello Guest"}",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                        color: Color.fromARGB(255, 38, 38, 38),
                      ),
                    ),
                  ),
                  Text(
                    // "jonsonrobert2323@gmail.com",
                    "${box.get("email") ?? "example@gmail.com"}",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 15.sp,
                      color: Color.fromARGB(255, 128, 128, 128),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 42.h),
            Center(
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Container(
                    //   width: 400.w,
                    //   height: 52.h,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10.r),
                    //     color: Color.fromARGB(255, 255, 255, 255),
                    //     border: Border.all(
                    //       width: 1,
                    //       color: Color.fromARGB(255, 17, 17, 28),
                    //     ),
                    //   ),
                    //   child: Padding(
                    //     padding: EdgeInsets.only(left: 10.w),
                    //     child: Row(
                    //       children: [
                    //         Icon(
                    //           Icons.person_2_outlined,
                    //           color: Color.fromARGB(255, 38, 38, 38),
                    //         ),
                    //         SizedBox(width: 10.w),
                    //         Text(
                    //           "Profile Settings",
                    //           style: GoogleFonts.inter(
                    //             fontSize: 16.sp,
                    //             fontWeight: FontWeight.w500,
                    //             color: Color.fromARGB(255, 38, 38, 38),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // )
                    if (box.get('token') != null) ...[
                      SizedBox(height: 10.h),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            var box = Hive.box('authBox');
                            box.clear();
                            Fluttertoast.showToast(msg: "Logout successful");
                            Navigator.pushAndRemoveUntil(
                              context,
                              CupertinoPageRoute(builder: (context) => Login()),
                              (route) => false,
                            );
                          });
                        },
                        child: Container(
                          width: 400.w,
                          height: 52.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Color.fromARGB(255, 255, 255, 255),
                            border: Border.all(
                              width: 1,
                              color: Color.fromARGB(255, 238, 29, 82),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.logout,
                                  color: Color.fromARGB(255, 238, 29, 82),
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  "Logout",
                                  style: GoogleFonts.inter(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 238, 29, 82),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                    ] else ...[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context) => Login()),
                          );
                        },
                        child: Container(
                          width: 400.w,
                          height: 52.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Color.fromARGB(255, 255, 255, 255),
                            border: Border.all(
                              width: 1,
                              color: Color.fromARGB(255, 17, 17, 28),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.login,
                                  color: Color.fromARGB(255, 38, 38, 38),
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  "Login",
                                  style: GoogleFonts.inter(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 38, 38, 38),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                    //// add condition for add serviec
                    SizedBox(height: 10.h),
                    if (box.get('user_type') == "provider") ...[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => AddServicePage(),
                            ),
                          );
                        },
                        child: Container(
                          width: 400.w,
                          height: 52.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Color.fromARGB(255, 255, 255, 255),
                            border: Border.all(
                              width: 1,
                              color: Color.fromARGB(255, 17, 17, 28),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.design_services_rounded,
                                  color: Color.fromARGB(255, 38, 38, 38),
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  "Add Service",
                                  style: GoogleFonts.inter(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 38, 38, 38),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
