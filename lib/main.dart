import 'package:flutter/material.dart';
import 'package:zenminds/providers/selection.dart';
import 'package:zenminds/viewmodel/music_view_model.dart';
import 'package:zenminds/views/components/bottom_nav_bar.dart';
import 'package:zenminds/views/pages/exercise/exercise.dart';
import 'package:zenminds/views/pages/music/music_list_page.dart';
import 'package:zenminds/views/pages/home/home.dart';
import 'package:provider/provider.dart';
import 'package:zenminds/views/pages/music/player_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    HomePage(),
    MusicListPage(),
    ExercisePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AllMusicViewModel()),
        ChangeNotifierProvider(create: (context) => SelectionIndex()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ZenMinds- A Mindfulness App',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: SafeArea(
          child: Scaffold(
            bottomNavigationBar: BottomNavBar(
              selectedIndex: _selectedIndex,
              onItemTapped: _onItemTapped,
            ),
            body: _screens[_selectedIndex],
            // body: PlayerPage(),
          ),
        ),
      ),
    );
  }
}
