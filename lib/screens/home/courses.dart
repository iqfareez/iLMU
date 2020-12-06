import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skooled/models/course.dart';
import 'package:skooled/screens/home/courseCard.dart';
import 'package:skooled/utilities/global.dart';

class Courses extends StatefulWidget {
  final List<Course> courses;
  Courses({this.courses});

  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        allowFontScaling: false);
    return Container(
      padding: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customText(context, 60.sp, FontWeight.bold, darkblue, "Kursus Untuk Anda"),
          SizedBox(height: 0.02.sh),
          Expanded(
            child: Container(
              //height: 0.42.sh,
              // color: Colors.amber,
              child: 
              ListView.builder(
                padding: EdgeInsets.only(bottom: 20.h),
                scrollDirection: Axis.horizontal,
                itemCount: this.widget.courses.length,
                itemBuilder: (BuildContext context, i) {
                  Course course = this.widget.courses[i];
                  return CourseCard(course: course);
                }
              ),
            ),
          )
        ],
      ),
    );
  }
}