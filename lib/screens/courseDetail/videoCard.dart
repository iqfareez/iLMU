import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skooled/models/video.dart';
import 'package:skooled/utilities/global.dart';

class VideoCard extends StatefulWidget {
  final Video video;
  final int index;
  final double listTileHeight;
  final double leadingSize;

  VideoCard(this.video, this.index, this.listTileHeight, this.leadingSize);

  @override
  _VideoCardState createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  var _isSelected = false;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, allowFontScaling: false);
    return Container(
      padding: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw, top: 10.h, bottom: 10.h),
      height: this.widget.listTileHeight,
      child: Row(
        children: [
          Container(
            height: this.widget.leadingSize,
            width: this.widget.leadingSize,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(this.widget.video.thumbnail, fit: BoxFit.cover),
            ),
          ),
          Expanded(
            child: Container(
              //height: double.infinity,
              child: Column(
                children: [
                  customText(context, 20, FontWeight.bold, darkblue, this.widget.video.title),
                  Container(
                    height: 30.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Container(
                              color: Colors.green,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.access_time_rounded, size: 20, color: darkblue.withOpacity(0.5)),
                                    customText(context, 40.sp, FontWeight.normal, darkblue.withOpacity(0.5),
                                        this.widget.video.durationMin + " min"),
                                  ],
                                ))),
                        Expanded(
                            child: Container(
                                child: customText(context, 40.sp, FontWeight.normal, darkblue.withOpacity(0.5),
                                    this.widget.video.level))),
                        //customText(context, 20, FontWeight.bold, darkblue, this.video.level)
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
          Expanded(child: Container())
        ],
      ),
    );
  }
}
