import 'package:flutter/material.dart';
import 'package:zenminds/const/colors.dart';
import 'package:zenminds/models/exercise_model.dart';
import 'package:zenminds/views/pages/exercise/screens/exercise_page.dart';

class ExerciseDescriptionPage extends StatelessWidget {
  final ExerciseParent category;
  const ExerciseDescriptionPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        category.thumbnail,
        Text(category.title),
        Text(category.description),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExercisePage(
                    exercise: category.exerciseList[0],
                  ),
                ),
              );
            },
            child: Text("let`s start"),
            backgroundColor: AppColors.boxColor,
            foregroundColor: AppColors.secondaryTextColor,
          ),
        )
      ],
    ));
  }
}
