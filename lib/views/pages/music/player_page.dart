import 'package:flutter/material.dart';
import 'package:zenminds/const/colors.dart';
import 'package:zenminds/models/music_model.dart';
import 'package:zenminds/views/pages/music/screens/audio_player_screen.dart';

class PlayerPage extends StatelessWidget {
  final SongItemModel song;

  const PlayerPage({Key? key, required this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: AppColors.primaryBackground,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: IconButton(
                        icon: const Icon(Icons.close,
                            size: 40, color: AppColors.primaryTextColor),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Image.asset(
                        "assets/images/ui-1.png",
                        height: MediaQuery.of(context).size.height * 0.4,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        "assets/images/ui-2.png",
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: MediaQuery.of(context).size.height * 0.25,
                      child: Center(
                        child: Image.asset(
                          song.curvedimage,
                          width: MediaQuery.of(context).size.width * 0.6,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      bottom: MediaQuery.of(context).size.height * 0.15,
                      right: 0,
                      child: AudioPlayerScreen(audioPath: song.audiourl),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
