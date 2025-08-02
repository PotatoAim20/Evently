import 'package:evently/firebase/firebase_manager.dart';
import 'package:evently/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateEventScreen extends StatefulWidget {
  static const String routeName = 'AddEventScreen';
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final List<String> categories = [
    'Eating',
    'Meeting',
    'Workshop',
    'Birthday',
    'Book Club',
    'Exhibition',
    'Gaming',
    'Holiday',
  ];

  int selectedCategoryIndex = 0;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Event',
          style: TextStyle(
            color: Color(0xff5669FF),
            fontWeight: FontWeight.w400,
          ),
        ),
        iconTheme: IconThemeData(color: Color(0xff5669FF)),
      ),

      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(16.r),
                  child: Image.asset(
                    'assets/images/${categories[selectedCategoryIndex]}.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  height: 40.h,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(width: 10.w),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          selectedCategoryIndex = index;
                          setState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            border: BoxBorder.all(color: Color(0xff5669FF)),
                            borderRadius: BorderRadius.circular(37.r),
                            color:
                                selectedCategoryIndex == index
                                    ? Color(0xff5669FF)
                                    : Colors.transparent,
                          ),
                          child: Text(
                            categories[index],
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                              color:
                                  selectedCategoryIndex == index
                                      ? Colors.white
                                      : Color(0xff5669FF),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: categories.length,
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Text(
                      'Title',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),

                TextFormField(
                  controller: titleController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Title';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.edit_note),
                    hintText: 'Event Title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: Color(0xff7B7B7B)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: Color(0xff7B7B7B)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: Color(0xff7B7B7B)),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: Color(0xff7B7B7B)),
                    ),
                  ),
                ),

                SizedBox(height: 16.h),
                Row(
                  children: [
                    Text(
                      'Description',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),

                TextFormField(
                  controller: descriptionController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Description';
                    }
                    return null;
                  },
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Event Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: Color(0xff7B7B7B)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: Color(0xff7B7B7B)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: Color(0xff7B7B7B)),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: Color(0xff7B7B7B)),
                    ),
                  ),
                ),

                SizedBox(height: 16.h),

                Row(
                  children: [
                    Icon(Icons.calendar_month_outlined),
                    SizedBox(width: 10.w),
                    Text(
                      'Event Date',
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        selectDate();
                      },
                      child: Text(
                        selectedDate == null
                            ? 'Choose Date'
                            : selectedDate.toString().substring(0, 10),
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff5669FF),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16.h),

                Row(
                  children: [
                    Icon(Icons.calendar_month_outlined),
                    SizedBox(width: 10.w),
                    Text(
                      'Event Time',
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Choose Time',
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff5669FF),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        TaskModel taskModel = TaskModel(
                          title: titleController.text,
                          description: descriptionController.text,
                          date: selectedDate!.microsecondsSinceEpoch,
                          category: categories[selectedCategoryIndex],
                        );
                        FirebaseManager.createEvent(taskModel);
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      'Add Event',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  selectDate() async {
    DateTime? chosenDate = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            colorScheme: ColorScheme.light(
              // primary: Color(value),
              // onPrimary: Color(value),
              // onSurface: c
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {});
    }
  }
}
