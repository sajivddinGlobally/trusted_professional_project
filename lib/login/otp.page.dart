import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otpify/otpify.dart';
import 'package:trusted_profissional_app/home/home.page.dart';

import 'package:trusted_profissional_app/login/otp/otpBodyModel.dart';
import 'package:trusted_profissional_app/login/otp/otpController/otpController.dart';

class OtpPage extends ConsumerStatefulWidget {
  final String phone;
  const OtpPage({super.key, required this.phone});

  @override
  ConsumerState<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends ConsumerState<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: 30.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 25.w, left: 25.w),
                  child: Column(
                    children: [
                      Text(
                        "Verification code",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        "Please enter the OTP send to your email",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Otpify(
                    fields: 4,
                    resendSecond: 10,
                    width: 60.w,
                    height: 60.h,
                    borderRadius: BorderRadius.circular(30.r),
                    fieldColor: Colors.white,
                    fieldTextColor: Colors.black,
                    borderColor: Colors.grey,
                    focusedBorderColor: Colors.black,
                    resendAlignment: ResendAlignment.start,
                    resendText: "Resend code",
                    resendFontWeight: FontWeight.normal,
                    // resendFontSize: 20,
                    resendColor: Colors.black,
                    onChanged: (value) {},
                    onResend: () {},
                    onCompleted: (value) async {
                      try {
                        final otpBody = OtpBodyModel(
                          phone: widget.phone,
                          otp: value,
                        );
                        final response = await ref.read(
                          otpProvider(otpBody).future,
                        );
                        if (otpBody != null) {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        } else {
                          Fluttertoast.showToast(msg: "Invalid OTP");
                        }
                      } catch (e) {
                        Fluttertoast.showToast(msg: "Please enter valid OTP");
                      }
                    },
                  ),
                ),
              ],
            ),

            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
