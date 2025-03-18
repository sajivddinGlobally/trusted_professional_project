import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trusted_profissional_app/service/particularService.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 64.h),
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
                      padding: EdgeInsets.only(right: 4.w),
                      child: Icon(Icons.arrow_back_ios_rounded, size: 20.sp),
                    ),
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
                  contentPadding: EdgeInsets.only(bottom: 5.h),
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: 20.w),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 0;
                    });
                  },
                  child: ContainerBody(
                    text: 'Cleaning & Maintenance',
                    textcolor:
                        currentIndex == 0
                            ? Color.fromARGB(255, 229, 239, 255)
                            : Color.fromARGB(255, 0, 97, 254),
                    color:
                        currentIndex == 0
                            ? Color.fromARGB(255, 0, 97, 254)
                            : Color.fromARGB(255, 229, 239, 255),
                    bordercolor:
                        currentIndex == 0
                            ? Color.fromARGB(255, 17, 17, 28)
                            : Colors.transparent,
                  ),
                ),
                SizedBox(width: 8.w),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 1;
                    });
                  },
                  child: ContainerBody(
                    text: 'Automobile Services',
                    textcolor:
                        currentIndex == 1
                            ? Color.fromARGB(255, 229, 239, 255)
                            : Color.fromARGB(255, 0, 97, 254),
                    color:
                        currentIndex == 1
                            ? Color.fromARGB(255, 0, 97, 254)
                            : Color.fromARGB(255, 229, 239, 255),
                    bordercolor:
                        currentIndex == 1
                            ? Color.fromARGB(255, 17, 17, 28)
                            : Colors.transparent,
                  ),
                ),
                SizedBox(width: 8.w),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 2;
                    });
                  },
                  child: ContainerBody(
                    text: 'Tech & IT Support',
                    textcolor:
                        currentIndex == 2
                            ? Color.fromARGB(255, 229, 239, 255)
                            : Color.fromARGB(255, 0, 97, 254),
                    color:
                        currentIndex == 2
                            ? Color.fromARGB(255, 0, 97, 254)
                            : Color.fromARGB(255, 229, 239, 255),
                    bordercolor:
                        currentIndex == 2
                            ? Color.fromARGB(255, 17, 17, 28)
                            : Colors.transparent,
                  ),
                ),
                SizedBox(width: 8.w),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 3;
                    });
                  },
                  child: ContainerBody(
                    text: 'Events & Entertainment',
                    textcolor:
                        currentIndex == 3
                            ? Color.fromARGB(255, 229, 239, 255)
                            : Color.fromARGB(255, 0, 97, 254),
                    color:
                        currentIndex == 3
                            ? Color.fromARGB(255, 0, 97, 254)
                            : Color.fromARGB(255, 229, 239, 255),
                    bordercolor:
                        currentIndex == 3
                            ? Color.fromARGB(255, 17, 17, 28)
                            : Colors.transparent,
                  ),
                ),
                SizedBox(width: 10.w),
              ],
            ),
          ),
          Mygridviewbuilder(),
        ],
      ),
    );
  }
}

class Mygridviewbuilder extends StatefulWidget {
  const Mygridviewbuilder({super.key});

  @override
  State<Mygridviewbuilder> createState() => _MygridviewbuilderState();
}

class _MygridviewbuilderState extends State<Mygridviewbuilder> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
        child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.h, // Spacing between columns
            mainAxisSpacing: 10.h, // Spacing between rows
            childAspectRatio: 1.3, // ✅ Adjust this to change item size
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => ParticularService()),
                );
              },
              child: Container(
                width: 196.w,
                height: 134.h,
                decoration: BoxDecoration(
                  // color: Colors.yellow,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: Color.fromARGB(255, 17, 17, 28),
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      // height: 80.h,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 5.h,
                          left: 5.w,
                          right: 5.w,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.r),
                          child: Image.asset(
                            "assets/electricianservice.png",
                            height: 80.h,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.w, top: 10.h),
                      child: Text(
                        "Rahul:Electrician Service",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: Color.fromARGB(255, 17, 17, 28),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.w, top: 5.h),
                      child: Row(
                        children: [
                          Text(
                            "Starting from ₹600",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 11.sp,
                              color: Color.fromARGB(255, 102, 102, 102),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: Text(
                              "⭐ 4.8/5",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 11.sp,
                                color: Color.fromARGB(255, 102, 102, 102),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ContainerBody extends StatefulWidget {
  final String text;
  final Color color;
  final Color textcolor;
  final Color bordercolor;
  const ContainerBody({
    super.key,
    required this.text,
    required this.color,
    required this.textcolor,
    required this.bordercolor,
  });

  @override
  State<ContainerBody> createState() => _ContainerBodyState();
}

class _ContainerBodyState extends State<ContainerBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      // width: 150.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.r),
        color: widget.color,
        border: Border.all(width: 1, color: widget.bordercolor),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w),
          child: Text(
            // "Repair & Home Services",
            widget.text,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w400,
              fontSize: 11.sp,
              color: widget.textcolor,
            ),
          ),
        ),
      ),
    );
  }
}
