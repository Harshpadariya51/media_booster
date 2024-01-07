import 'package:flutter/material.dart';
import 'package:media_booster/modules/components/music_card.dart';
import 'package:media_booster/modules/components/section_header.dart';
import 'package:media_booster/modules/models/song_model.dart';

class TrendingMusic extends StatelessWidget {
  const TrendingMusic({
    super.key,
    required this.song,
  });

  final List<SongModel> song;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        top: 20,
        bottom: 20,
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: SectionHeader(
              title: 'Trading Music',
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: song.length,
              itemBuilder: (context, index) {
                return MusicCard(
                  songs: song[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
