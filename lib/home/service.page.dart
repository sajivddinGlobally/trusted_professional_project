import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFFFFF),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 64.h),
          Row(
            children: [
              SizedBox(width: 20.w),
              Container(
                width: 44.w,
                height: 44.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 232, 232, 232),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(right: 4.w),
                    child: Icon(Icons.arrow_back_ios_rounded, size: 20.sp),
                  ),
                ),
              ),
              Spacer(),
              Text(
                "Service Listing",
                style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF11111C),
                ),
              ),
              Spacer(),
              Container(
                width: 44.w,
                height: 44.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 232, 232, 232),
                ),
                child: Center(
                  child: Icon(
                    Icons.tune,
                    size: 20.sp,
                    color: Color(0xFF1E1E1E),
                  ),
                ),
              ),
              SizedBox(width: 20.w),
            ],
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Container(
              height: 50.h,
              child: TextFormField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 0.w,
                  ),
                  hintText: "Search",
                  hintStyle: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.sp,
                    color: Color.fromARGB(255, 128, 128, 128),
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 128, 128, 128),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(
                      color: Color.fromARGB(25, 0, 0, 0),
                      width: 1.w,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(
                      color: Color.fromARGB(25, 0, 0, 0),
                      width: 1.w,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          SizedBox(
            height: 30.h,
            width: 440.w - 20.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 0;
                    });
                  },
                  child: ContainerBody(
                    text: 'Repair & Home Services',
                    color:
                        currentIndex == 0
                            ? Color.fromARGB(255, 0, 97, 254)
                            : Color.fromARGB(255, 229, 239, 255),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 1;
                    });
                  },
                  child: ContainerBody(
                    text: 'Cleaning & Maintenance',
                    color:
                        currentIndex == 1
                            ? Color.fromARGB(255, 0, 97, 254)
                            : Color.fromARGB(255, 229, 239, 255),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 2;
                    });
                  },
                  child: ContainerBody(
                    text: 'Automobile Services',
                    color: Color.fromARGB(255, 0, 97, 254),
                  ),
                ),
                ContainerBody(
                  text: 'Tech & IT Support',
                  color:
                      currentIndex == 2
                          ? Color.fromARGB(255, 0, 97, 254)
                          : Color.fromARGB(255, 229, 239, 255),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 3;
                    });
                  },
                  child: ContainerBody(
                    text: 'Events & Entertainment',
                    color:
                        currentIndex == 3
                            ? Color.fromARGB(255, 0, 97, 254)
                            : Color.fromARGB(255, 229, 239, 255),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContainerBody extends StatefulWidget {
  final String text;
  final Color color;
  const ContainerBody({super.key, required this.text, required this.color});

  @override
  State<ContainerBody> createState() => _ContainerBodyState();
}

class _ContainerBodyState extends State<ContainerBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: Container(
        height: 30.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.r),
          color: widget.color,
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w),
          child: Center(
            child: Text(
              // "Repair & Home Services",
              widget.text,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 11.sp,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
