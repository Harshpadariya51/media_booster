import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/modules/components/playlist_card.dart';
import 'package:media_booster/modules/components/section_header.dart';

class PlaylistMusic extends StatelessWidget {
  final List<Playlist> playlists;
  const PlaylistMusic({super.key, required this.playlists});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SectionHeader(title: 'Playlists'),
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 20),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: playlists.length,
            itemBuilder: (context, index) {
              return PlaylistCard(playlists: playlists);
            },
          ),
        ],
      ),
    );
  }
}
