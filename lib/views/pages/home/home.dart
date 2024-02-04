import 'package:flutter/material.dart';
import 'package:zenminds/const/colors.dart';
import 'package:zenminds/views/pages/exercise/exercise_list_page.dart';
import 'package:zenminds/views/pages/music/music_list_page.dart';

class ScrollCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onTap;

  const ScrollCard({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.4, // Constrain width here
        height:
            MediaQuery.of(context).size.height * 0.3, // Constrain height here
        child: GestureDetector(
          onTap: () => onTap(),
          child: Card(
            color: Color.fromARGB(255, 65, 73, 96),
            child: ListTile(
              title: Text(
                title,
                style: TextStyle(color: AppColors.primaryTextColor),
              ),
              subtitle: Text(
                subtitle,
                style: TextStyle(color: AppColors.secondaryTextColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String _greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Good morning!';
  } else if (hour < 17) {
    return 'Good afternoon!';
  } else {
    return 'Good evening!';
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                "assets/images/logo.png",
                width: MediaQuery.of(context).size.width * 0.4,
              ),
              Text(
                _greeting(),
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryTextColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Get Started: ",
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.primaryTextColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height *
                0.25, // Constrain height here
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3, // Number of scrollable cards
              itemBuilder: (context, index) {
                if (index == 0) {
                  return ScrollCard(
                    title: 'Music',
                    subtitle: 'Listen to music',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MusicListPage()),
                      );
                    },
                  );
                } else if (index == 1) {
                  return ScrollCard(
                    title: 'Exercise',
                    subtitle: 'Do some exercise',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ExerciseListPage()),
                      );
                    },
                  );
                } else {
                  return ScrollCard(
                    title: 'Stretch 💪',
                    subtitle: 'Stretch and relax your muscles',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ExerciseListPage()),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
