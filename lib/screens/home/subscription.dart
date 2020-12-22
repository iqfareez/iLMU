import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skooled/utilities/fadeInUI.dart';
import 'package:skooled/utilities/global.dart';

class SubcriptionPlans extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, allowFontScaling: false);
    double illust3size = 500;
    return Container(
      //color: Colors.green,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: FadeIn(
                      fadeDuration,
                      delayBase + (delayIncrement * 3),
                      "x",
                      illust3size,
                      Container(
                        padding: EdgeInsets.only(left: 0.05.sw, bottom: 82.h),
                        child: Wrap(
                          children: [
                            customText(context, 90.sp, FontWeight.bold,
                                darkblue, "Pelan Langganan")
                          ],
                        ),
                      )),
                ),
                Container(
                    width: illust3size * 0.98936.w,
                    height: illust3size.h,
                    child: Stack(
                      children: [
                        Positioned(
                            right: illust3size * -0.10106.w,
                            child: FadeIn(
                                fadeDuration,
                                delayBase + (delayIncrement * 3),
                                "x",
                                0,
                                createCircle(context, illust3size,
                                    illust3size * 0.766, 0.6, 0.4))),
                        Positioned(
                            bottom: 0,
                            child: FadeIn(
                                fadeDuration,
                                delayBase + (delayIncrement * 3),
                                "x",
                                illust3size,
                                Image.asset("assets/images/illust3.png",
                                    width: illust3size * 0.93617.w)))
                      ],
                    ))
              ],
            ),
          ),
          Expanded(
            child: FadeIn(
                fadeDuration,
                delayBase + (delayIncrement * 5),
                "y",
                illust3size * 0.5,
                Container(
                  // color: Colors.cyan,
                  padding: EdgeInsets.only(
                      top: 0.05.sw, left: 0.05.sw, right: 0.05.sw),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        createPlanCard(context, Color(0xffA1A6B1), 10,
                            '(Video sahaja)', "PERAK", 0.25),
                        SizedBox(
                          width: 16,
                        ),
                        createPlanCard(
                            context,
                            Color(0xff4C556B),
                            25,
                            '(Video + 3 soalan + 1 permintaan video)',
                            "EMAS",
                            0.4),
                        SizedBox(
                          width: 16,
                        ),
                        createPlanCard(
                            context,
                            Color(0xff4242424),
                            32,
                            '(Video + soalan tanpa had + 2 permintaan video)',
                            "BERLIAN",
                            0.4)
                      ],
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }

  Widget createPlanCard(BuildContext context, Color bg, int cost, String desc,
      String plan, double circleBorderOpacity) {
    double planCardWidth = 0.4.sw;
    double overflowSize = 500;

    return Container(
      width: planCardWidth,
      height: planCardWidth * 1.35,
      // color: Colors.pink,
      child: Stack(
        children: [
          Container(
              height: planCardWidth * 1.2,
              width: double.infinity,
              padding: EdgeInsets.only(top: planCardWidth * 1.2938.h * 0.05),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: bg,
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: -50,
                    bottom: planCardWidth * -0.65,
                    child: Container(
                      height: overflowSize.h,
                      width: overflowSize.w,
                      child: ClipRRect(
                        clipBehavior: Clip.hardEdge,
                        child: OverflowBox(
                          maxHeight: overflowSize.h,
                          maxWidth: overflowSize.w,
                          child: createCircleBorder(
                              context,
                              overflowSize,
                              overflowSize * 0.2,
                              planCardWidth * 0.13,
                              planCardWidth * 0.08,
                              darkblue,
                              circleBorderOpacity),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        customText(context, 60.sp, FontWeight.bold,
                            Colors.white, plan),
                        SizedBox(),
                        Container(
                          //padding: EdgeInsets.only(right: cost.toString().length.toDouble()*10.w),
                          //color: Colors.blue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //customText(context, 14, FontWeight.bold, Colors.white, "RM"),
                              Center(
                                child: customText(
                                  context,
                                  80.sp,
                                  FontWeight.bold,
                                  Colors.white,
                                  "RM " + cost.toString(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            desc,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Nunito',
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: planCardWidth * 1.2938.h * 0.1)
                      ],
                    ),
                  ),
                ],
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: planCardWidth * 0.3,
                width: planCardWidth * 0.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(planCardWidth * 0.3),
                    boxShadow: [
                      BoxShadow(
                        color: yellow.withOpacity(0.5),
                        blurRadius: 5.w,
                      )
                    ]),
                child: Container(
                  decoration: BoxDecoration(
                      color: yellow,
                      borderRadius: BorderRadius.circular(planCardWidth * 0.3)),
                  child: InkWell(
                    child: Icon(Icons.arrow_forward_ios_rounded,
                        color: Colors.white, size: 50.h),
                    onTap: null,
                  ),
                )),
          )
        ],
      ),
    );
  }

  Widget createCircleBorder(
      BuildContext context,
      double radius1,
      double radius2,
      double border1,
      double border2,
      Color bg,
      double opacity) {
    return Container(
      width: radius1,
      height: radius1,
      decoration: BoxDecoration(
        //color: Colors.pink,
        shape: BoxShape.circle,
        border:
            Border.all(width: border1, color: darkblue.withOpacity(opacity)),
      ),
      child: Center(
        child: Container(
          width: radius2,
          height: radius2,
          decoration: BoxDecoration(
            //color: Colors.cyan,
            shape: BoxShape.circle,
            border: Border.all(
                width: border2, color: darkblue.withOpacity(opacity)),
            //borderRadius: BorderRadius.circular(24)
          ),
        ),
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
