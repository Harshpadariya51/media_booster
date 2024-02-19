import 'package:flutter/material.dart';
import 'package:media_booster/modules/views/screens/home_page.dart';
import 'package:media_booster/modules/views/screens/splash_screen.dart';

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
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
    );
  }
}
