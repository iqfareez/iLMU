class Video {
  final String title;
  final String durationMin;
  final String level;
  final String video;
  final String thumbnail;
  bool isPlaying = false;

  Video({this.title, this.durationMin, this.level, this.video, this.thumbnail, this.isPlaying});

  factory Video.fromMap(Map<String, dynamic> map) {
    return Video(
      title: map['title'],
      durationMin: map['duration'],
      level: map['level'],
      video: map['video'],
      thumbnail: map['thumbnail']
    );
  }

  void setIsPlaying(bool playStatus) {
    isPlaying = playStatus;
  }
}