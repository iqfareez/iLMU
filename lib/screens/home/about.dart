import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skooled/utilities/fadeInUI.dart';
import 'package:skooled/utilities/global.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, allowFontScaling: false);
    double illust2size = 500;
    return Container(
      //color: Colors.pink,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(right: 0.05.sw),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: illust2size * 0.7860.w,
                  height: illust2size.h,
                  child: Stack(
                    children: [
                      Positioned(
                          left: illust2size * -0.214.w,
                          child: FadeIn(
                              fadeDuration,
                              delayBase + (delayIncrement * 1),
                              "x",
                              0,
                              createCircle(context, illust2size,
                                  illust2size * 0.7719, 0.6, 0.4))),
                      Positioned(
                          left: illust2size * 0.03158.w,
                          top: illust2size * 0.08772.h,
                          child: FadeIn(
                              fadeDuration,
                              delayBase + (delayIncrement * 1),
                              "x",
                              -illust2size,
                              Image.asset("assets/images/illust2.png",
                                  width: illust2size * 0.593.w)))
                    ],
                  ),
                ),
                SizedBox(width: 50.w),
                Expanded(
                  child: FadeIn(
                      fadeDuration,
                      delayBase + (delayIncrement * 1),
                      "x",
                      -illust2size,
                      Container(
                        padding: EdgeInsets.only(bottom: 82.h),
                        child: Wrap(
                          children: <Widget>[
                            customText(context, 120.sp, FontWeight.bold,
                                darkblue, "Tentang Kami"),
                          ],
                        ),
                      ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 146.h,
              padding: EdgeInsets.only(top: 0.03.sw, left: 0.05.sw, right: 0.05.sw),
              child: FadeIn(
                  fadeDuration,
                  delayBase + (delayIncrement * 2),
                  "x",
                  -illust2size,
                  customText(context, 45.sp, FontWeight.normal, darkblue,
                      "iLMU.com merupakan sebuah platform online yang mampu membantu anda dalam mempelajari sesuatu ilmu dan kemahiran dengan menonton video yang telah disediakan oleh tenaga pelajar yang berpengalaman.")),
            ),
          )
        ],
      ),
    );
  }

  Widget createCircle(BuildContext context, double radius1, double radius2,
      opacity1, opacity2) {
    return Container(
        width: radius1.w,
        height: radius1.h,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: darkblue.withOpacity(opacity1)),
        child: Center(
          child: Container(
            width: radius2.w,
            height: radius2.h,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: darkblue.withOpacity(opacity2)),
          ),
        ));
  }
}
