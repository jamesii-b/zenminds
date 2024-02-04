import 'package:flutter/material.dart';
import 'package:zenminds/const/colors.dart';
import 'package:zenminds/models/exercise_model.dart';

class ExercisePage extends StatelessWidget {
  final ExerciseModel exercise;
  const ExercisePage({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          exercise.image,
          Text(exercise.title),
          Text(exercise.time),
          FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("back"),
            backgroundColor: AppColors.boxColor,
            foregroundColor: AppColors.secondaryTextColor,
          ),
        ],
      ),
    );
  }
}
