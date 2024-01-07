import 'package:flutter/material.dart';
import 'package:media_booster/modules/components/custom_app_bar.dart';
import 'package:media_booster/modules/components/custom_nav_bar.dart';
import 'package:media_booster/modules/components/discover_music.dart';
import 'package:media_booster/modules/components/playlist_music.dart';
import 'package:media_booster/modules/components/trending_music.dart';
import 'package:media_booster/modules/models/playlist_model.dart';
import 'package:media_booster/modules/models/song_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Song> song = Song.songs;
    List<Playlist> playlists = Playlist.playlist;
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
        appBar: const CustomAppBar(),
        bottomNavigationBar: const CustomNavbar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const DiscoverMusic(),
              TrendingMusic(song: song),
              PlaylistMusic(playlists: playlists),
            ],
          ),
        ),
      ),
    );
  }
}
