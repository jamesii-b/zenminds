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

  ExerciseParent stretching_core = ExerciseParent(
      thumbnail: "assets/images/stretching-core/thumbnail.svg",
      title: "Stretching-Core",
      description: "Stretch your every porrtion of the body",
      exerciseList: [
        ExerciseModel(
            image: "assets/images/stretching-core/1.svg",
            timeInSec: 10,
            title: "Stretching-Core 1"),
        ExerciseModel(
            image: "assets/images/stretching-core/2.svg",
            timeInSec: 11,
            title: "Stretching-Core 2"),
        ExerciseModel(
            image: "assets/images/stretching-core/3.svg",
            timeInSec: 12,
            title: "Stretching-Core 3"),
        ExerciseModel(
            image: "assets/images/stretching-core/4.svg",
            timeInSec: 13,
            title: "Stretching-Core 4"),
        ExerciseModel(
            image: "assets/images/stretching-core/5.svg",
            timeInSec: 14,
            title: "Stretching-Core 5"),
        ExerciseModel(
            image: "assets/images/stretching-core/6.svg",
            timeInSec: 15,
            title: "Stretching-Core 6"),
        ExerciseModel(
            image: "assets/images/stretching-core/7.svg",
            timeInSec: 16,
            title: "Stretching-Core 7"),
        ExerciseModel(
            image: "assets/images/stretching-core/8.svg",
            timeInSec: 17,
            title: "Stretching-Core 8"),
        ExerciseModel(
            image: "assets/images/stretching-core/9.svg",
            timeInSec: 18,
            title: "Stretching-Core 9"),
        ExerciseModel(
            image: "assets/images/stretching-core/10.svg",
            timeInSec: 19,
            title: "Stretching-Core 10"),
        ExerciseModel(
            image: "assets/images/stretching-core/11.svg",
            timeInSec: 20,
            title: "Stretching-Core 11"),
        ExerciseModel(
            image: "assets/images/stretching-core/12.svg",
            timeInSec: 21,
            title: "Stretching-Core 12"),
        ExerciseModel(
            image: "assets/images/stretching-core/12.svg",
            timeInSec: 21,
            title: "Stretching-Core 12"),
        ExerciseModel(
            image: "assets/images/stretching-core/13.svg",
            timeInSec: 22,
            title: "Stretching-Core 13"),
        ExerciseModel(
            image: "assets/images/stretching-core/14.svg",
            timeInSec: 23,
            title: "Stretching-Core 14"),
        ExerciseModel(
            image: "assets/images/stretching-core/15.svg",
            timeInSec: 24,
            title: "Stretching-Core 15"),
        ExerciseModel(
            image: "assets/images/stretching-core/16.svg",
            timeInSec: 25,
            title: "Stretching-Core 16"),
        ExerciseModel(
            image: "assets/images/stretching-core/17.svg",
            timeInSec: 26,
            title: "Stretching-Core 17"),
        ExerciseModel(
            image: "assets/images/stretching-core/18.svg",
            timeInSec: 27,
            title: "Stretching-Core 18"),
        ExerciseModel(
            image: "assets/images/stretching-core/19.svg",
            timeInSec: 28,
            title: "Stretching-Core 19"),
        ExerciseModel(
            image: "assets/images/stretching-core/20.svg",
            timeInSec: 29,
            title: "Stretching-Core 20"),
        ExerciseModel(
            image: "assets/images/stretching-core/21.svg",
            timeInSec: 30,
            title: "Stretching-Core 21"),
      ]);

  get yogaBasic => yoga_basic;
  get yogaAdvance => yoga_advance;
  get stretchingCore => stretching_core;
  late List<ExerciseParent> categories = [yoga_basic, yoga_advance,stretching_core];
}
