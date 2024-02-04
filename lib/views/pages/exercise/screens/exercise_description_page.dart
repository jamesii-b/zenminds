import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zenminds/const/colors.dart';
import 'package:zenminds/models/exercise_model.dart';
import 'package:zenminds/views/pages/exercise/screens/exercise_page.dart';

class ExerciseDescriptionPage extends StatelessWidget {
  final ExerciseParent category;
  const ExerciseDescriptionPage({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SvgPicture.asset(
            category.thumbnail,
          ),
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
                      exercises: category.exerciseList,
                    ),
                  ),
                );
              },
              child: Text("Let's start"),
              backgroundColor: AppColors.boxColor,
              foregroundColor: AppColors.secondaryTextColor,
            ),
          )
        ],
      ),
    );
  }
}
