import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skooled/utilities/fadeInUI.dart';
import 'package:skooled/utilities/global.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, allowFontScaling: false);
    double headerHeight = 0.4.sh;
    double illust1Size = 500;

    return Container(
        //color: Colors.pink,
        height: headerHeight,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FadeIn(fadeDuration, delayBase, "x", illust1Size, 
                  Container(
                    //color: Colors.yellow,
                    padding: EdgeInsets.only(left: 0.05.sw),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText(
                            context, 60.sp, FontWeight.bold, darkblue, "Marilah Terokai"),
                        customText(context, 90.sp, FontWeight.bold, darkblue, "Minat Anda")
                      ],
                    )),
                ),
                Container(
                  height: illust1Size.h,
                  // color: Colors.green,
                  child: Stack(
                    children: [
                      Positioned(
                        right: -67.w,
                        child: FadeIn(fadeDuration, delayBase, "x", 0, 
                          createCircle(context, illust1Size, illust1Size*0.77, 0.6, 0.4),
                        ),
                      ),
                      FadeIn(fadeDuration, delayBase, "x", illust1Size*0.6, 
                        Center(
                          child: Image.asset("assets/images/illust1.png",
                              width: illust1Size*0.9368.w))
                      )
                    ],
                  ),
                )
              ],
            ),
            Align(
              child: searchBar(context, 0.05.sh),
              alignment: Alignment.bottomCenter,
            )
          ],
        ));
  }

  Widget createCircle(
      BuildContext context, double radius1, double radius2, opacity1, opacity2) {
    
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

  Widget searchBar(BuildContext context, double height) {
    return Padding(
      padding: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw),
      child: Container(
        padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: darkblue.withOpacity(0.5),
              blurRadius: 6.w,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
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
                    hintText: "Apa yang ingin anda pelajari?",
                    hintStyle: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.normal,
                      color: darkblue,
                      fontFamily: "Nunito"
                    )
                  ),
                )
                // customText(context, 32.sp, FontWeight.normal, darkblue,
                //     "What would you like to learn?"),
              ),
            ),
            InkWell(
              child: Icon(Icons.search_rounded),
              onTap: () {
                //print("search clicked");
              },
            )
          ],
        ),
      ),
    );
  }
}
