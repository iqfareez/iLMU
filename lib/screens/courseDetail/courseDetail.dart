import 'package:chewie/chewie.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skooled/models/course.dart';
import 'package:skooled/models/video.dart';
import 'package:skooled/utilities/global.dart';
import 'package:video_player/video_player.dart';

//import 'dart:io' show Platform;

class CourseDetail extends StatefulWidget {
  final Course course;
  CourseDetail(this.course);

  @override
  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  //TargetPlatform _platform;
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;
  int totalDuration = 0;
  int selectedIndex = 0;
  final listViewController = ScrollController();
  final listViewController2 = ScrollController();
  var isPlaying = false;
  var controllerPlaying = false;

  List<Video> videos = [];

  @override
  void initState() {
    super.initState();
    initVideos();
    this.initializePlayer(setSelectedIndex(0));
  }

  getTotalVideosDuration() {
    int dura = 0;
    print(widget.course.videos.length);
    for (var i = 0; i < widget.course.videos.length; i++) {
      dura += int.parse(widget.course.videos[i].durationMin);
    }
    setState(() {
      totalDuration = dura;
    });
  }

  initVideos() {
    setState(() {
      videos = this.widget.course.videos;
    });
  }

  setSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
    return selectedIndex;
  }

  Future<void> initializePlayer(int index) async {
    _videoPlayerController = VideoPlayerController.asset(this.videos[index].video);
    await _videoPlayerController.initialize().then((value) {
      _videoPlayerController.addListener(() {
        setState(() {
          if (_videoPlayerController.value.isPlaying) {
            controllerPlaying = true;
          } else {
            controllerPlaying = false;
          }
        });
      });
    });
    _chewieController = ChewieController(
      allowFullScreen: true,
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ],
      deviceOrientationsOnEnterFullScreen: [
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ],
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: false,
      materialProgressColors: ChewieProgressColors(
        playedColor: darkblue,
        handleColor: darkblue,
        bufferedColor: darkblue.withOpacity(0.2),
      ),
    );
    _chewieController.addListener(() {
      if (!_chewieController.isFullScreen) 
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context,designSize: Size(750, 1334), allowFontScaling: false);
    ScreenUtil.init(context);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              child: _chewieController != null &&
                      _chewieController.videoPlayerController.value.initialized
                  ? Stack(
                      children: [
                        AspectRatio(
                            aspectRatio: _chewieController
                                .videoPlayerController.value.aspectRatio,
                            child: Chewie(
                              controller: _chewieController,
                            )),
                      ],
                    )
                  : Container(
                      color: Colors.white,
                      child: AspectRatio(
                        aspectRatio: 16.0 / 9.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              backgroundColor: darkblue,
                            ),
                            SizedBox(height: 20),
                            customText(context, 60.sp, FontWeight.bold, darkblue, "Loading..."),
                          ],
                        ),
                      ),
                    ),
            ),
            Container(
              height: 500.h,
              padding: EdgeInsets.only(
                  left: 0.05.sw, right: 0.05.sw, top: 20.h, bottom: 10.h),
              child: FadingEdgeScrollView.fromScrollView(
                gradientFractionOnStart: 0.2,
                gradientFractionOnEnd: 0.2,
                child: ListView(
                  controller: listViewController,
                  padding: EdgeInsets.zero,
                  children: [
                    Container(
                      height: 150.h,
                      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: customText(context, 60.sp, FontWeight.bold, darkblue, widget.course.title)
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customText(context, 40.sp, FontWeight.normal,
                                      darkblue.withOpacity(0.5), "Duration"),
                                  customText(context, 40.sp, FontWeight.bold, darkblue,
                                      totalDuration.toString() + " Min"),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                      child: customText(context, 40.sp, FontWeight.normal, darkblue,
                          //this.widget.course.desc
                          "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 10.h, 
              //color: Colors.red
            ),
            Container(
              width: 0.9.sw,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(width: 2, color: darkblue.withOpacity(0.5)),
                boxShadow: [
                  BoxShadow(
                    color: darkblue.withOpacity(0.5),
                    blurRadius: 5.w,
                    offset: Offset(0, 3)
                  )
                ]
              ),
            ),
            SizedBox(height: 50.h),
            Expanded(
              child: Container(
                //color: Colors.blue,
                child: FadingEdgeScrollView.fromScrollView(
                  gradientFractionOnStart: 0.2,
                  gradientFractionOnEnd: 0.2,
                  child: ListView.builder(
                    controller: listViewController2,
                    padding: EdgeInsets.zero,
                    itemCount: widget.course.videos.length,
                    itemBuilder: (BuildContext context, i) {
                      Video video = widget.course.videos[i];
                      if (selectedIndex == i) {
                        video.setIsPlaying(isPlaying);
                      }
                      return ListTile(
                        contentPadding: EdgeInsets.only(left: 0.06.sw, right: 0.06.sw, top: 10.h, bottom: 10.h),
                        leading: Container(
                          height: 180.h,
                          width: 180.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(video.thumbnail, fit: BoxFit.cover),
                          ),
                        ),
                        title:
                            customText(context, 40.sp, FontWeight.bold, darkblue, video.title),
                        subtitle: Container(
                          height: 40.h,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Container(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.access_time_rounded, size: 40.h, color: darkblue.withOpacity(0.5)),
                                          customText(context, 40.sp, FontWeight.normal, darkblue.withOpacity(0.5),
                                              video.durationMin + " min"),
                                        ],
                                      ))),
                              Expanded(
                                  child: Container(
                                      child: customText(context, 40.sp, FontWeight.normal, darkblue.withOpacity(0.5),
                                          video.level))),
                            ],
                          ),
                        ),
                        trailing: InkWell(
                          child: selectedIndex != i?
                          Icon(Icons.play_arrow_rounded,
                            size: 100.h, 
                            color: darkblue.withOpacity(0.5)
                          )
                          : controllerPlaying?
                          Icon(
                            Icons.pause_rounded, 
                            size: 100.h, 
                            color: darkblue
                          )
                          : Icon(
                            Icons.play_arrow_rounded, 
                            size: 100.h, 
                            color: darkblue
                          ),
                          onTap: () {
                            if (selectedIndex == i) {
                              if (_chewieController.videoPlayerController.value.isPlaying) {
                                _videoPlayerController.pause();
                              } else {
                                _videoPlayerController.play();
                              }
                              setSelectedIndex(i);
                            } else {
                              setState(() {
                                initializePlayer(setSelectedIndex(i));
                              });
                            }
                          },
                        ),
                      );
                    }
                  ),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }
}
