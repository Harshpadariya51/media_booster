import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:media_booster/modules/views/screens/home_page.dart';
import 'package:media_booster/modules/views/screens/playlist_screen.dart';
import 'package:media_booster/modules/views/screens/song_screen.dart';
import 'package:media_booster/modules/views/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: 'welcome',
      routes: {
        '/': (context) => const HomePage(),
        'welcome': (context) => const WelcomeSplash(),
        // 'song_screen': (context) => const SongScreen(),
        'playlist': (context) => const PlaylistScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
