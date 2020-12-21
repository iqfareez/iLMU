import 'package:skooled/models/video.dart';

class Course {
  final String title;
  final String brief;
  final String desc;
  final String image;
  final String author;
  final List<Video> videos;

  Course(
      {this.title,
      this.brief,
      this.desc,
      this.image,
      this.author,
      this.videos});

  factory Course.fromMap(Map<String, dynamic> map) {
    var list = map['videos'] as List;
    List<Video> videosList = list.map((i) => Video.fromMap(i)).toList();

    return Course(
        title: map['title'],
        brief: map['brief'],
        desc: map['desc'],
        image: map['image'],
        author: map['author'],
        videos: videosList);
  }
}
