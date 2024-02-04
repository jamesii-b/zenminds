import 'package:flutter/material.dart';
import 'package:zenminds/const/colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  final int selectedIndex;
  final Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.primaryBackground,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.music_note_sharp),
          label: "Music",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.sports_martial_arts_rounded),
          label: "Exercise",
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.grey,
      onTap: onItemTapped,
    );
  }
}
