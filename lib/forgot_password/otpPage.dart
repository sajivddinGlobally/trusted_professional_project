import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otpify/otpify.dart';
import 'package:trusted_profissional_app/forgot_password/create_password/create_password.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
            padding: EdgeInsets.only(right: 20.w, left: 20.w),
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
          Padding(
            padding: EdgeInsets.only(top: 20.h, left: 5.w, right: 5.w),
            child: Otpify(
              fields: 6,
              width: 50.w,
              height: 50.h,
              resendSecond: 10,
              borderRadius: BorderRadius.circular(15.r),
              borderColor: Colors.grey,
              fieldColor: Colors.white,
              fieldTextColor: Colors.black,
              focusedBorderColor: Colors.black,
              resendAlignment: ResendAlignment.start,
              resendText: "Resend code",
              resendFontWeight: FontWeight.w500,
              resendColor: Colors.black,
              onChanged: (value) {},
              onResend: () {},
              onCompleted: (value) {},
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => CreatePassword()),
              );
            },
            child: Text("button"),
          ),
        ],
      ),
    );
  }
}
