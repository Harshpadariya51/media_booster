import 'package:media_booster/modules/models/song_model.dart';

class PlaylistModel {
  final String title;
  final List<SongModel> songs;
  final String imageUrl;

  PlaylistModel({
    required this.title,
    required this.songs,
    required this.imageUrl,
  });
  static List<PlaylistModel> playlist = [
    PlaylistModel(
      title: 'Hip-hop R&B Mix',
      songs: SongModel.songs,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1-OALa6vL7D9VfuBjJSbLR1uyD33MwRGWLQ',
    ),
    PlaylistModel(
      title: 'Rock & Roll',
      songs: SongModel.songs,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpeRN8SNArPbGe3ISF3znKJ2ISnifl916yJQ&usqp=CAU',
    ),
    PlaylistModel(
      title: 'Techno',
      songs: SongModel.songs,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_R7Yz0P9zwqktYVPiNUELDgBradHpApkl_g',
    ),
  ];
}
