import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:media_booster/modules/components/player_buttons.dart';
import 'package:media_booster/modules/components/seekbar.dart';
import 'package:media_booster/modules/models/song_model.dart';

class MusicPlayer extends StatelessWidget {
  final Stream<SeekbarData> seekBarDataStream;
  final AudioPlayer audioPlayer;
  final Song song;

  const MusicPlayer({
    super.key,
    required this.song,
    required this.audioPlayer,
    required this.seekBarDataStream,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 50,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            song.title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 30),
          StreamBuilder<SeekbarData>(
            stream: seekBarDataStream,
            builder: (context, snapshot) {
              final positionData = snapshot.data;
              return SeekBar(
                position: positionData?.position ?? Duration.zero,
                duration: positionData?.duration ?? Duration.zero,
                onChanged: audioPlayer.seek,
              );
            },
          ),
          PlayerButtons(audioPlayer: audioPlayer),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                iconSize: 35,
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                iconSize: 35,
                icon: Icon(
                  Icons.cloud_download,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
