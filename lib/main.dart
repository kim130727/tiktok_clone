//main.dart
import 'package:flutter/material.dart';
import 'package:tiktok_clone/screens/sign_up/sign_up_screen.dart';

void main() {
  runApp(const TiktokApp());
}

class TiktokApp extends StatelessWidget {
  const TiktokApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTok Clone',
      theme: ThemeData(
        primaryColor: const Color(0xFFE9435A), //틱톡 시그니쳐 컬러
      ),
      home: const SignUpScreen(),
    );
  }
}
