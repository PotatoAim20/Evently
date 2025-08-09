// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:evently/firebase/firebase_manager.dart';
import 'package:evently/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FavTab extends StatelessWidget {
  static String routeName = 'FavTab';
  String category;

  FavTab({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<TaskModel>>(
      stream: FirebaseManager.getTasks(isFav: true, category: category),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: Color(0xff5669FF)),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Something Went Wrong'));
        } else if (snapshot.data!.docs.isEmpty) {
          return Center(child: Text('No Tasks'));
        }

        return Padding(
          padding: EdgeInsets.all(16),
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemBuilder: (context, index) {
              var date = DateTime.fromMicrosecondsSinceEpoch(
                snapshot.data!.docs[index].data().date,
              );
              String formatted = DateFormat('MMM').format(date);

              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusGeometry.circular(16.r),
                ),
                child: Container(
                  height: 203.h,
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/${snapshot.data?.docs[index].data().category}.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.all(4),
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffF2FEFF),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Column(
                            children: [
                              Text(
                                date.toString().substring(8, 10),
                                style: GoogleFonts.inter(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff5669FF),
                                ),
                              ),
                              Text(
                                formatted,
                                style: GoogleFonts.inter(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff5669FF),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: Colors.white,
                          ),
                          child: ListTile(
                            title: Text(
                              snapshot.data?.docs[index].data().title ?? '',
                            ),
                            trailing: InkWell(
                              onTap: () {
                                FirebaseManager.addTaskFav(
                                  snapshot.data!.docs[index].data().id,
                                  !snapshot.data!.docs[index].data().isFav,
                                );
                              },
                              child: Icon(
                                snapshot.data!.docs[index].data().isFav == false
                                    ? Icons.favorite_border
                                    : Icons.favorite,
                                color: Color(0xff5669FF),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: snapshot.data?.docs.length ?? 0,
          ),
        );
      },
    );
  }
}
