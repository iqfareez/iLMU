import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skooled/utilities/global.dart';

class MoreMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, allowFontScaling: true);
    return Container(
      // color: Colors.amber,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        // Container(
        //   padding: EdgeInsets.all(0.05.sw),
        //   child: customText(context, 100.sp, FontWeight.bold, darkblue, "Settings"),
        // ),
        // ListTile(
        //   contentPadding: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw),
        //   title: customText(context, 50.sp, FontWeight.normal, darkblue, "Import Video"),
        //   trailing: Icon(
        //     Icons.upload_file,
        //     color: darkblue,
        //     size: 60.sp,
        //   ),
        //   onTap: () {
        //     Navigator.push(
        //       context,
        //       //MaterialPageRoute(builder: (context) => Demo1()),
        //       MaterialPageRoute(
        //           builder: (context) =>
        //               AddVideo(courses: this.widget.courses,)),
        //     );
        //   },
        // ),
        ListTile(
          contentPadding: EdgeInsets.all(0.05.sw),
          title: customText(context, 100.sp, FontWeight.bold, darkblue, "Menu"),
          trailing: Icon(
            Icons.logout,
            color: darkblue,
            size: 60.sp,
          ),
          onTap: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        ),
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            padding: EdgeInsets.all(0.05.sw),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText(context, 60.sp, FontWeight.bold, darkblue, "ANDA ADA SOALAN?"),
                Container(
                  //color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: FractionallySizedBox(
                          widthFactor: 0.9,
                          child: customTextField(context, "Nama", 1, TextInputType.name, false)
                        )
                      ),
                      Flexible(
                        flex: 1,
                        child: FractionallySizedBox(
                          widthFactor: 0.9,
                          child: customTextField(context, "Email", 1, TextInputType.emailAddress, false)
                        )
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Flexible(
                    flex: 1,
                    child: FractionallySizedBox(
                      widthFactor: 1,
                      child: customTextField(context, "Subjek", 1, TextInputType.text, false)
                    )
                  ),
                ),
                Expanded(
                  child: Container(
                    child: customTextField(context, "Sila nyatakan soalan anda", 10, TextInputType.multiline, false),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 10.h),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: darkblue,
                              blurRadius: 2,
                              offset: Offset(0, 3)
                            )
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff4C556B)
                        ),
                        child: FlatButton(
                          onPressed: () {

                          },
                          child: customText(context, 50.sp, FontWeight.normal, Colors.white, "Submit"),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ),
        )
      ],),
    );
  }

  Widget customTextField(context, String hint, int maxLines, TextInputType kbType, bool obscure) {
    return Container(
      padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: darkblue.withOpacity(0.5),
            blurRadius: 6.w,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        child: TextField(
          
          keyboardType: kbType,
          maxLines: maxLines,
          obscureText: obscure,
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
            hintText: hint,
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
    );
  }
}