//main.dart
import 'package:flutter/cupertino.dart';
import 'package:tiktok_clone/features/main_navigation/main_navigation_screen.dart';

void main() {
  runApp(const TiktokApp());
}

class TiktokApp extends StatelessWidget {
  const TiktokApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'TikTok Clone',
      home: MainNavigationScreen(),
    );
  }
}
