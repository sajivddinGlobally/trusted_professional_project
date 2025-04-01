import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trusted_profissional_app/home/homeCategoryApi/Service/CategoryController.dart';
import 'package:trusted_profissional_app/home/service.page.ServiceApi/service/serviceProviderController.dart';

import 'package:trusted_profissional_app/particularService/particularService.page.dart';

class ServicePage extends ConsumerStatefulWidget {
  const ServicePage({super.key});

  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends ConsumerState<ServicePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;
  Map<String, List<Map<String, dynamic>>> filters = {};
  Map<String, int?> selectedFilters = {}; // Ensure it's a Map

  String selectCategoryId = "";
  @override
  String searchQuery = "";
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final filterData = ref.watch(filtersProvider);

    return filterData.when(
      data: (filters) {
        // Initialize selectedFilters properly
        filters.forEach((key, value) {
          selectedFilters.putIfAbsent(key, () => null); // Store null initially
        });
        return Scaffold(
          key: _scaffoldKey,
          endDrawer: Drawer(
            backgroundColor: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.w),
              child: SingleChildScrollView(
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
                                  label: Text(
                                    filters[category]![index]['title'],
                                  ),
                                  selected:
                                      selectedFilters[category] ==
                                      filters[category]![index]['id'], // Only one selected
                                  onSelected: (selected) {
                                    setState(() {
                                      if (selected) {
                                        selectedFilters[category] =
                                            filters[category]![index]['id']; // Set new selected index
                                        selectCategoryId =
                                            filters[category]![index]['id']
                                                .toString();
                                        _scaffoldKey.currentState
                                            ?.closeEndDrawer();
                                      } else {
                                        selectedFilters.remove(
                                          category,
                                        ); // Unselect if clicked again
                                        selectCategoryId = "";
                                        _scaffoldKey.currentState
                                            ?.closeEndDrawer();
                                      }
                                    });
                                    log(selectedFilters.toString());
                                  },
                                  selectedColor: Colors.blue,
                                  backgroundColor: Colors.transparent,
                                  labelStyle: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    color:
                                        selectedFilters[category] == index
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              size: 20.sp,
                            ),
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
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value.toLowerCase();
                        });
                      },
                    ),
                  ),
                ),

                Mygridviewbuilder(searchQuery, selectCategoryId),
              ],
            ),
          ),
        );
      },
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text(stackTrace.toString())),
    );
  }
}

class Mygridviewbuilder extends ConsumerStatefulWidget {
  final String searchQuery;
  final String subcategoriid;
  const Mygridviewbuilder(this.searchQuery, this.subcategoriid, {super.key});

  @override
  ConsumerState<Mygridviewbuilder> createState() => _MygridviewbuilderState();
}

class _MygridviewbuilderState extends ConsumerState<Mygridviewbuilder> {
  @override
  Widget build(BuildContext context) {
    final serviceData = ref.watch(
      serviceProviderController(widget.subcategoriid),
    );
    // final exampleData = ref.watch(exmapleProvider);
    return SizedBox(
      child: serviceData.when(
        data: (service) {
          final filteredServices =
              service.serviceProviders.where((provider) {
                return provider.title.toLowerCase().contains(
                  widget.searchQuery,
                );
              }).toList();
          return Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.h),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: filteredServices.length,
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
                        builder:
                            (context) => ParticularService(
                              id: filteredServices[index].id.toString(),
                            ),
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
                                filteredServices[index].bannerImage,
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
                            filteredServices[index].title,
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
        loading:
            () => SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(child: CircularProgressIndicator()),
            ),
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
