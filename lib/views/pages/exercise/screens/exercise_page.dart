import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zenminds/models/exercise_model.dart';

class ExercisePage extends StatefulWidget {
  final List<ExerciseModel> exercises;
  const ExercisePage({Key? key, required this.exercises}) : super(key: key);

  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  late Timer _timer;
  int _currentExerciseIndex = 0;
  int _secondsRemaining = 0;
  double _percentage = 0.0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _secondsRemaining = widget.exercises[_currentExerciseIndex].timeInSec;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
          _percentage = (_secondsRemaining /
              widget.exercises[_currentExerciseIndex].timeInSec);
        } else {
          _timer.cancel();
          _navigateToNextExercise();
        }
      });
    });
  }

  void _navigateToNextExercise() {
    if (_currentExerciseIndex < widget.exercises.length - 1) {
      setState(() {
        _currentExerciseIndex++;
        _secondsRemaining = widget.exercises[_currentExerciseIndex].timeInSec;
        _percentage = 0.0; // Reset percentage for new exercise
        _startTimer();
      });
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => CompletionPage()));
      // All exercises completed, you can handle this case as per your requirement
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(widget.exercises[_currentExerciseIndex].title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            _showConfirmationDialog();
          },
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * 0.5 -
                  0.25 * MediaQuery.of(context).size.height,
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                widget.exercises[_currentExerciseIndex].image,
                height: MediaQuery.of(context).size.height * 0.25,
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.05,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.9,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: const [
                      Color.fromARGB(255, 50, 113, 208),
                      Color.fromARGB(255, 150, 173, 196),
                    ],
                    stops: [1 - _percentage, _percentage],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Center(
                  child: Text(
                    "${_secondsRemaining}s",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirmation"),
          content: const Text(
            "Are you sure you want to go back? Your progress will be lost.",
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Yes"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class CompletionPage extends StatelessWidget {
  const CompletionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
            child: Text("Congratulations! You have completed all exercises."),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 50, 113, 208),
                Color.fromARGB(255, 150, 173, 196),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          )),
    );
  }
}
