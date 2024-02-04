import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zenminds/models/exercise_model.dart';

class ExercisePage extends StatefulWidget {
  final ExerciseModel exercise;
  final VoidCallback? onNavigateNext;
  const ExercisePage({Key? key, required this.exercise, this.onNavigateNext})
      : super(key: key);

  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  late Timer _timer;
  int _secondsRemaining = 0;
  int initialSeconds = 10;
  double percentage = 0.0;

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
    _secondsRemaining = 10; // Set the desired duration in seconds
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
          percentage = (_secondsRemaining / initialSeconds);
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(widget.exercise.title),
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
                widget.exercise.image,
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
                      Color(0xFF1976D2),
                    ],
                    stops: [1 - percentage, percentage],
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
