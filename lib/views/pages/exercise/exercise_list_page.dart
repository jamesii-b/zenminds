import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zenminds/const/colors.dart';
import 'package:zenminds/viewmodel/exercise_view_model.dart';
import 'package:zenminds/views/pages/exercise/screens/exercise_description_page.dart';

class ExerciseListPage extends StatelessWidget {
  const ExerciseListPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBackground,
        title: const Text(''),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExerciseDescriptionPage(
                category: ExerciseViewModel().yogaBasic,
              ),
            ),
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
            color: Color(0xffF7E4D2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    ExerciseViewModel().yogaBasic.title,
                    style: const TextStyle(
                        color: AppColors.secondaryTextColor, fontSize: 20),
                  ),
                ),
              ),
              SvgPicture.asset(
                ExerciseViewModel().yogaBasic.thumbnail,
              )
              // Text(ExerciseViewModel().yogaBasic.description),
            ],
          ),
        ),
      ),
    );
  }
}
