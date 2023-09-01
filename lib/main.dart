//main.dart
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

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
      home: Padding(
        padding: const EdgeInsets.all(Sizes.size14),
        child: Container(
          child: const Row(children: [
            Text('Hello'),
            Gaps.h20, //size가 20인 가로 공간을 부여, utility class로 단축해서 활용가능
            Text('Hello2'),
          ]),
        ),
      ),
    );
  }
}
