import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trusted_profissional_app/home/homeCategoryApi/Model/subcategory.model.dart';

import 'package:trusted_profissional_app/home/homeCategoryApi/Service/CategoryController.dart';
import 'package:trusted_profissional_app/home/service.page.dart';

class AddServicePage extends ConsumerStatefulWidget {
  const AddServicePage({super.key});

  @override
  _AddServicePageState createState() => _AddServicePageState();
}

class _AddServicePageState extends ConsumerState<AddServicePage> {
  bool loder = false;
  TimeOfDay? selectedTime;
  File? _selectedFile;
  List<File> _selectedFiles = [];
  String? subcategoryId;
  Future<void> pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true, // Allow multiple image selection
    );

    if (result != null) {
      setState(() {
        _selectedFiles = result.paths.map((path) => File(path!)).toList();
      });
    }
  }

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

  TextEditingController _titleController = TextEditingController();
  TextEditingController _serviceLocationController = TextEditingController();
  TextEditingController _startingPriceController = TextEditingController();
  TextEditingController _whatsDEcController = TextEditingController();
  TextEditingController _fullDecController = TextEditingController();
  TextEditingController _emergencyController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(subcategory);
    return data.when(
      data: (snapshot) {
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
                    addServiceField(
                      controller: _titleController,
                      title: 'Title',
                      keyboardtype: TextInputType.text,
                      hintText: 'Enter title',
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20.w,
                        right: 20.w,
                        top: 20.h,
                      ),
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
                      controller: _serviceLocationController,
                      title: 'Service Locations',
                      keyboardtype: TextInputType.text,
                      hintText: 'Enter Locations',
                    ),
                    addServiceField(
                      controller: _startingPriceController,
                      title: "Staring price",
                      keyboardtype: TextInputType.number,
                      hintText: 'Enter price',
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Whats included description",
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
                            controller: _whatsDEcController,
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
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Full package description",
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
                            controller: _fullDecController,
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
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Emergency service description",
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
                            controller: _emergencyController,
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
                      padding: EdgeInsets.only(
                        left: 20.w,
                        right: 20.w,
                        top: 20.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Banner Image",
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
                                              color: Color.fromARGB(
                                                255,
                                                0,
                                                0,
                                                0,
                                              ),
                                            ),
                                          )
                                          : Text(
                                            "No file selected",
                                            style: GoogleFonts.inter(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromARGB(
                                                255,
                                                0,
                                                0,
                                                0,
                                              ),
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
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20.w,
                        right: 20.w,
                        top: 20.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Gallery Image",
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 6.h),

                          /// Upload Container
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
                                  child: Text(
                                    _selectedFiles.isNotEmpty
                                        ? "${_selectedFiles.length} file(s) selected"
                                        : "No file selected",
                                    style: GoogleFonts.inter(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: pickFiles,
                                  child: Container(
                                    width: 100.w,
                                    height: 35.h,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Upload File",
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 11.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.w),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.h),

                          /// Show Selected Images Below
                          _selectedFiles.isNotEmpty
                              ? Wrap(
                                spacing: 10.w,
                                runSpacing: 10.h,
                                children:
                                    _selectedFiles.map((file) {
                                      return Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              10.r,
                                            ),
                                            child: Image.file(
                                              file,
                                              width: 80.w,
                                              height: 80.h,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Positioned(
                                            right: 0,
                                            top: 0,
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _selectedFiles.remove(file);
                                                });
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(
                                                  Icons.close,
                                                  size: 16.sp,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }).toList(),
                              )
                              : Container(), // If no images are selected, show nothing
                        ],
                      ),
                    ),
                    DropDownField(
                      categories: snapshot.data,
                      callback: (value) {
                        subcategoryId = value;
                      },
                    ),
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
                            controller: _descriptionController,
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
                      padding: EdgeInsets.only(
                        left: 20.w,
                        right: 20.w,
                        top: 30.h,
                      ),
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
                            // ScaffoldMessenger.maybeOf(context)!.showSnackBar(
                            //   SnackBar(content: Text("Services Add")),
                            // );
                            try {
                              setState(() {
                                loder = true;
                              });
                              var box = Hive.box("authBox");
                              AddServiceApiContrioller.addService(
                                title: _titleController.text,
                                description: _descriptionController.text,
                                serviceLocation:
                                    _serviceLocationController.text,
                                avabileTime:
                                    selectedTime == null
                                        ? "Selected Time"
                                        : selectedTime!.format(context),
                                staringPrcie: _startingPriceController.text,
                                whatsInculerDec: _whatsDEcController.text,
                                fullPackageDec: _fullDecController.text,
                                emergencyServiceDescription:
                                    _emergencyController.text,
                                userid: "${box.get('id')}",
                                sub_category_id: subcategoryId!,
                                imageFile: _selectedFile!,
                                gallaryImages: _selectedFiles,
                              );
                              Fluttertoast.showToast(msg: "Service add");
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => ServicePage(),
                                ),
                              );
                            } catch (e) {
                              setState(() {
                                loder = false;
                              });
                            }
                          },
                          child:
                              loder == false
                                  ? Text(
                                    "Save",
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.sp,
                                      color: Colors.white,
                                    ),
                                  )
                                  : Center(
                                    child: CircularProgressIndicator(
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
      },
      error: (error, StackTrace) {
        return Center(child: Text(StackTrace.toString()));
      },
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }
}

