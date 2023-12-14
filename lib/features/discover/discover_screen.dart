//discover_screen.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: const Text('Discover'),
          bottom: TabBar(
            splashFactory: NoSplash.splashFactory,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size16,
            ),
            isScrollable: true,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Sizes.size16,
            ),
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.shade500,
            tabs: [
              for (var tab in tabs)
                Tab(
                  text: tab,
                )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GridView.builder(
                itemCount: 20, //지정해주지 않으면 무한으로 나옴
                padding: const EdgeInsets.all(
                  Sizes.size1,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  //몇개의 Column을 가질지 정하도록 해줌
                  crossAxisCount: 2, //컬럼의 개수
                  crossAxisSpacing: Sizes.size10, //컬럼간 좌우 간격
                  mainAxisSpacing: Sizes.size10, //컬럼간 위아래 간격
                  childAspectRatio: 9 / 16, //컬럼 세로가로 비율
                ),
                itemBuilder: (context, index) => Container(
                      color: Colors.teal,
                      child: Center(
                        child: Text("$index"),
                      ),
                    )),
            for (var tab in tabs.skip(1)) //첫번째 tab 생략
              Center(
                child: Text(
                  tab,
                  style: const TextStyle(
                    fontSize: 28,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
