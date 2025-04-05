import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trusted_profissional_app/home/chat.page.dart';
import 'package:trusted_profissional_app/home/homeCategoryApi/Service/CategoryController.dart';
import 'package:trusted_profissional_app/home/homeCategoryApi/Service/serviceController.dart';
import 'package:trusted_profissional_app/home/service.page.dart';
import 'package:trusted_profissional_app/profile.page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final PageController _pageController = PageController();

  final List<Map<String, String>> testimonials = [
    {
      "text":
          "Finding a plumber was incredibly easy! I was able to book within minutes, and the professional arrived right on time. Not only was the issue fixed quickly, but the entire process was seamless. The pricing was completely transparent, and there were no hidden charges. The plumber was skilled, polite, and ensured everything was perfect before leaving. This platform truly makes life easier—highly recommend it to anyone looking for reliable services!",
      "author": "– Amit, Jaipur",
    },
    {
      "text":
          "Finding a plumber was incredibly easy! I was able to book within minutes, and the professional arrived right on time. Not only was the issue fixed quickly, but the entire process was seamless. The pricing was completely transparent, and there were no hidden charges. The plumber was skilled, polite, and ensured everything was perfect before leaving. This platform truly makes life easier—highly recommend it to anyone looking for reliable services!",
      "author": "– Amit, Jaipur",
    },
    {
      "text":
          "Finding a plumber was incredibly easy! I was able to book within minutes, and the professional arrived right on time. Not only was the issue fixed quickly, but the entire process was seamless. The pricing was completely transparent, and there were no hidden charges. The plumber was skilled, polite, and ensured everything was perfect before leaving. This platform truly makes life easier—highly recommend it to anyone looking for reliable services!",
      "author": "– Amit, Jaipur",
    },
    {
      "text":
          "Finding a plumber was incredibly easy! I was able to book within minutes, and the professional arrived right on time. Not only was the issue fixed quickly, but the entire process was seamless. The pricing was completely transparent, and there were no hidden charges. The plumber was skilled, polite, and ensured everything was perfect before leaving. This platform truly makes life easier—highly recommend it to anyone looking for reliable services!",
      "author": "– Amit, Jaipur",
    },
  ];

  List<Map<String, String>> mylist = [
    {"imageUrl": "assets/electrician.png", "service": "Electrician Service"},
    {"imageUrl": "assets/clean.png", "service": "Cleaning Service"},
    {"imageUrl": "assets/repairing.png", "service": "Repairing Service"},
    {"imageUrl": "assets/yoga.png", "service": "Yoga Service"},
  ];

  int bottom = 0;
  int tabindex = 0;

  @override
  Widget build(BuildContext context) {
    final categoryData = ref.watch(categoryProvider);
    final serviceData = ref.watch(serviceController);
    var box = Hive.box('authBox');
    return Scaffold(
      // backgroundColor: Color(0xFFFFFFFF),
      body:
          bottom == 0
              ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 440.w,
                      height: 210.h,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 0, 97, 254),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 70.h),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 30.w),
                                width: 50.w,
                                height: 50.h,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 217, 217, 217),
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Image.asset("assets/skilzaar.png"),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    // "Hi, Rajesh",
                                    "Hey ${box.get('name') ?? ""}",
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                  // SizedBox(height: 12.h),
                                  Text(
                                    "Choose your location ",
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.only(right: 20.w),
                                child: Container(
                                  width: 44.w,
                                  height: 44.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(255, 25, 113, 254),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.notifications_none,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          Padding(
                            padding: EdgeInsets.only(left: 30.w, right: 30.r),
                            child: SizedBox(
                              height: 54.h,
                              width: 400.w,
                              child: TextField(
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 8.h,
                                  ),
                                  filled: true,
                                  fillColor: Color(0xFFFFFFFF),
                                  hintText: "Search Service",
                                  hintStyle: GoogleFonts.inter(
                                    color: Color.fromARGB(255, 153, 153, 153),
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.search_rounded,
                                    color: Color.fromARGB(255, 153, 153, 153),
                                    size: 20,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: BorderSide.none,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25.h),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            "Find Trusted Professionals for Every Need",
                            style: GoogleFonts.inter(
                              letterSpacing: -1,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 17, 17, 24),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            textAlign: TextAlign.center,
                            "From home repairs to business services, we connect you with verified experts.",
                            style: GoogleFonts.inter(
                              letterSpacing: -1,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 63, 63, 63),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    categoryData.when(
                      data: (category) {
                        return SizedBox(
                          height: 190.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: category.data.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(left: 20.w),
                                child: Stack(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                            builder: (context) => ServicePage(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: 121.w,
                                        height: 185.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            8.53.r,
                                          ),
                                          color: Colors.black,
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            8.53.r,
                                          ),
                                          child: Image.network(
                                            // "assets/electrician.png",
                                            // mylist[index]["imageUrl"]!,
                                            category.data[index].imageUrl,
                                            width: 121.w,
                                            height: 185.h,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 15.h,
                                      left: 8.w,
                                      child: Text(
                                        // "Electrician Service",
                                        // mylist[index]["service"]!,
                                        category.data[index].title,
                                        style: GoogleFonts.inter(
                                          fontSize: 8.53,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromARGB(
                                            255,
                                            255,
                                            255,
                                            255,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      },
                      error:
                          (error, stackTrace) =>
                              Center(child: Text(error.toString())),
                      loading: () => Center(child: CircularProgressIndicator()),
                    ),
                    // serviceData.when(
                    //   data: (data) {
                    //     return SizedBox(
                    //       height: 190.h,
                    //       child: ListView.builder(
                    //         scrollDirection: Axis.horizontal,
                    //         itemCount: data.serviceProviders.length,
                    //         itemBuilder: (context, index) {
                    //           return Padding(
                    //             padding: EdgeInsets.only(left: 20.w),
                    //             child: Stack(
                    //               children: [
                    //                 Container(
                    //                   width: 121.w,
                    //                   height: 185.h,
                    //                   decoration: BoxDecoration(
                    //                     borderRadius: BorderRadius.circular(
                    //                       8.53.r,
                    //                     ),
                    //                     color: Colors.black,
                    //                   ),
                    //                   child: ClipRRect(
                    //                     borderRadius: BorderRadius.circular(
                    //                       8.53.r,
                    //                     ),
                    //                     child: Image.network(
                    //                       // "assets/electrician.png",
                    //                       data
                    //                           .serviceProviders[index]
                    //                           .bannerImage,
                    //                       width: 121.w,
                    //                       height: 185.h,
                    //                       fit: BoxFit.cover,
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 Positioned(
                    //                   bottom: 15.h,
                    //                   left: 8.w,
                    //                   child: Text(
                    //                     // "Electrician Service",
                    //                     // mylist[index]["service"]!,
                    //                     data.serviceProviders[index].title,
                    //                     style: GoogleFonts.inter(
                    //                       fontSize: 8.53,
                    //                       fontWeight: FontWeight.w500,
                    //                       color: Color.fromARGB(
                    //                         255,
                    //                         255,
                    //                         255,
                    //                         255,
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           );
                    //         },
                    //       ),
                    //     );
                    //   },
                    //   error:
                    //       (error, stackTrace) =>
                    //           Center(child: Text(error.toString())),
                    //   loading: () => Center(child: CircularProgressIndicator()),
                    // ),
                    SizedBox(height: 20.h),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            "How It Works for Service Seekers",
                            style: GoogleFonts.inter(
                              letterSpacing: 1,
                              fontSize: 15.32.sp,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 17, 17, 28),
                            ),
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "Get the service you need in just three simple steps.",
                            style: GoogleFonts.inter(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 63, 63, 63),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 17.h),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Row(
                        children: [
                          MyContainer(
                            icon: Icon(
                              Icons.search,
                              size: 40,
                              color: Color.fromARGB(255, 0, 97, 254),
                            ),
                            title: "Search & Compare",
                            subtitle:
                                "Browse verified professionals across various categories.",
                          ),
                          // SizedBox(width: 10.w),
                          Spacer(),
                          MyContainer(
                            icon: Icon(
                              Icons.calendar_today_outlined,
                              size: 40,
                              color: Color.fromARGB(255, 0, 97, 254),
                            ),
                            title: 'Book Instantly',
                            subtitle:
                                'Check availability and secure your service with ease.',
                          ),
                          // SizedBox(width: 10.w),
                          Spacer(),
                          MyContainer(
                            icon: Icon(
                              Icons.build_outlined,
                              size: 40,
                              color: Color.fromARGB(255, 0, 97, 254),
                            ),
                            title: 'Get the Job Done',
                            subtitle:
                                'Experience top-notch service, guaranteed satisfaction.',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Container(
                        width: 440.w,
                        height: 447.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13.56.r),
                          border: Border.all(color: Color(0xFF3F3F3F)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 10.h,
                            bottom: 10.h,
                            right: 10.w,
                            left: 10.w,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(13.56.r),
                            child: Image.asset(
                              "assets/image.png",
                              width: 440.w,
                              height: 447.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Why Choose Us?",
                            style: GoogleFonts.inter(
                              fontSize: 27.12.sp,
                              color: Color.fromARGB(255, 17, 17, 28),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "Get the service you need in just three simple steps.",
                            style: GoogleFonts.inter(
                              fontSize: 14.92.sp,
                              color: Color.fromARGB(255, 63, 63, 63),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25.h),
                    SimpleSteps(
                      txt: "Verified Professionals",
                      subtxt: "Background-checked experts for peace of mind.",
                    ),
                    SizedBox(height: 10.h),
                    SimpleSteps(
                      txt: "Easy Booking",
                      subtxt: "Find & book services in just a few clicks.",
                    ),
                    SizedBox(height: 10.h),
                    SimpleSteps(
                      txt: "Transparent Pricing",
                      subtxt: "No hidden charges, upfront cost estimates.",
                    ),
                    SizedBox(height: 10.h),
                    SimpleSteps(
                      txt: "Customer Support",
                      subtxt: "We’re here to assist you at every step.",
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: Image.asset("assets/handimage.png"),
                          ),
                          Positioned.fill(
                            child: Center(
                              child: Column(
                                mainAxisSize:
                                    MainAxisSize
                                        .min, // Text को सेंटर में रखने के लिए
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Are You a Skilled Professional? ",
                                    style: GoogleFonts.inter(
                                      letterSpacing: -0.5,
                                      color: Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17.72.sp,
                                    ),
                                  ),
                                  Text(
                                    "Let Customers Find You!",
                                    style: GoogleFonts.inter(
                                      letterSpacing: -0.5,
                                      color: Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17.72.sp,
                                    ),
                                  ),
                                  SizedBox(height: 6.h),
                                  Text(
                                    "List your services, receive bookings, and grow your business hassle-free.",
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 6.72,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(120.28.w, 30.44.h),
                                      backgroundColor: Color(0xFF0061FE),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      "Become a Service Provider",
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 5.52,
                                        color: Color(0xFFFFFFFF),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "How It Works for Service Providers",
                            style: GoogleFonts.inter(
                              fontSize: 24.sp,
                              color: Color(0xFF11111C),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "List your services and grow your business in three easy steps.",
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              color: Color(0xFF3F3F3F),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25.h),
                    Center(
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              CustomCard(
                                title: "Join for Free",
                                subtitle:
                                    "Sign up and list your services in minutes.",
                              ),
                              SizedBox(height: 10.h),
                              CustomCard(
                                title: 'Get More Clients',
                                subtitle:
                                    'Connect with customers actively looking for services.',
                              ),
                              SizedBox(height: 10.h),
                              CustomCard(
                                title: 'Grow Your Business',
                                subtitle:
                                    'Build trust, receive bookings, and earn more.',
                              ),
                            ],
                          ),
                          Positioned(
                            left: 50.w,
                            top: 30.h,
                            child: Container(
                              width: 1.w,
                              height: 150.h,
                              decoration: BoxDecoration(
                                color: Color(0xFF000000),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Center(
                        child: Container(
                          width: 385.62.w,
                          height: 431.37.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13.7.r),
                            border: Border.all(color: Color(0xFF3F3F3F)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 10.h,
                              bottom: 10.h,
                              left: 10.w,
                              right: 10.w,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(13.7.r),
                              child: Image.asset(
                                "assets/images.png",
                                width: 385.w,
                                height: 431.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            "What Our Client Think About Us",
                            style: GoogleFonts.inter(
                              fontSize: 17.57.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF11111C),
                            ),
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "Get the service you need in just three simple steps.",
                            style: GoogleFonts.inter(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF3F3F3F),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 22.h),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 300.h,
                          // width: 276.w,
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: testimonials.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  left: 20.w,
                                  right: 20.w,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.79.r),
                                    border: Border.all(
                                      color: Color(0xFF11111C),
                                      width: 0.44.w,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 10.w,
                                          top: 10.h,
                                          right: 10.r,
                                        ),
                                        child: Text(
                                          // overflow: TextOverflow.ellipsis,
                                          testimonials[index]["text"]!,
                                          style: GoogleFonts.inter(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0XFF3F3F3F),
                                          ),
                                        ),
                                      ),
                                      // SizedBox(height: 10.h),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 10.w,
                                          bottom: 6.h,
                                          top: 10.h,
                                        ),
                                        child: Text(
                                          testimonials[index]["author"]!,
                                          style: GoogleFonts.inter(
                                            fontSize: 10.15.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF0061FE),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 15.h),
                        SmoothPageIndicator(
                          controller: _pageController,
                          count: testimonials.length,
                          effect: ExpandingDotsEffect(
                            activeDotColor: Color(0xFF0061FE),
                            dotColor: Colors.grey,
                            dotHeight: 6.51.h,
                            dotWidth: 6.51.w,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.only(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20.w, right: 20.w),
                            child: Text(
                              textAlign: TextAlign.center,
                              "Ready to Experience Hassle-Free Services?",
                              style: GoogleFonts.inter(
                                letterSpacing: -1,
                                fontSize: 29.9.sp,
                                color: Color(0xFF1E1E1E),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20.w, right: 20.w),
                            child: Text(
                              textAlign: TextAlign.center,
                              "Find top-rated professionals instantly, Book services with just a tap.  Join thousands of happy users.",
                              style: GoogleFonts.inter(
                                // letterSpacing: -0.5,
                                fontSize: 11.34.sp,
                                color: Color(0xFF1E1E1E),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(140.w, 29.h),
                          backgroundColor: Color(0xFF0061FE),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Start Now!",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 9.28.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Logo and Social Icons
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/skilzaar.png",
                              width: 181.w,
                              height: 56.h,
                            ),
                            SizedBox(height: 50.h),
                            Row(
                              children: [
                                SocialIcon(FontAwesomeIcons.whatsapp),
                                SocialIcon(FontAwesomeIcons.instagram),
                                SocialIcon(FontAwesomeIcons.facebook),
                              ],
                            ),
                          ],
                        ),
                        // Quick Links
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 20.w),
                              child: Text(
                                "Quick Links ",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 22.sp,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            QuickLink("Home"),
                            QuickLink("Service"),
                            QuickLink("Testimonials"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Service ",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 22.sp,
                                  color: Color(0xFF000000),
                                ),
                              ),
                              Spacer(),
                              Text(
                                "Contact Info ",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 22.sp,
                                  color: Color(0xFF000000),
                                ),
                              ),
                              SizedBox(width: 70.w),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h),
                        MyService(
                          service: "Repair & Home Services ",
                          contact: "+91-78984545121",
                        ),
                        SizedBox(height: 10.h),
                        MyService(
                          service: 'Clearing Maintenance ',
                          contact: 'info@gmail.com',
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 200.w,
                                child: Text(
                                  "Automobile Services",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.sp,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ),
                              Container(
                                width: 200.w,
                                child: Text(
                                  "21 Jump Street,California,USA,405020",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.sp,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                            ],
                          ),
                        ),
                        MyService(service: 'IT & Tech Support ', contact: ''),
                        SizedBox(height: 6.h),
                        MyService(service: 'Beauty & Wellness', contact: ''),
                      ],
                    ),
                    SizedBox(height: 50.h),
                  ],
                ),
              )
              : bottom == 1
              ? ServicePage()
              : bottom == 2
              ? ChatPage()
              : ProfilePage(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey)),
        ),
        child: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              bottom = value;
            });
          },
          currentIndex: bottom,
          type: BottomNavigationBarType.fixed,
          // showSelectedLabels: false,
          // showUnselectedLabels: false,
          selectedItemColor: Color(0xFF0061FE),
          unselectedItemColor: Color(0xFF666666),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.layers_outlined),
              label: 'Service',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              label: 'Chat',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

class MyService extends StatefulWidget {
  final String service;
  final String contact;
  const MyService({super.key, required this.service, required this.contact});

  @override
  State<MyService> createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 200.w,
            child: Text(
              // "Repair & Home Services ",
              widget.service,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 18.sp,
                color: Color(0xFF000000),
              ),
            ),
          ),
          Container(
            width: 200.w,
            child: Text(
              // "+91-78984545121",
              widget.contact,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 18.sp,
                color: Color(0xFF000000),
              ),
            ),
          ),
          SizedBox(width: 10.w),
        ],
      ),
    );
  }
}

