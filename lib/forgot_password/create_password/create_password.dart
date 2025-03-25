import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({super.key});

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
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
          SizedBox(height: 40.h),
          Padding(
            padding: EdgeInsets.only(right: 20.w, left: 20.w),
            child: Text(
              "Create New Password",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 5.w),
                  child: Text(
                    "Password",
                    style: GoogleFonts.roboto(
                      fontSize: 15.w,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF4D4D4D),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(
                      fontSize: 15.w,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF4D4D4D),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 17, 17, 28),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 17, 17, 28),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  margin: EdgeInsets.only(left: 5.w),
                  child: Text(
                    "Confirm Password",
                    style: GoogleFonts.roboto(
                      fontSize: 15.w,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF4D4D4D),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Confirm password",
                    hintStyle: TextStyle(
                      fontSize: 15.w,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF4D4D4D),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 17, 17, 28),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 17, 17, 28),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 30.h),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width, 53.h),
                backgroundColor: Color.fromARGB(255, 0, 97, 254),
              ),
              onPressed: () {},
              child: Text(
                "Updata Password",
                style: GoogleFonts.inter(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
