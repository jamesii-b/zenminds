
class ExerciseParent {
  String thumbnail;
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
  String image;
  int timeInSec;
  String title;
  ExerciseModel(
      {required this.image, required this.timeInSec, required this.title});
}
