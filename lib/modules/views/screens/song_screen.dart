import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:media_booster/modules/components/background_filter.dart';
import 'package:media_booster/modules/components/seekbar.dart';
import 'package:media_booster/modules/models/song_model.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

class SongScreen extends StatefulWidget {
  final int songIndex;
  final List<Song> songList;
  const SongScreen(
      {super.key, required this.songIndex, required this.songList});

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  // Song song = Get.arguments ?? Song.songs[0];

  @override
  void initState() {
    super.initState();
    audioPlayer.setAudioSource(
      ConcatenatingAudioSource(
        children: [
          AudioSource.uri(
            Uri.parse('asset:///${widget.songList[widget.songIndex].url}'),
          ),
          // AudioSource.uri(
          //   Uri.parse('asset:///${Song.songs[1].url}'),
          // ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Stream<SeekbarData> get seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekbarData>(
        audioPlayer.positionStream,
        audioPlayer.durationStream,
        (Duration position, Duration? duration) {
          return SeekbarData(
            position: position,
            duration: duration ?? Duration.zero,
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            widget.songList[widget.songIndex].coverUrl,
            fit: BoxFit.cover,
          ),
          const BackgroundFilter(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title..............
              Text(
                widget.songList[widget.songIndex].title,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 30),
              // SeekBar...........
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
              // Buttons.......................
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StreamBuilder<SequenceState?>(
                    stream: audioPlayer.sequenceStateStream,
                    builder: (context, index) {
                      return IconButton(
                        onPressed: () {
                          if (widget.songIndex > 0) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SongScreen(
                                  songIndex: widget.songIndex - 1,
                                  songList: widget.songList,
                                ),
                              ),
                            );
                          }
                        },
                        iconSize: 45,
                        icon: const Icon(
                          Icons.skip_previous_rounded,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                  StreamBuilder<PlayerState>(
                    stream: audioPlayer.playerStateStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final playersState = snapshot.data;
                        final processingState =
                            (playersState! as PlayerState).processingState;
                        if (processingState == ProcessingState.loading ||
                            processingState == ProcessingState.buffering) {
                          return Container(
                            width: 64.0,
                            height: 64.0,
                            margin: const EdgeInsets.all(10),
                            child: const CircularProgressIndicator(),
                          );
                        } else if (!audioPlayer.playing) {
                          return IconButton(
                            onPressed: () {
                              audioPlayer.play();
                            },
                            iconSize: 75,
                            icon: const Icon(
                              Icons.play_circle,
                              color: Colors.white,
                            ),
                          );
                        } else if (processingState !=
                            ProcessingState.completed) {
                          return IconButton(
                            onPressed: audioPlayer.pause,
                            iconSize: 75,
                            icon: const Icon(
                              Icons.pause_circle,
                              color: Colors.white,
                            ),
                          );
                        } else {
                          return IconButton(
                            onPressed: () => audioPlayer.seek(
                              Duration.zero,
                              index: audioPlayer.effectiveIndices!.first,
                            ),
                            iconSize: 75,
                            icon: const Icon(
                              Icons.replay_circle_filled_rounded,
                              color: Colors.white,
                            ),
                          );
                        }
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                  StreamBuilder<SequenceState?>(
                    stream: audioPlayer.sequenceStateStream,
                    builder: (context, index) {
                      return IconButton(
                        onPressed: () {
                          if (widget.songIndex < widget.songList.length - 1) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SongScreen(
                                  songIndex: widget.songIndex + 1,
                                  songList: widget.songList,
                                ),
                              ),
                            );
                          }
                        },
                        iconSize: 45,
                        icon: const Icon(
                          Icons.skip_next_rounded,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ],
              ),
              // PlayerButtons(audioPlayer: audioPlayer),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     IconButton(
              //       onPressed: () {},
              //       iconSize: 35,
              //       icon: const Icon(
              //         Icons.settings,
              //         color: Colors.white,
              //       ),
              //     ),
              //     IconButton(
              //       onPressed: () {},
              //       iconSize: 35,
              //       icon: const Icon(
              //         Icons.cloud_download,
              //         color: Colors.white,
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
