//discover_screen.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
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

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController _textEditingController =
      TextEditingController(text: "Initial Text"); //search form 자동완성

  void _onSearchChanged(String value) {
    print("Searching form $value");
  } //Search 문구 출력

  void _onSearchSubmitted(String value) {
    print("Submitted $value");
  } //버튼 누르면 출력

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose(); //controller는 꼭 dispose 해야 함
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false, //키보드가 나오면 scaffold resize 조절 안하게 조정
        appBar: AppBar(
          elevation: 1,
          title: CupertinoSearchTextField(
            controller: _textEditingController,
            onChanged: _onSearchChanged,
            onSubmitted: _onSearchSubmitted,
          ),
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
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior
                  .onDrag, //GridView를 드래그할 때마다 keyboard가 자동으로 사라짐
              itemCount: 20, //지정해주지 않으면 무한으로 나옴
              padding: const EdgeInsets.all(
                Sizes.size1,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //몇개의 Column을 가질지 정하도록 해줌
                crossAxisCount: 2, //컬럼의 개수
                crossAxisSpacing: Sizes.size10, //컬럼간 좌우 간격
                mainAxisSpacing: Sizes.size10, //컬럼간 위아래 간격
                childAspectRatio: 9 / 22, //컬럼 세로가로 비율
              ),
              itemBuilder: (context, index) => Column(
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge, //이미지가 overflow 되는 것을 조정
                    decoration: BoxDecoration(
                      //이미지 테두리를 동그랗게
                      borderRadius: BorderRadius.circular(Sizes.size4),
                    ),
                    child: AspectRatio(
                      aspectRatio: 9 / 16,
                      child: FadeInImage.assetNetwork(
                        fit: BoxFit.cover, //강제로 특정한 비율을 따르는 위젯
                        placeholder:
                            "C:\\flutter\\tiktok_clone\\lib\\features\\assets\\images\\image2.jpg",
                        image:
                            "https://images.unsplash.com/photo-1673844969019-c99b0c933e90?ixlib=rb-4.0.3&Wixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80",
                      ),
                    ),
                  ),
                  Gaps.v10,
                  const Text(
                    "This is a very long caption for my tiktok that im upload just now currently.",
                    overflow: TextOverflow.ellipsis, //말줄임표 사용
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: Sizes.size12 + Sizes.size2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v8,
                  DefaultTextStyle(
                    //같은 스타일이 두 텍스트 모두에게 적용됨
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w600,
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 12,
                          backgroundImage: NetworkImage(
                            "https://avatars.githubusercontent.com/u/47652911",
                          ),
                        ),
                        Gaps.h4,
                        const Expanded(
                          child: Text(
                            "My avatar is going to be very long",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Gaps.h4,
                        FaIcon(
                          FontAwesomeIcons.heart,
                          size: Sizes.size16,
                          color: Colors.grey.shade600,
                        ),
                        Gaps.h2,
                        const Text(
                          "2.5M",
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
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
