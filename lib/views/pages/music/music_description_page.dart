import 'package:flutter/material.dart';
import 'package:zenminds/const/colors.dart';
import 'package:zenminds/models/music_model.dart';
import 'package:zenminds/views/pages/music/player_page.dart';

class DescriptionPage extends StatefulWidget {
  String heroTag;
  SongItemModel song;
  DescriptionPage({super.key, required this.song, required this.heroTag});

  @override
  State<DescriptionPage> createState() => DescriptionPageState();
}

class DescriptionPageState extends State<DescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryBackground,
        // appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Hero(
                          tag: widget.heroTag,
                          child: Container(
                            height: 300,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(widget.song.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: AppColors.primaryTextColor,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        widget.song.name,
                        style: const TextStyle(
                          fontSize: 27,
                          color: AppColors.primaryTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        widget.song.description,
                        style: const TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 16,
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: FloatingActionButton.extended(
                  backgroundColor: AppColors.boxSelected,
                  onPressed: () {
                    Navigator.push(
                      // Use Navigator.push to navigate to the PlayerPage
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PlayerPage(song: widget.song),
                      ),
                    );
                  },
                  label: const Text(
                    "Play",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Roboto",
                        color: AppColors.primaryTextColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