class DropDownField extends StatefulWidget {
  final List<Datum> categories; // Pass the list of categories

  final Function callback;

  const DropDownField({
    super.key,
    required this.categories,
    required this.callback,
  });

  @override
  State<DropDownField> createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {
  int? selectedCategoryId;

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
          DropdownButtonFormField<int>(
            value: selectedCategoryId,
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
                widget.categories.map((Datum category) {
                  return DropdownMenuItem<int>(
                    value: category.id, // Pass ID as value
                    child: Text(
                      category.title, // Show title as text
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 30, 30, 30),
                      ),
                    ),
                  );
                }).toList(),
            onChanged: (newValue) {
              setState(() {
                selectedCategoryId = newValue;
                widget.callback("$newValue");
              });
              log("Selected Category ID: $selectedCategoryId");
            },
          ),
        ],
      ),
    );
  }
}

class addServiceField extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String hintText;
  final TextInputType keyboardtype;
  const addServiceField({
    super.key,
    required this.title,
    required this.controller,
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
            controller: widget.controller,
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

class AddServiceApiContrioller {
  static Future<Map<String, dynamic>> addService({
    required String title,
    required String description,
    required String serviceLocation,
    required String avabileTime,
    required String staringPrcie,
    required String whatsInculerDec,
    required String fullPackageDec,
    required String emergencyServiceDescription,
    required String userid,
    required String sub_category_id,
    required File imageFile,
    required List<File> gallaryImages,
  }) async {
    final Uri url = Uri.parse(
      "https://skilzaar.laravel.globallywebsolutions.com/api/services-provider",
    );
    var request = http.MultipartRequest("POST", url);
    request.headers.addAll({
      // Example Authorization header
      "Content-Type": "application/json",
      "Accept": "application/json", // Ensure content type is correct
      // You can add other custom headers here
    });
    request.files.add(
      await http.MultipartFile.fromPath('banner_image', imageFile.path),
    );
    for (var file in gallaryImages) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'service_gallery_images[]',
          file.path,
        ),
      );
    }
    request.fields.addAll({
      "user_id": "$userid",
      "title": title,
      "description": description,
      "service_location": serviceLocation,
      "availability_time": avabileTime,
      "starting_price": staringPrcie,
      "category_id": "1",
      "whats_included_description": whatsInculerDec,
      "full_package_description": fullPackageDec,
      "emergency_service_description": emergencyServiceDescription,
      "sub_category_id": sub_category_id,
    });

    final http.StreamedResponse response = await request.send();

    final responseBody = await response.stream.bytesToString();
    log(responseBody); // Log response for debugging
    Map<String, dynamic> data = jsonDecode(responseBody);
    if (response.statusCode == 201 || response.statusCode == 200) {
      log(responseBody.toString());
    } else {
      throw Exception("Failed to register: ${response.reasonPhrase}");
    }
    return data;
  }
}
