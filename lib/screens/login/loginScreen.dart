import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skooled/screens/home/home.dart';
import 'package:skooled/utilities/global.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, allowFontScaling: true);
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.1, 1],
                  colors: [darkblue, Color(0xffA1A6B1)])),
          child: Stack(
            children: [
              Positioned(
                bottom: -200.h,
                left: -150.w,
                child: createCircle(context, darkblue, 1.4.sw, 1.sw, 0.6, 0.3)),
              Positioned(
                top: -200.h,
                right: -150.w,
                child: createCircle(context, Colors.white, 1.sw, 0.6.sw, 0.1, 0.05)),
              Center(
                child: Container(
                  height: 0.6.sh,
                  width: 0.7.sw,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Center(child: Image.asset("assets/images/skooled.png", width: 0.5.sw,)
                        ),
                      ),
                      Container(
                        height: 0.4.sh,
                        padding: EdgeInsets.all(0.05.sw),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(24)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            customText(context, 60.sp, FontWeight.bold, darkblue, "Login"),
                            Container(
                              padding: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: TextField(
                                style: TextStyle(
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.normal,
                                  color: darkblue,
                                  fontFamily: "Nunito"
                                ),
                                decoration: InputDecoration(
                                border: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                hintText: "Username",
                                hintStyle: TextStyle(
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.normal,
                                  color: darkblue,
                                  fontFamily: "Nunito"
                                )
                              ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: TextField(
                                style: TextStyle(
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.normal,
                                  color: darkblue,
                                  fontFamily: "Nunito"
                                ),
                                obscureText: true,
                                decoration: InputDecoration(
                                border: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.normal,
                                  color: darkblue,
                                  fontFamily: "Nunito"
                                )
                              ),
                              ),
                            ),
                            SizedBox(height: 100.h),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: darkblue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    //MaterialPageRoute(builder: (context) => Demo1()),
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            HomePage()),
                                  );
                                },
                                child: customText(context, 40.sp, FontWeight.bold, Colors.white, "Login"),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ),
            ],
          )),
    );
  }

  Widget createCircle(BuildContext context, Color color, double radius1, double radius2,
      opacity1, opacity2) {
    return Container(
        width: radius1.w,
        height: radius1.h,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: color.withOpacity(opacity1)),
        child: Center(
          child: Container(
            width: radius2.w,
            height: radius2.h,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: color.withOpacity(opacity2)),
          ),
        ));
  }
}
