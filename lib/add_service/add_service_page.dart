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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Service")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(),
                  ),
                  child: Center(child: Text("Banner Image")),
                  // child: Padding(
                  //   padding: EdgeInsets.all(10.w),
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.circular(10.r),
                  //     child: Image.asset(
                  //       "assets/serviceman.png",
                  //       width: 80.w,
                  //       height: 180.h,
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),
                ),
              ),
            ),
            Column(
              children: [
                addServiceField(
                  title: 'Title',
                  keyboardtype: TextInputType.text,
                ),
                addServiceField(
                  title: "Description",
                  keyboardtype: TextInputType.text,
                ),
                addServiceField(
                  title: "Service Locations",
                  keyboardtype: TextInputType.text,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Avaibility Time",
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 30, 30, 30),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      GestureDetector(
                        onTap: () {
                          _selectTime(context);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 70.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 10.w),
                              Text(
                                selectedTime == null
                                    ? "No time selected"
                                    : selectedTime!.format(context),
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 30, 30, 30),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
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
                addServiceField(
                  title: "Starting Price",
                  keyboardtype: TextInputType.number,
                ),
                DropDownFiled(),
                SizedBox(height: 10.h),
                DropDownFiled(),
                SizedBox(height: 30.h),
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
  List<String> dropdownItems = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Text(
            "Sub Category",
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 30, 30, 30),
            ),
          ),
          SizedBox(height: 10.h),
          DropdownButtonFormField<String>(
            value: selectedValue,
            decoration: InputDecoration(
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
                horizontal: 10,
                vertical: 18.h,
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
  final TextInputType keyboardtype;
  const addServiceField({
    super.key,
    required this.title,
    required this.keyboardtype,
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
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 30, 30, 30),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          TextFormField(
            keyboardType: widget.keyboardtype,
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
          ),
        ],
      ),
    );
  }
}
