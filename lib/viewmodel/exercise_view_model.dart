import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zenminds/models/exercise_model.dart';

class ExerciseViewModel extends ChangeNotifier {
  ExerciseParent yoga_basic = ExerciseParent(
      thumbnail: Image.asset("asssets/images/yoga-basic/thumbnal"),
      title: "Yoga Basic",
      description: "Yoga Basic for beginners",
      exerciseList: [
        ExerciseModel(
            image: SvgPicture.asset("asssets/images/yoga-basic/1.svg"),
            time: "10 min",
            title: "Yoga Basic 1"),
        ExerciseModel(
            image: SvgPicture.asset("assets/images/yoga-basic/2.svg"),
            time: "1 min",
            title: "Yoga Basic 2"),
        ExerciseModel(
            image: SvgPicture.asset("assets/images/yoga-basic/3.svg"),
            time: "2 min",
            title: "Yoga Basic 3"),
        ExerciseModel(
            image: SvgPicture.asset("assets/images/yoga-basic/4.svg"),
            time: "5 min",
            title: "Yoga Basic 4"),
        ExerciseModel(
            image: SvgPicture.asset("assets/images/yoga-basic/5.svg"),
            time: "3 min",
            title: "Yoga Basic 5"),
        ExerciseModel(
            image: SvgPicture.asset("assets/images/yoga-basic/6.svg"),
            time: "4 min",
            title: "Yoga Basic 6"),
        ExerciseModel(
            image: SvgPicture.asset("assets/images/yoga-basic/7.svg"),
            time: "7 min",
            title: "Yoga Basic 7"),
      ]);

  ExerciseParent yoga_advance = ExerciseParent(
      thumbnail: Image.asset("asssets/images/yoga-advance/thumbnail"),
      title: "Yoga Advance",
      description: "Yoga Advance for experts",
      exerciseList: [
        ExerciseModel(
            image: SvgPicture.asset("asssets/images/yoga-advance/1.svg"),
            time: "10 min",
            title: "Yoga Advance 1"),
        ExerciseModel(
            image: SvgPicture.asset("assets/images/yoga-advance/2.svg"),
            time: "1 min",
            title: "Yoga Advance 2"),
        ExerciseModel(
            image: SvgPicture.asset("assets/images/yoga-advance/3.svg"),
            time: "2 min",
            title: "Yoga Advance 3"),
        ExerciseModel(
            image: SvgPicture.asset("assets/images/yoga-advance/4.svg"),
            time: "5 min",
            title: "Yoga Advance 4"),
        ExerciseModel(
            image: SvgPicture.asset("assets/images/yoga-advance/5.svg"),
            time: "3 min",
            title: "Yoga Advance 5"),
        ExerciseModel(
            image: SvgPicture.asset("assets/images/yoga-advance/6.svg"),
            time: "4 min",
            title: "Yoga Advance 6"),
        ExerciseModel(
            image: SvgPicture.asset("assets/images/yoga-advance/7.svg"),
            time: "7 min",
            title: "Yoga Advance 7"),
      ]);

      get yogaBasic => yoga_basic;
      get yogaAdvance => yoga_advance;
}
