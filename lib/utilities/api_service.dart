import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:skooled/models/course.dart';

class APIService {
  APIService._instantiate();

  static final APIService instance = APIService._instantiate();
  Future<List<Course>> getCourses() async {
    String getJson =
        await rootBundle.loadString('assets/data.json');
    var data = json.decode(getJson);
    List<dynamic> coursesJson = data["items"];
    
    List<Course> courses = [];
    coursesJson.forEach(
      (json) => courses.add(
        Course.fromMap(json),
      ),
    );
    return courses;
  }
}
