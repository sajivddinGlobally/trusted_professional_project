import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trusted_profissional_app/home/service.page.ServiceApi/service/serviceController.dart';

import 'package:trusted_profissional_app/particularService/particularService.page.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;
  Map<String, List<String>> filters = {
    "Brand": [
      "Philips",
      "Sony",
      "JBL",
      "Headphones",
      "Sennheiser",
      "Motorola",
      "Zebronics",
      "iBall",
      "Signature",
      "Generic",
    ],
    "Features": [
      "Wireless",
      "Sports",
      "Noise Cancelling",
      "With Microphone",
      "Tangle Free Cord",
    ],
    "Connectivity Technology": [
      "Wired-3.5 MM Single Pin",
      "Bluetooth Wireless",
      "Wired USB",
    ],
  };
  Map<String, List<bool>> selectedFilters = {};
  @override
  void initState() {
    super.initState();
    // Initialize selection map
    filters.forEach((key, value) {
      selectedFilters[key] = List.generate(value.length, (index) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        backgroundColor: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              top: 40.w,
              bottom: 16.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  filters.keys.map((category) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category,
                          style: GoogleFonts.montserrat(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: List.generate(filters[category]!.length, (
                            index,
                          ) {
                            return ChoiceChip(
                              iconTheme: IconThemeData(color: Colors.white),
                              label: Text(filters[category]![index]),
                              selected: selectedFilters[category]![index],
                              onSelected: (selected) {
                                setState(() {
                                  selectedFilters[category]![index] = selected;
                                });
                              },
                              selectedColor: Colors.blue,
                              backgroundColor: Colors.transparent,
                              labelStyle: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                color:
                                    selectedFilters[category]![index]
                                        ? Colors.white
                                        : Colors.black,
                              ),
                            );
                          }),
                        ),
                        SizedBox(height: 16),
                      ],
                    );
                  }).toList(),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 64.h),
            Row(
              children: [
                SizedBox(width: 20.w),
                GestureDetector(
                  onTap: () {},
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
                GestureDetector(
                  onTap: () {
                    _scaffoldKey.currentState
                        ?.openEndDrawer(); // Opens End Drawer
                  },
                  child: Container(
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
                    // contentPadding: EdgeInsets.only(bottom: 45.h),
                    hintText: "Search",
                    hintStyle: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 15.sp,
                      color: Color.fromARGB(255, 128, 128, 128),
                      height: 2.h,
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
            // SizedBox(height: 20.h),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: [
            //       SizedBox(width: 20.w),
            //       GestureDetector(
            //         onTap: () {
            //           setState(() {
            //             currentIndex = 0;
            //           });
            //         },
            //         child: ContainerBody(
            //           text: 'Cleaning & Maintenance',
            //           textcolor:
            //               currentIndex == 0
            //                   ? Color.fromARGB(255, 229, 239, 255)
            //                   : Color.fromARGB(255, 0, 97, 254),
            //           color:
            //               currentIndex == 0
            //                   ? Color.fromARGB(255, 0, 97, 254)
            //                   : Color.fromARGB(255, 229, 239, 255),
            //           bordercolor:
            //               currentIndex == 0
            //                   ? Color.fromARGB(255, 17, 17, 28)
            //                   : Colors.transparent,
            //         ),
            //       ),
            //       SizedBox(width: 8.w),
            //       GestureDetector(
            //         onTap: () {
            //           setState(() {
            //             currentIndex = 1;
            //           });
            //         },
            //         child: ContainerBody(
            //           text: 'Automobile Services',
            //           textcolor:
            //               currentIndex == 1
            //                   ? Color.fromARGB(255, 229, 239, 255)
            //                   : Color.fromARGB(255, 0, 97, 254),
            //           color:
            //               currentIndex == 1
            //                   ? Color.fromARGB(255, 0, 97, 254)
            //                   : Color.fromARGB(255, 229, 239, 255),
            //           bordercolor:
            //               currentIndex == 1
            //                   ? Color.fromARGB(255, 17, 17, 28)
            //                   : Colors.transparent,
            //         ),
            //       ),
            //       SizedBox(width: 8.w),
            //       GestureDetector(
            //         onTap: () {
            //           setState(() {
            //             currentIndex = 2;
            //           });
            //         },
            //         child: ContainerBody(
            //           text: 'Tech & IT Support',
            //           textcolor:
            //               currentIndex == 2
            //                   ? Color.fromARGB(255, 229, 239, 255)
            //                   : Color.fromARGB(255, 0, 97, 254),
            //           color:
            //               currentIndex == 2
            //                   ? Color.fromARGB(255, 0, 97, 254)
            //                   : Color.fromARGB(255, 229, 239, 255),
            //           bordercolor:
            //               currentIndex == 2
            //                   ? Color.fromARGB(255, 17, 17, 28)
            //                   : Colors.transparent,
            //         ),
            //       ),
            //       SizedBox(width: 8.w),
            //       GestureDetector(
            //         onTap: () {
            //           setState(() {
            //             currentIndex = 3;
            //           });
            //         },
            //         child: ContainerBody(
            //           text: 'Events & Entertainment',
            //           textcolor:
            //               currentIndex == 3
            //                   ? Color.fromARGB(255, 229, 239, 255)
            //                   : Color.fromARGB(255, 0, 97, 254),
            //           color:
            //               currentIndex == 3
            //                   ? Color.fromARGB(255, 0, 97, 254)
            //                   : Color.fromARGB(255, 229, 239, 255),
            //           bordercolor:
            //               currentIndex == 3
            //                   ? Color.fromARGB(255, 17, 17, 28)
            //                   : Colors.transparent,
            //         ),
            //       ),
            //       SizedBox(width: 10.w),
            //     ],
            //   ),
            // ),
            Mygridviewbuilder(),
          ],
        ),
      ),
    );
  }
}

class Mygridviewbuilder extends ConsumerStatefulWidget {
  const Mygridviewbuilder({super.key});

  @override
  ConsumerState<Mygridviewbuilder> createState() => _MygridviewbuilderState();
}

class _MygridviewbuilderState extends ConsumerState<Mygridviewbuilder> {
  @override
  Widget build(BuildContext context) {
    final serviceData = ref.watch(serviceProvider);
    return SizedBox(
      child: serviceData.when(
        data: (service) {
          return Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.h),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: service.data.length,
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
                      CupertinoPageRoute(
                        builder: (context) => ParticularService(),
                      ),
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
                              child: Image.network(
                                // "assets/electricianservice.png",
                                service.data[index].imageUrl,
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
                            // "Rahul: Electrician Service",
                            service.data[index].title,
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
          );
        },
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class ContainerBody extends ConsumerStatefulWidget {
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
  ConsumerState<ContainerBody> createState() => _ContainerBodyState();
}

class _ContainerBodyState extends ConsumerState<ContainerBody> {
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
