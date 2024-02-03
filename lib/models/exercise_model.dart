import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExerciseParent {
  Image thumbnail;
  String title;
  String description;
  List<ExerciseModel> exerciseList;
  ExerciseParent(
      {required this.thumbnail,
      required this.title,
      required this.description,
      required this.exerciseList});
}

class ExerciseModel {
  Widget image;
  String time;
  String title;
  ExerciseModel({required this.image, required this.time, required this.title});
}
