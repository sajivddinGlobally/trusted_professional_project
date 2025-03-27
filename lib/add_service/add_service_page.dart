import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AddServicePage extends StatefulWidget {
  const AddServicePage({super.key});

  @override
  State<AddServicePage> createState() => _AddServicePageState();
}

class _AddServicePageState extends State<AddServicePage> {
  TimeOfDay? selectedTime;
  File? _selectedFile;

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
      });
  }

  Future<void> PickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset("assets/serviceman.png"),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text(
                    "Add Service",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 24.sp,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Avaibility Time",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      SizedBox(height: 6.h),
                      GestureDetector(
                        onTap: () {
                          _selectTime(context);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 10.w),
                              Text(
                                selectedTime == null
                                    ? "Selected Time"
                                    : selectedTime!.format(context),
                                style: GoogleFonts.inter(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_drop_down_sharp,
                                color: Color.fromARGB(102, 0, 0, 0),
                                size: 30.sp,
                              ),
                              SizedBox(width: 10.w),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                addServiceField(
                  title: 'Service Locations',
                  keyboardtype: TextInputType.text,
                  hintText: 'Enter Locations',
                ),
                addServiceField(
                  title: "Staring_price",
                  keyboardtype: TextInputType.number,
                  hintText: 'Enter price',
                ),
                addServiceField(
                  title: "Whats_included_description",
                  keyboardtype: TextInputType.text,
                  hintText: 'Enter description',
                ),
                addServiceField(
                  title: "full_package_description",
                  keyboardtype: TextInputType.text,
                  hintText: 'Enter',
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Upload File",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 10.w),
                            Expanded(
                              child:
                                  _selectedFile != null
                                      ? Text(
                                        _selectedFile!.path,
                                        // overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: GoogleFonts.inter(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      )
                                      : Text(
                                        "No file selected",
                                        style: GoogleFonts.inter(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                PickFile();
                              },
                              child: Container(
                                width: 70.w,
                                height: 25.h,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 0, 97, 254),
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 5.w,
                                    right: 5.w,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Upload file",
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                DropDownFiled(),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Description",
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 30, 30, 30),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      TextFormField(
                        maxLines: 8,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          hintText: "Enter Description",
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12.h,
                            horizontal: 15.w,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 17, 17, 25),
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 17, 17, 25),
                              width: 1,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 17, 17, 25),
                              width: 1,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 17, 17, 25),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
                  child: Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(
                          MediaQuery.of(context).size.width,
                          53.h,
                        ),
                        backgroundColor: Color.fromARGB(255, 0, 97, 254),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.maybeOf(context)!.showSnackBar(
                          SnackBar(content: Text("Services Add")),
                        );
                      },
                      child: Text(
                        "Save",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DropDownFiled extends StatefulWidget {
  const DropDownFiled({super.key});

  @override
  State<DropDownFiled> createState() => _DropDownFiledState();
}

class _DropDownFiledState extends State<DropDownFiled> {
  String? selectedValue;
  List<String> dropdownItems = ['Category 1', 'Category 2', 'Category 3'];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Text(
            "Category",
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          SizedBox(height: 6.h),
          DropdownButtonFormField<String>(
            value: selectedValue,
            decoration: InputDecoration(
              hintText: "Select Category",
              hintStyle: GoogleFonts.inter(
                fontSize: 10.sp,
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(),
              ),
              isDense: true, // Reduces the overall height
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 12.h,
              ), // Adjust padding
            ),
            items:
                dropdownItems.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 30, 30, 30),
                      ),
                    ),
                  );
                }).toList(),
            onChanged: (newvlaue) {
              setState(() {
                selectedValue = newvlaue;
              });
            },
          ),
        ],
      ),
    );
  }
}

class addServiceField extends StatefulWidget {
  final String title;
  final String hintText;
  final TextInputType keyboardtype;
  const addServiceField({
    super.key,
    required this.title,
    required this.keyboardtype,
    required this.hintText,
  });

  @override
  State<addServiceField> createState() => _addServiceFieldState();
}

class _addServiceFieldState extends State<addServiceField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                // "Title",
                widget.title,
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h),
          TextFormField(
            keyboardType: widget.keyboardtype,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              hintText: widget.hintText,
              contentPadding: EdgeInsets.symmetric(
                vertical: 12.h,
                horizontal: 15.w,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 17, 17, 25),
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 17, 17, 25),
                  width: 1,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 17, 17, 25),
                  width: 1,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 17, 17, 25),
                  width: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
