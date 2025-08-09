import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:evently/models/task_model.dart';
import 'package:evently/screens/edit_event/edit_event_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EventDetails extends StatefulWidget {
  static const String routeName = 'EventDetails';
  const EventDetails({super.key});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    var taskId = ModalRoute.of(context)!.settings.arguments as String;

    return StreamBuilder<DocumentSnapshot>(
      stream:
          FirebaseFirestore.instance
              .collection('Tasks')
              .doc(taskId)
              .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: Color(0xff5669FF)),
            ),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(body: Center(child: Text('Something went wrong')));
        }

        if (!snapshot.hasData ||
            snapshot.data == null ||
            !snapshot.data!.exists) {
          return Scaffold(body: Center(child: Text('Event not found')));
        }

        var taskModel = TaskModel.fromJson(
          snapshot.data!.data() as Map<String, dynamic>,
        );

        var date = DateTime.fromMicrosecondsSinceEpoch(taskModel.date);
        String formatted = DateFormat('dd MMMM yyyy').format(date);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Event Details',
              style: TextStyle(
                color: Color(0xff5669FF),
                fontWeight: FontWeight.w400,
              ),
            ),
            iconTheme: IconThemeData(color: Color(0xff5669FF)),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    EditEvent.routeName,
                    arguments: taskModel,
                  );
                },
                icon: Icon(Icons.edit, color: Color(0xff5669FF), size: 24),
              ),
              IconButton(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection('Tasks')
                      .doc(taskId)
                      .delete();

                  Navigator.pop(context);
                },
                icon: Icon(Icons.delete, color: Color(0xffFF5659), size: 24),
              ),
            ],
          ),

          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(16.r),
                    child: Image.asset(
                      'assets/images/${taskModel.category}.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    taskModel.title,
                    style: GoogleFonts.inter(
                      color: Color(0xff5669FF),
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: 16.h),

                  Container(
                    height: 66.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: Color(0xff5669FF)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 48.h,
                            width: 48.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.sp),
                              color: Color(0xff5669FF),
                            ),
                            child: Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  formatted,
                                  style: GoogleFonts.inter(
                                    color: Color(0xff5669FF),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                Text(
                                  '12:12PM',
                                  style: GoogleFonts.inter(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 16.h),

                  Container(
                    height: 66.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: Color(0xff5669FF)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 48.h,
                            width: 48.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.sp),
                              color: Color(0xff5669FF),
                            ),
                            child: Icon(
                              Icons.my_location_outlined,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Text(
                              'Cairo , Egypt',
                              style: GoogleFonts.inter(
                                color: Color(0xff5669FF),
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    height: 361.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: Color(0xff5669FF)),
                    ),

                    child: Center(child: Text('Map')),
                  ),
                  SizedBox(height: 16.h),

                  Text(
                    'Description',
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: 8.h),

                  Text(
                    taskModel.description,
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
