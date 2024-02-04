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
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            // Background Image
            Image.asset(
              "assets/images/ui-3.png",
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
            ),

            Image.asset(
              "assets/images/ui-4.png",
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
            ),

            // Title
            Positioned(
              top: MediaQuery.of(context).size.height * 0.15,
              left: 0,
              right: 0,
              child: const Text(
                "An exercise a Day, fades laziness away",
                style: TextStyle(
                  color: AppColors.secondaryTextColor,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.1,
              left: 0,
              right: 0,
              child: const Text(
                "Select a perfect Plan",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.primaryTextColor,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            // Subtitle
            Positioned.fill(
              top: MediaQuery.of(context).size.height * 0.20,
              child: GridView.builder(
                itemCount: ExerciseViewModel().categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  final category = ExerciseViewModel().categories[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExerciseDescriptionPage(
                            category: category,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: const Color(0xffF7E4D2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          SvgPicture.asset(
                            category.thumbnail,
                          ),
                          Positioned(
                            bottom: 0,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                category.title,
                                style: const TextStyle(
                                  color: AppColors.secondaryTextColor,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Grid View
          ],
        ),
      ),
    );
  }
}
