import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skooled/models/course.dart';
import 'package:skooled/screens/courseDetail/courseDetail.dart';
import 'package:skooled/utilities/global.dart';

class CourseCard extends StatelessWidget {
  final Course course;
  CourseCard({this.course});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, allowFontScaling: false);
    double cardSize = 450;
    return Container(
        // color: Colors.red,
        width: cardSize.w,
        padding: EdgeInsets.only(right: 0.05.sw),
        child: Container(
          decoration: BoxDecoration(
              color: darkblue,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff14213D).withOpacity(0.5),
                  blurRadius: 6.w,
                  offset: Offset(0, 5),
                )
              ]),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  height: cardSize*0.684.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24))),
                  child: Stack(
                    children: [
                      Container(
                        height: double.infinity,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24)),
                          child: Image.asset(
                            this.course.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  // color: Colors.green,
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: cardSize*0.05.w, right: cardSize*0.05.w, top: cardSize*0.05.h, bottom: cardSize*0.07.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText(context, 40.sp, FontWeight.bold, Colors.white,
                                this.course.title),
                            
                            Expanded(
                              child: Container(
                                //height: cardSize*0.25,
                                // color: Colors.red,
                                child: Text(
                                  this.course.desc,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                    fontSize: 32.sp,
                                    color: Colors.white,
                                  )
                                ),
                              ),
                            ),
                            customText(context, 32.sp, FontWeight.bold, Colors.white,
                                this.course.author),
                          ],
                        ),
                      ),
                      Positioned(
                        child: Container(
                            height: cardSize*0.2.h,
                            width: cardSize*0.2.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular((cardSize*0.2.h)),
                                boxShadow: [
                                  BoxShadow(
                                    color: yellow.withOpacity(0.5),
                                    blurRadius: 5.w,
                                  )
                                ]),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: yellow,
                                  borderRadius: BorderRadius.circular(cardSize*0.2.h)),
                              child: InkWell(
                                child: Icon(
                                  Icons.add_rounded,
                                  color: Colors.white,
                                  size: (cardSize*0.2)*0.7.h,
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    //MaterialPageRoute(builder: (context) => Demo1()),
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CourseDetail(this.course)),
                                  );
                                },
                              ),
                            )),
                        bottom: 10.w,
                        right: 10.w,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
  }
}
