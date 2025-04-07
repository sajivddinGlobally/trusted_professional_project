import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trusted_profissional_app/login/login.page.dart';
import 'package:trusted_profissional_app/signUp/registerModel/registerResModel.dart';
import 'package:trusted_profissional_app/signUp/registerService/apiController.dart';
import 'package:trusted_profissional_app/signUp/registerService/registerController.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final adharControlelr = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final completeKycController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isCircular = false;
  // Default user type
  String _selectedOption = "service provider";

  String? servicetype;

  List<String> type = ['Title of subcategory', 'Dustring', 'Plumming'];

  List<File> _selectedFiles = [];
  File? _selectedFile;

  // Future<void> pickFiles() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.image,
  //     allowMultiple: true, // Allow multiple image selection
  //   );
  //   if (result != null) {
  //     setState(() {
  //       _selectedFiles = result.paths.map((path) => File(path!)).toList();
  //     });
  //   }
  // }

  Future<void> pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _selectedFiles = result.paths.map((path) => File(path!)).toList();
        _selectedFile =
            _selectedFiles.first; // 👈 Assign first file to _selectedFile
      });
    }
  }

  File? selectedFile;

  Future<void> PickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.isNotEmpty) {
      setState(() {
        selectedFile = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final formData = ref.watch(formDataProvider);
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 440.w,
                height: 290.h,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 202, 222, 255),
                  image: DecorationImage(
                    image: AssetImage("assets/signUpImage.png"),
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create your account",
                      style: GoogleFonts.inter(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 30, 30, 30),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Already have an account? ",
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 30, 30, 30),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(builder: (context) => Login()),
                            );
                          },
                          child: Text(
                            "Login",
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 0, 97, 254),
                              decoration: TextDecoration.underline,
                              decorationColor: Color.fromARGB(
                                255,
                                0,
                                97,
                                254,
                              ), // Optional: Line ka color change karne ke liye
                              decorationThickness:
                                  2, // Optional: Line ki thickness
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Radio<String>(
                        value: "Seeking Servicer",
                        groupValue: _selectedOption,
                        onChanged: (value) {
                          setState(() {
                            _selectedOption = value!;
                            UserRegisterDataHold.usertype = value;
                          });
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedOption = "Seeking Servicer";
                            UserRegisterDataHold.usertype = "Seeking Service";
                          });
                        },
                        child: Text("Seeking Service"),
                      ),
                    ],
                  ),
                  SizedBox(width: 10.w),
                  Row(
                    children: [
                      Radio<String>(
                        value: "Service Provider",
                        groupValue: _selectedOption,
                        onChanged: (value) {
                          setState(() {
                            _selectedOption = value!;
                            UserRegisterDataHold.usertype = value;
                          });
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedOption = "Service Provider";
                            UserRegisterDataHold.usertype = "Service Provider";
                          });
                        },
                        child: Text("Service Provider"),
                      ),
                    ],
                  ),
                ],
              ),
              if (UserRegisterDataHold.usertype == "Service Provider") ...[
                RegisterField(lable: 'User Name', controller: nameController),
                RegisterField(lable: 'Your Email', controller: emailController),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Your Phone",
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 30, 30, 30),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Container(
                        // height: 55.h,
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          keyboardType: TextInputType.numberWithOptions(),
                          controller: phoneController,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Your Phone field is required";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // Aadhar Field, only visible for "service provider"
                RegisterField(
                  lable: "Adhar Number",
                  controller: adharControlelr,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Complete Kyc",
                        style: GoogleFonts.inter(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 30, 30, 30),
                        ),
                      ),
                      SizedBox(height: 10.h),
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
                                  selectedFile != null
                                      ? Text(
                                        selectedFile!.path,
                                        // overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: GoogleFonts.inter(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      )
                                      : Text(
                                        "No document selected",
                                        style: GoogleFonts.inter(
                                          fontSize: 12.sp,
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
                                width: 100.w,
                                height: 35.h,
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
                                      "Upload document",
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10.sp,
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
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Upload Video",
                        style: GoogleFonts.inter(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 30, 30, 30),
                        ),
                      ),
                      SizedBox(height: 10.h),
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
                                    : "No video selected",
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
                                    "Upload video",
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
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Service Type",
                        style: GoogleFonts.inter(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 30, 30, 30),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      DropdownButtonFormField<String>(
                        value: servicetype,
                        hint: Text(
                          "Service Service",
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 30, 30, 30),
                          ),
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            servicetype = newValue;
                          });
                        },
                        items:
                            type.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: GoogleFonts.roboto(
                                    fontSize: 13.w,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF4D4D4D),
                                  ),
                                ),
                              );
                            }).toList(),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12.h,
                            horizontal: 15.w,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),

                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 17, 17, 25),
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 17, 17, 25),
                              width: 1,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null) {
                            return 'Please select Service type';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ] else ...[
                RegisterField(lable: 'User Name', controller: nameController),
                RegisterField(lable: 'Your Email', controller: emailController),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Your Phone",
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 30, 30, 30),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Container(
                        // height: 55.h,
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          keyboardType: TextInputType.numberWithOptions(),
                          controller: phoneController,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Your Phone field is required";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Service Type",
                        style: GoogleFonts.inter(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 30, 30, 30),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      DropdownButtonFormField<String>(
                        value: servicetype,
                        hint: Text(
                          "Service Service",
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 30, 30, 30),
                          ),
                        ),

                        onChanged: (String? newValue) {
                          setState(() {
                            servicetype = newValue;
                          });
                        },
                        items:
                            type.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: GoogleFonts.roboto(
                                    fontSize: 13.w,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF4D4D4D),
                                  ),
                                ),
                              );
                            }).toList(),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12.h,
                            horizontal: 15.w,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 17, 17, 25),
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 17, 17, 25),
                              width: 1,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null) {
                            return 'Please select Service type';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ],
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(440.w, 53.h),
                    backgroundColor: Color.fromARGB(255, 0, 97, 254),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      log("testing");
                      setState(() {
                        isCircular = true;
                      });

                      if (UserRegisterDataHold.usertype == "Seeking Service") {
                        RegistorResModel resModel =
                            await Apicontroller.register(
                              context,
                              name: nameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                              user_type: formData.user_type,
                              ifError: () {
                                setState(() {
                                  isCircular = false;
                                });
                              },
                            );
                      } else {
                        RegistorResModel resModel =
                            await Apicontroller.registerUser(
                              context,
                              name: nameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                              imageFile: _selectedFile!,
                              aadhar: adharControlelr.text,
                              video: selectedFile!,
                              user_type: formData.user_type,
                              ifError: () {
                                setState(() {
                                  isCircular = false;
                                });
                              },
                            );
                      }
                    }
                  },
                  child:
                      isCircular == true
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text(
                            "Sign Up",
                            style: GoogleFonts.inter(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                ),
              ),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterField extends StatefulWidget {
  final String lable;
  final TextEditingController controller;
  const RegisterField({
    super.key,
    required this.lable,
    required this.controller,
  });

  @override
  State<RegisterField> createState() => _RegisterFieldState();
}

class _RegisterFieldState extends State<RegisterField> {
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
                widget.lable,
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
            controller: widget.controller,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "${widget.lable} field is required";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}

class UserRegisterDataHold {
  static String usertype = "";
}
