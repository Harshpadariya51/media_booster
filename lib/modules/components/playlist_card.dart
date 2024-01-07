import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:media_booster/modules/models/playlist_model.dart';

class PlaylistCard extends StatelessWidget {
  const PlaylistCard({
    super.key,
    required this.playlists,
  });

  final PlaylistModel playlists;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('playlist', arguments: playlist);
      },
      child: Container(
        height: 75,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade800.withOpacity(0.6),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                playlist.imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    playlist.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  Text(
                    '${playlist.songs.length} songs',
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.play_circle,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
