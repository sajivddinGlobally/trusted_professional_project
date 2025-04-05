import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otpify/otpify.dart';

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
              Otpify(
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
                onCompleted: (value) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
