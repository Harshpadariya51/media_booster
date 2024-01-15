import 'package:flutter/material.dart';
import 'package:media_booster/modules/views/screens/home_page.dart';
import 'package:media_booster/modules/views/screens/playlist_screen.dart';
import 'package:media_booster/modules/views/screens/video_screen.dart';
import 'package:media_booster/modules/views/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'welcome',
      routes: {
        '/': (context) => const HomePage(),
        'welcome': (context) => const WelcomeSplash(),
        'playlist': (context) => const PlaylistScreen(),
        'video': (context) => VideoScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
