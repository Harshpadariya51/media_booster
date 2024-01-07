import 'package:flutter/material.dart';
import 'package:media_booster/modules/components/custom_nav_bar.dart';
import 'package:media_booster/modules/models/playlist_model.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PlaylistModel playlist = PlaylistModel.playlist[0];
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
          title: const Text('Playlist'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        bottomNavigationBar: CustomNavBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(
                      playlist.imageUrl,
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.3,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    playlist.title,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
