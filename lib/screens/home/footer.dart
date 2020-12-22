import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skooled/utilities/global.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      child: Stack(
        children: [
          Positioned(
            left: -0.15.sw,
            bottom: -300.w,
            child: Container(
              height: 1.sw,
              width: 1.sw,
              child: OverflowBox(
                maxHeight: 2.sw,
                maxWidth: 2.sw,
                child: createCircle(context, 1.8.sw, 1.5.sw, 0.8, 1.0),
              ),
            ),
          ),
          Container(
            height: 1.sh,
            width: 1.sh,
            //color: Colors.amber.withOpacity(0.4),
            padding:
                EdgeInsets.only(left: 0.05.sw, right: 0.05.sw, top: 0.4.sw),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText(context, 60.sp, FontWeight.bold,
                            Colors.white, "INGIN MENIMBA ILMU?"),
                        customText(context, 60.sp, FontWeight.bold,
                            Colors.white, "SERTAI KAMI SEKARANG!"),
                        Container(
                          height: 100.h,
                          decoration: BoxDecoration(
                              color: darkblue,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 0.03.sw, right: 0.03.sw),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          bottomLeft: Radius.circular(5))),
                                  child: TextField(
                                    keyboardType: TextInputType.emailAddress,
                                    style: TextStyle(
                                        fontSize: 32.sp,
                                        fontWeight: FontWeight.normal,
                                        color: darkblue,
                                        fontFamily: "Nunito"),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                        hintText: "Email",
                                        hintStyle: TextStyle(
                                            fontSize: 32.sp,
                                            fontWeight: FontWeight.normal,
                                            color: darkblue,
                                            fontFamily: "Nunito")),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: yellow,
                                      border: Border.all(color: darkblue),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(5),
                                          bottomRight: Radius.circular(5))),
                                  child: FlatButton(
                                    onPressed: () {},
                                    child: customText(
                                        context,
                                        60.sp,
                                        FontWeight.bold,
                                        Colors.white,
                                        "Subscribe"),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText(context, 60.sp, FontWeight.bold,
                            Colors.white, "INGIN BERKONGSI ILMU?"),
                        customText(context, 60.sp, FontWeight.bold,
                            Colors.white, "SERTAI KAMI"),
                        customText(context, 40.sp, FontWeight.normal,
                            Colors.white, "Hubungi: 013-4971065"),
                        customText(context, 40.sp, FontWeight.normal,
                            Colors.white, "Email: iLMU@mysite.com"),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container()
        ],
      ),
    );
  }

  Widget createCircle(BuildContext context, double radius1, double radius2,
      opacity1, opacity2) {
    return Container(
        width: radius1,
        height: radius1,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: darkblue.withOpacity(opacity1), blurRadius: 10)
        ], shape: BoxShape.circle, color: Color(0xffA1A6B1)),
        child: Center(
          child: Container(
            width: radius2,
            height: radius2,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: darkblue.withOpacity(opacity2), blurRadius: 20)
                ],
                // shape: BoxShape.circle, color: Color(0xff4C556B)),
                shape: BoxShape.circle,
                color: darkblue),
          ),
        ));
  }
}
