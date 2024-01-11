import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:media_booster/modules/models/playlist_model.dart';
import 'package:media_booster/modules/models/song_model.dart';

class PlayListSongs extends StatelessWidget {
  const PlayListSongs({super.key, required this.playlist});
  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: playlist.songs.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Get.toNamed('song_screen', arguments: Song.songs[index]);
          },
          child: ListTile(
            leading: Text(
              '${index + 1}',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            title: Text(
              playlist.songs[index].title,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              '${playlist.songs[index].desc} ◽ 02:45',
              style: const TextStyle(color: Colors.white),
            ),
            trailing: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
