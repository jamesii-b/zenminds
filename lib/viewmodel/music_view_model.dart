import 'package:flutter/material.dart';
import 'package:zenminds/models/music_model.dart';

class AllMusicViewModel extends ChangeNotifier {
  final List<SongItemModel> _meditation = [
    SongItemModel(
        name: "Energy & Focus",
        image: "assets/images/img-1.png",
        curvedimage: "assets/images/img-1-0.png",
        description: "Boost your energy and focus with the power of waves.",
        audiourl: "assets/audio/meditation-2.mp3"),
    SongItemModel(
        name: "Power Meditation",
        image: "assets/images/img-2.png",
        curvedimage: "assets/images/img-2-0.png",
        description: "Let your mind relax and focus on the sound of the waves.",
        audiourl: "assets/audio/meditation-3.mp3"),
    SongItemModel(
        name: "Meditation",
        image: "assets/images/img-3.png",
        curvedimage: "assets/images/img-3-0.png",
        description: "Let your mind relax and focus on the sound of the waves.",
        audiourl: "assets/audio/meditation-1.mp3"),
    SongItemModel(
        name: "Yoga",
        image: "assets/images/img-4.png",
        curvedimage: "assets/images/img-4-0.png",
        description:
            "Increase your physical fitness and mental peace with yoga",
        audiourl: "assets/audio/yoga-1.mp3"),
    SongItemModel(
        name: "Yoga-2",
        image: "assets/images/img-5.png",
        curvedimage: "assets/images/img-5-0.png",
        description:
            "Increase your physical fitness and mental peace with yoga",
        audiourl: "assets/audio/yoga-2.mp3"),
  ];

  final List<SongItemModel> _relax = [
    SongItemModel(
        name: "Just Relax",
        image: "assets/images/img-6.png",
        curvedimage: "assets/images/img-6-0.png",
        audiourl: "assets/audio/relax-1.mp3",
        description:
            "Heal your Body with the incredible power of alpha waves."),
    SongItemModel(
        name: "Relax & Heal",
        image: "assets/images/img-1.png",
        curvedimage: "assets/images/img-1-0.png",
        audiourl: "assets/audio/relax-2.mp3",
        description:
            "Fade your all pain while you plug in this powerfull audio."),
  ];

  final List<SongItemModel> _sleep = [
    SongItemModel(
        name: "Sleep",
        image: "assets/images/img-2.png",
        curvedimage: "assets/images/img-2-0.png",
        description: "Delve into a deep sleep with the sound of the waves.",
        audiourl: "assets/audio/relax-1.mp3"),
  ];
  get meditation => _meditation;
  get sleep => _sleep;
  get relax => _relax;
  get all => _meditation + _relax + _sleep;
}
