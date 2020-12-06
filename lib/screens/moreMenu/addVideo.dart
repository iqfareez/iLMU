import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skooled/models/course.dart';
import 'package:skooled/screens/moreMenu/addVideoCard.dart';
import 'package:skooled/utilities/global.dart';

class AddVideo extends StatefulWidget {
  final List<Course> courses;
  AddVideo({this.courses});

  @override
  _AddVideoState createState() => _AddVideoState();
}

class _AddVideoState extends State<AddVideo> {
  List<Widget> addVideoCards = [];
  List<AddVideoCard> _list = [];
  File _video;
  final picker = ImagePicker();
  bool _isSelected = false;
  List<TableRow> tableRows = [

  ];

  Future getVideo() async {
    final pickedFile = await picker.getVideo(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _video = File(pickedFile.path);
        _isSelected = true;
      } else {
        print('No video selected.');
        _isSelected = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, allowFontScaling: true);
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16/9,
              child: Container(
                color: Colors.amber,
                child: Center(
                  child: Container(
                    child: Icon(Icons.add_a_photo_rounded, size: 0.2.sw),
                  ),
                ),
              ),
            ),
            Container(
              height: 1.sh,
              padding: EdgeInsets.all(0.05.sw),
              //color: Colors.red[200],
              child: Column(
                children: [
                  Container(
                    height: 200.h,
                    color: Colors.green,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: customText(context, 40.sp, FontWeight.bold, darkblue, "Course Title")
                        ),
                        Expanded(
                          flex: 3,
                          child: customTextField(context, "", false)
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 200.h,
                    color: Colors.green,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: customText(context, 40.sp, FontWeight.bold, darkblue, "Course Desc")
                        ),
                        Expanded(
                          flex: 3,
                          child: customTextField(context, "", false)
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 200.h,
                    color: Colors.green,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: customText(context, 40.sp, FontWeight.bold, darkblue, "Add Video")
                        ),
                        Expanded(
                          flex: 3,
                          child: InkWell(
                            child: Icon(Icons.add_a_photo_rounded),
                            onTap: () {

                            },
                          )
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: addVideoCards.length,
                  itemBuilder: (context, i) {
                  return Container();
                }),
              ),
            )
          ],
        ),
      ),
    );
  }

  addVideo(context, bool isSelected) {
    List<AddVideoCard> list = [];
    if (isSelected) {
      
      //list.add();
    }
    
  }

  Widget customTextField(context, String hint, bool obscure) {
    return Container(
      padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
      
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
      child: Container(
        child: TextField(
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
