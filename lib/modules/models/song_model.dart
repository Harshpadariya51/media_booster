class SongModel {
  String title;
  String desc;
  String url;
  String coverUrl;
  SongModel({
    required this.title,
    required this.desc,
    required this.url,
    required this.coverUrl,
  });

  static List<SongModel> songs = [
    SongModel(
      title: 'Malang Sajna',
      desc: 'Malang Sajna',
      url: 'assets/music/m1.mp3',
      coverUrl: 'assets/img/img1.jpg',
    ),
    SongModel(
      title: 'Arijit Singhs 2023',
      desc: '💖Romantic Songs 2023💖',
      url: 'assets/music/m2.mp3',
      coverUrl: 'assets/img/img2.jpg',
    ),
    SongModel(
      title: 'Chand Wala Mukhda',
      desc: 'Chand Wala ',
      url: 'assets/music/m3.mp3',
      coverUrl: 'assets/img/img3.jpg',
    ),
    SongModel(
      title: 'Jhoome Jo Pathaan',
      desc: 'Jhoome Jo Pathaan',
      url: 'assets/music/m4.mp3',
      coverUrl: 'assets/img/img4.jpg',
    ),
    SongModel(
      title: 'Let’s Naacho!',
      desc: 'Let’s Naacho!',
      url: 'assets/music/m5.mp3',
      coverUrl: 'assets/img/img5.jpg',
    ),
    SongModel(
      title: 'Maan Meri Jaan',
      desc: 'Maan Meri Jaan',
      url: 'assets/music/m6.mp3',
      coverUrl: 'assets/img/img6.jpg',
    ),
    SongModel(
      title: 'Matla Upar Matlu',
      desc: 'Matla Upar Matlu',
      url: 'assets/music/m7.mp3',
      coverUrl: 'assets/img/img7.jpg',
    ),
  ];
}