// Widget for Social Icons
Widget SocialIcon(IconData icon) {
  return Padding(
    padding: EdgeInsets.only(left: 20.w),
    child: Container(
      width: 44.w,
      height: 44.h,
      decoration: BoxDecoration(
        color: Color(0xFFE6F0FF),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Color(0xFF0061FE), size: 24.sp),
    ),
  );
}

// Widget for Quick Links
Widget QuickLink(String text) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 4),
    child: Text(
      text,
      style: GoogleFonts.inter(
        fontWeight: FontWeight.w400,
        fontSize: 18.sp,
        color: Color(0xFF000000),
      ),
    ),
  );
}

class CustomCard extends StatefulWidget {
  final String title;
  final String subtitle;
  const CustomCard({super.key, required this.title, required this.subtitle});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Container(
        width: 400.94.w,
        height: 66.01.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.7.r),
          color: Colors.white,
          border: Border.all(color: Color(0xFF11111C)),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.radio_button_checked_outlined,
                size: 25.sp,
                color: Color(0xFF11111C),
              ),
            ),
            // SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  // "Join for Free",
                  widget.title,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.69.sp,
                    color: Color(0xFF11111C),
                  ),
                ),
                Text(
                  // "Sign up and list your services in minutes.",
                  widget.subtitle,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 10.46.sp,
                    color: Color(0xFF3F3F3F),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SimpleSteps extends StatefulWidget {
  final String txt;
  final String subtxt;
  const SimpleSteps({super.key, required this.txt, required this.subtxt});

  @override
  State<SimpleSteps> createState() => _SimpleStepsState();
}

class _SimpleStepsState extends State<SimpleSteps> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Container(
        width: 400.w,
        height: 68.81.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.56.r),
          color: Colors.white,
          border: Border.all(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Text(
                widget.txt,
                style: GoogleFonts.inter(
                  fontSize: 16.27,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 17, 17, 28),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Text(
                widget.subtxt,
                style: GoogleFonts.inter(
                  fontSize: 10.85,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 63, 63, 63),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyContainer extends StatefulWidget {
  final Icon icon;
  final String title;
  final String subtitle;

  const MyContainer({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  State<MyContainer> createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 128.89.h,
      // height: 129.23.h,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(6.66.r),
        border: Border.all(width: 0.33, color: Color.fromARGB(255, 63, 63, 63)),
        image: DecorationImage(image: AssetImage("assets/line.png")),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20.h),
          Center(child: widget.icon),
          Padding(
            padding: EdgeInsets.only(left: 8.w, top: 8.h, bottom: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  // "Search & Compare",
                  widget.title,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 17, 17, 28),
                  ),
                ),
                Text(
                  // "Browse verified professionals across various categories.",
                  widget.subtitle,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 63, 63, 63),
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
