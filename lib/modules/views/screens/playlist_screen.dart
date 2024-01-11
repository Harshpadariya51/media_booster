import 'package:flutter/material.dart';
import 'package:media_booster/modules/components/play_list_songs.dart';
import 'package:media_booster/modules/components/play_shuffle_switch.dart';
import 'package:media_booster/modules/components/playlist_information.dart';
import 'package:media_booster/modules/models/playlist_model.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Playlist playlist = ModalRoute.of(context)!.settings.arguments as Playlist;
    // Playlist playlists = Playlist.playlist[];
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.deepPurple.shade900.withOpacity(0.8),
            Colors.deepPurple.shade300.withOpacity(0.8),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            'Playlist',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                PlaylistInformation(playlist: playlist),
                const SizedBox(height: 30),
                const PlayOrShuffleSwitch(),
                PlayListSongs(playlist: playlist),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
