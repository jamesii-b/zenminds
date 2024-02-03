import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:zenminds/const/colors.dart';
import 'package:zenminds/models/others.dart';

class AudioPlayerScreen extends StatefulWidget {
  String audioPath;
  AudioPlayerScreen({super.key, required this.audioPath});

  @override
  State<AudioPlayerScreen> createState() => AudioPlayerScreenState();
}

class AudioPlayerScreenState extends State<AudioPlayerScreen> {
  late AudioPlayer _player;
  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration?, Duration, PositionData>(
        _player.positionStream,
        _player.durationStream,
        _player.bufferedPositionStream,
        (position, duration, bufferedPosition) =>
            PositionData(position, duration!, bufferedPosition),
      );

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer()..setAsset(widget.audioPath);
  }

  @override
  void dispose() {
    super.dispose();
    _player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
              onTap: () =>
                  _player.seek(_player.position - const Duration(seconds: 15)),
              child: Image.asset("assets/images/backward-15.png",
                  width: 70, height: 70)),
          StreamBuilder(
            stream: _player.playerStateStream,
            builder: (context, snapshot) {
              final playerState = snapshot.data;
              final processingState = playerState?.processingState;
              if (playerState?.playing == true) {
                return GestureDetector(
                  onTap: () => _player.pause(),
                  child: Image.asset(
                    "assets/images/pause.png",
                    width: 70,
                  ),
                );
              } else if (playerState?.playing == false) {
                return GestureDetector(
                  onTap: () => _player.play(),
                  child: Image.asset(
                    "assets/images/play.png",
                    width: 70,
                  ),
                );
              }
              return GestureDetector(
                onTap: () => _player.play(),
                child: Image.asset(
                  "assets/images/play.png",
                  width: 70,
                ),
              );
            },
          ),
          GestureDetector(
              onTap: () =>
                  _player.seek(_player.position + const Duration(seconds: 15)),
              child: Image.asset("assets/images/forward-15.png",
                  width: 70, height: 70)),
        ],
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.05,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: StreamBuilder(
            stream: _positionDataStream,
            builder: (context, snapshot) {
              final positionData = snapshot.data;
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ProgressBar(
                  barHeight: 10,
                  thumbColor: const Color(0xffE6E7F2),
                  timeLabelTextStyle:
                      const TextStyle(color: AppColors.secondaryTextColor),
                  progress: positionData?.position ?? Duration.zero,
                  total: positionData?.duration ?? Duration.zero,
                  onSeek: _player.seek,
                ),
              );
            }),
      ),
    ]);
  }
}
