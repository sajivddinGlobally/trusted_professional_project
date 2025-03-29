import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trusted_profissional_app/particularService/serviceParticular/particularProviderController.dart';

class ParticularService extends ConsumerStatefulWidget {
  final String id;
  const ParticularService({super.key, required this.id});

  @override
  ConsumerState<ParticularService> createState() => _ParticularServiceState();
}

class _ParticularServiceState extends ConsumerState<ParticularService> {
  @override
  Widget build(BuildContext context) {
    final particularserviceData = ref.watch(
      particularServiceProvider('${widget.id}'),
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: particularserviceData.when(
          data: (data) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: 10.h),
                Stack(
                  children: [
                    Image.network(
                      // "assets/serviceman.png",
                      data.service.bannerImage,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Positioned(
                      left: 20.w,
                      top: 60.h,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 44.w,
                          height: 44.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF52779c),
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 20.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Row(
                    children: [
                      // Icon(Icons.star, color: Colors.yellow),
                      Text(
                        "⭐ 4.8/5 (150 Reviews) | 500+ Bookings | Verified Experts",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: Color.fromARGB(255, 0, 97, 254),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Text(
                        // "Reliable & Affordable Electrician in Mumbai",
                        data.service.title,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                          color: Color.fromARGB(255, 17, 17, 28),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Padding(
                      padding: EdgeInsets.only(right: 20.w, left: 20.w),
                      child: Text(
                        // "Looking for a trusted plumber in Mumbai? Whether it's a leaky tap, clogged drain, or pipe installation, our skilled professionals provide on-time, affordable, and hassle-free solutions.",
                        data.service.description,
                        style: GoogleFonts.inter(
                          letterSpacing: -0.20,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: Color.fromARGB(255, 77, 77, 77),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: Container(
                    height: 1.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      // border: Border.all(color: Colors.grey.shade300, width: 0.70),
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Service Location
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Service Location",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 115, 115, 115),
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              // "Mumbai, Navi Mumbai, Thane",
                              data.service.serviceLocation,
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 17, 17, 28),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 40,
                        color: Colors.grey.shade300,
                      ),
                      SizedBox(width: 10.w),
                      // Availability
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Availability",
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 115, 115, 115),
                              ),
                            ),
                            SizedBox(height: 5.w),
                            Text(
                              data.service.availabilityTime,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 17, 17, 28),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 40,
                        color: Colors.grey.shade300,
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Starting from ${data.service.startingPrice}",
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 115, 115, 115),
                              ),
                            ),
                            // SizedBox(height: 4),
                            // Text(
                            //   "₹299",
                            //   // particularservice.data[index].price,
                            //   style: TextStyle(
                            //     fontSize: 12.sp,
                            //     fontWeight: FontWeight.w500,
                            //     color: Color.fromARGB(255, 17, 17, 28),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(width: 5.w),
                      // Pay Now Button
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(95.w, 26.h),
                          backgroundColor: Color.fromARGB(255, 0, 97, 254),
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 8.h,
                          ),
                        ),
                        child: Text(
                          "Pay Now",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 18.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: Container(
                    height: 1.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      // border: Border.all(color: Colors.grey.shade300, width: 0.70),
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "What’s Included?",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                          color: Color.fromARGB(255, 17, 17, 28),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        "🛠 Basic Plumbing Service (₹299)",
                        style: GoogleFonts.inter(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 46, 47, 77),
                        ),
                      ),
                      Text(
                        // "✔️ Leak repair (faucet/pipe)",
                        "✔️ ${data.service.whatsIncludedDescription}",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 77, 77, 77),
                        ),
                      ),
                      Text(
                        "✔️ Drain unclogging",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 77, 77, 77),
                        ),
                      ),
                      Text(
                        "✔️ Minor tap fixes",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 77, 77, 77),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        "🔧 Full Plumbing Package (₹699)",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                          color: Color.fromARGB(255, 17, 17, 28),
                        ),
                      ),
                      Text(
                        // "✔️ All basic services",
                        "✔️ ${data.service.fullPackageDescription}",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 77, 77, 77),
                        ),
                      ),
                      Text(
                        "✔️ Pipe & sink installation",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 77, 77, 77),
                        ),
                      ),
                      Text(
                        "✔️ Bathroom/kitchen fixture repairs",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 77, 77, 77),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Padding(
                        padding: EdgeInsets.only(right: 20.w),
                        child: Text(
                          // "⚡ Emergency Service (₹999) – Get a plumber within 1 hour 🚀",
                          "⚡ ${data.service.emergencyServiceDescription}",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 17.sp,
                            color: Color.fromARGB(255, 17, 17, 28),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: Container(
                    height: 1.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      // border: Border.all(color: Colors.grey.shade300, width: 0.70),
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text(
                    "Service Included",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      color: Color.fromARGB(255, 17, 17, 28),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text(
                    "Service Gallery",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 17, 17, 28),
                    ),
                  ),
                ),
                SizedBox(height: 11.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Row(
                    children: [
                      if (data.service.serviceGalleryImages.isNotEmpty) ...[
                        ServiceGallary(
                          image: data.service.serviceGalleryImages[0],
                          // "assets/gallery1.png",
                        ),
                        SizedBox(width: 8.w),
                        ServiceGallary(
                          image: data.service.serviceGalleryImages[1],
                          // "assets/gallery2.png",
                        ),
                        SizedBox(width: 8.w),
                        ServiceGallary(
                          image: data.service.serviceGalleryImages[2],
                          //"assets/gallery3.png",
                        ),
                      ],
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text(
                    "Meet Your Service Expert",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: Color.fromARGB(255, 17, 17, 28),
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: ServiceGallary(
                        image:
                            data.service.serviceGalleryImages.isEmpty
                                ? ""
                                : data.service.serviceGalleryImages[0],
                        // "assets/rakesh.png",
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          // "Rakesh Sharma",
                          data.service.userName,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            color: Color.fromARGB(255, 17, 17, 28),
                          ),
                        ),
                        SizedBox(height: 3.h),
                        Text(
                          // "7+ Years Experience | Certified Plumber | Mumbai",
                          data.service.subCategoryName,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 9.sp,
                            color: Color.fromARGB(255, 0, 97, 254),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: SizedBox(
                            width: 290.w,
                            child: Text(
                              // "I take pride in providing reliable plumbing services with a focus on quality and customer satisfaction. Whether it’s a small fix or a major repair, I ensure a hassle-free experience!",
                              data.service.subCategoryName,
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic,
                                fontSize: 10.sp,
                                color: Color.fromARGB(255, 77, 77, 77),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text(
                    "Frequently Asked Questions (FAQs)",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                      color: Color.fromARGB(255, 17, 17, 28),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Question(
                      questions: "1. How long does the service take?",
                      answer:
                          "Most repairs take 30-45 minutes, complex jobs may take longer.",
                    ),
                    SizedBox(height: 20.h),
                    Question(
                      questions: "2. Do I need to provide any materials?",
                      answer:
                          "Most repairs take 30-45 minutes, complex jobs may take longer.",
                    ),
                    SizedBox(height: 20.h),
                    Question(
                      questions: "3. What if I’m not happy with the service?",
                      answer:
                          "Most repairs take 30-45 minutes, complex jobs may take longer.",
                    ),
                    SizedBox(height: 20.h),
                    Question(
                      questions: "4. Can I reschedule my booking?",
                      answer:
                          "Yes, you can modify your booking up to 2 hours before the service time.",
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Containerbody(
                        icon: Icon(
                          Icons.call,
                          color: Color.fromARGB(255, 0, 97, 255),
                        ),
                      ),
                      // SizedBox(width: 14.w),
                      Containerbody(
                        icon: Icon(
                          Icons.chat_bubble,
                          color: Color.fromARGB(255, 0, 97, 255),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
              ],
            );
          },
          error: (error, stackTrace) => Center(child: Text(error.toString())),
          loading:
              () => SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Center(child: CircularProgressIndicator()),
              ),
        ),
      ),
    );
  }
}

class Containerbody extends StatefulWidget {
  final Icon icon;
  const Containerbody({super.key, required this.icon});

  @override
  State<Containerbody> createState() => _ContainerbodyState();
}

class _ContainerbodyState extends State<Containerbody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 193.w,
      height: 44.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.r),
        color: Color.fromARGB(25, 0, 97, 254),
      ),
      child: Center(child: widget.icon),
    );
  }
}

class Question extends StatefulWidget {
  final String questions;
  final String answer;
  const Question({super.key, required this.questions, required this.answer});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.questions,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
              color: Color.fromARGB(255, 17, 17, 28),
            ),
          ),
          Text(
            widget.answer,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: Color.fromARGB(255, 77, 77, 77),
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceGallary extends StatefulWidget {
  final String image;
  const ServiceGallary({super.key, required this.image});

  @override
  State<ServiceGallary> createState() => _ServiceGallaryState();
}

class _ServiceGallaryState extends State<ServiceGallary> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 127.w,
      height: 129.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(11.r)),
      child: Image.network(widget.image),
    );
  }
}
