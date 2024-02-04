import 'package:flutter/material.dart';
import 'package:zenminds/models/exercise_model.dart';

class ExerciseViewModel extends ChangeNotifier {
  ExerciseParent yoga_basic = ExerciseParent(
      thumbnail: "assets/images/yoga-basic/thumbnail.svg",
      title: "Yoga Basic",
      description: "Yoga Basic for beginners",
      exerciseList: [
        ExerciseModel(
            image: "assets/images/yoga-basic/1.svg",
            timeInSec: 7,
            title: "Yoga Basic 1"),
        ExerciseModel(
            image: "assets/images/yoga-basic/2.svg",
            timeInSec: 1,
            title: "Yoga Basic 2"),
        ExerciseModel(
            image: "assets/images/yoga-basic/3.svg",
            timeInSec: 2,
            title: "Yoga Basic 3"),
        ExerciseModel(
            image: "assets/images/yoga-basic/4.svg",
            timeInSec: 5,
            title: "Yoga Basic 4"),
        ExerciseModel(
            image: "assets/images/yoga-basic/5.svg",
            timeInSec: 3,
            title: "Yoga Basic 5"),
        ExerciseModel(
            image: "assets/images/yoga-basic/6.svg",
            timeInSec: 4,
            title: "Yoga Basic 6"),
        ExerciseModel(
            image: "assets/images/yoga-basic/7.svg",
            timeInSec: 7,
            title: "Yoga Basic 7"),
      ]);

  ExerciseParent yoga_advance = ExerciseParent(
      thumbnail: "assets/images/yoga-advance/thumbnail.svg",
      title: "Yoga Advance",
      description: "Yoga Advance for experts",
      exerciseList: [
        ExerciseModel(
            image: "assets/images/yoga-advance/1.svg",
            timeInSec: 7,
            title: "Yoga Advance 1"),
        ExerciseModel(
            image: "assets/images/yoga-advance/2.svg",
            timeInSec: 1,
            title: "Yoga Advance 2"),
        ExerciseModel(
            image: "assets/images/yoga-advance/3.svg",
            timeInSec: 2,
            title: "Yoga Advance 3"),
        ExerciseModel(
            image: "assets/images/yoga-advance/4.svg",
            timeInSec: 5,
            title: "Yoga Advance 4"),
        ExerciseModel(
            image: "assets/images/yoga-advance/5.svg",
            timeInSec: 3,
            title: "Yoga Advance 5"),
        ExerciseModel(
            image: "assets/images/yoga-advance/6.svg",
            timeInSec: 4,
            title: "Yoga Advance 6"),
        ExerciseModel(
            image: "assets/images/yoga-advance/7.svg",
            timeInSec: 7,
            title: "Yoga Advance 7"),
      ]);

  get yogaBasic => yoga_basic;
  get yogaAdvance => yoga_advance;
  late List<ExerciseParent> categories = [yoga_basic, yoga_advance];
}
