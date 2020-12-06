import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skooled/models/course.dart';
import 'package:skooled/screens/home/about.dart';
import 'package:skooled/screens/home/courses.dart';
import 'package:skooled/screens/home/footer.dart';
import 'package:skooled/screens/home/header.dart';
import 'package:skooled/screens/home/subscription.dart';
import 'package:skooled/screens/moreMenu/moreMenu.dart';
import 'package:skooled/utilities/api_service.dart';
import 'package:skooled/utilities/global.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  List<Course> _courses = [];

  @override
  void initState() {
    super.initState();
    _initCourse();
  }

  _initCourse() async {
    List<Course> courses = await APIService.instance.getCourses();
    setState(() {
      _courses = courses;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, allowFontScaling: false);
    super.build(context);
    return DefaultTabController(
      length: 2,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          resizeToAvoidBottomPadding: true,
            bottomNavigationBar: Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.16),
                    blurRadius: 6.w,
                    offset: Offset(0, -3))
              ]),
              child: Container(
                height: 150.h,
                child: TabBar(
                  unselectedLabelColor: darkblue,
                  labelColor: yellow,
                  indicatorColor: Colors.transparent,
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.home_rounded,
                        size: 80.sp,
                      ),
                    ),
                    Tab(
                      icon: Icon(Icons.more_horiz_rounded, size: 80.sp),
                    ),
                  ],
                ),
              ),
            ),
            body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                Container(
                  child: SingleChildScrollView(
                    child: Column(
                      // addAutomaticKeepAlives: true,
                      // addRepaintBoundaries: true,
                      children: [
                        AspectRatio(
                          aspectRatio: 3.0/2.0,
                          child: Header()
                        ),
                        SizedBox(height: 0.05.sh),
                        AspectRatio(
                          aspectRatio: 3.0/2.0,
                          child: this._courses != null? Courses(courses: this._courses,)
                          : Container()
                        ),
                        SizedBox(height: 0.1.sh),
                        AspectRatio(
                          aspectRatio: 3.0/2.6,
                          child: About()
                        ),
                        SizedBox(height: 0.1.sh),
                        AspectRatio(
                          aspectRatio: 3.0/3.5,
                          child: SubcriptionPlans()
                        ),
                        SizedBox(height: 0.05.sh),
                        AspectRatio(
                          aspectRatio: 3.0/3.5,
                          child: Footer(),
                        )
                      ],
                    ),
                  ),
                ),
                MoreMenu()
              ],
            )),
      ),
    );
  }
  @override
  bool get wantKeepAlive => true;
}
