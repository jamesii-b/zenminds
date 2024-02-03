import 'package:flutter/material.dart';
import 'package:zenminds/const/colors.dart';
import 'package:zenminds/models/music_model.dart';
import 'package:zenminds/providers/selection.dart';
import 'package:zenminds/viewmodel/music_view_model.dart';
import 'package:zenminds/views/pages/music/components/selectionrow.dart';
import 'package:provider/provider.dart';
import 'package:zenminds/views/pages/music/music_description_page.dart';

class MusicListPage extends StatefulWidget {
  const MusicListPage({Key? key});

  @override
  State<MusicListPage> createState() => _MusicListPageState();
}

class _MusicListPageState extends State<MusicListPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.0),
            child: CategorySelectionRow(),
          ),
          const SizedBox(height: 20),
          Expanded(
            // Wrap the GridView with Expanded
            child: Consumer<AllMusicViewModel>(
              builder: (context, viewModel, child) {
                var selection = Provider.of<SelectionIndex>(context);
                return GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  padding: const EdgeInsets.all(8.0),
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  children: [
                    if (selection.selection == 0)
                      ...viewModel.all
                          .map((song) => buildMusicItem(song, context)),
                    if (selection.selection == 1)
                      ...viewModel.meditation
                          .map((song) => buildMusicItem(song, context)),
                    if (selection.selection == 2)
                      ...viewModel.relax
                          .map((song) => buildMusicItem(song, context)),
                    if (selection.selection == 3)
                      ...viewModel.sleep
                          .map((song) => buildMusicItem(song, context)),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildMusicItem(SongItemModel song, BuildContext context) {
  String heroTag = 'song-image-${song.image}-${UniqueKey().toString()}';

  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DescriptionPage(
            song: song,
            heroTag: heroTag,
          ),
        ),
      );
    },
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset(
            song.image,
            width: MediaQuery.of(context).size.width * 0.45,
          ),
        ),
        Text(
          song.name,
          style: const TextStyle(
            color: AppColors.boxColor,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
