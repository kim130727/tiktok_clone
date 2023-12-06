//video_post.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marquee/marquee.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/videos/widgets/video_button.dart';
import 'package:tiktok_clone/features/videos/widgets/video_comments.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

const keywords = [
  "tag1",
  "tag2",
  "tag3",
  "tag4",
  "tag5",
  "tag6",
  "tag7",
  "tag8",
  "tag9",
];

class VideoPost extends StatefulWidget {
  final Function onVideoFinished;

  final int index;

  const VideoPost(
      {super.key, required this.onVideoFinished, required this.index});

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost>
    with SingleTickerProviderStateMixin {
  late final VideoPlayerController videoPlayerController;
  Duration animationDuration = const Duration(milliseconds: 200);

  late final AnimationController animationController;

  bool isPaused = false;
  bool _isMoreTagsShowed = false;

  final Iterable<String> _tags = keywords.map((tag) => "#$tag");
  late final String _tagString;

  void onVideoChange() {
    if (videoPlayerController.value.isInitialized) {
      if (videoPlayerController.value.duration ==
          videoPlayerController.value.position) {
        widget.onVideoFinished();
      }
    }
  }

  void initVideoPlayer() async {
    videoPlayerController =
        VideoPlayerController.asset("lib/features/assets/videos/0003.mp4");
    await videoPlayerController.initialize();
    await videoPlayerController.setLooping(true); //future를 return함
    videoPlayerController.addListener(onVideoChange);
    setState(() {});
  }

  void _onSeeMoreClick() {
    setState(() {
      _isMoreTagsShowed = !_isMoreTagsShowed;
    });
  }

  @override
  void initState() {
    super.initState();
    initVideoPlayer();

    _tagString = _tags.reduce((value, element) => "$value $element");
    print(_tagString);

    animationController = AnimationController(
      vsync: this,
      lowerBound: 1.0,
      upperBound: 1.5,
      value: 1.5,
      duration: animationDuration,
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  void onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction == 1 &&
        !isPaused &&
        !videoPlayerController.value.isPlaying) {
      videoPlayerController.play();
    }
  }
  //영상의 visibility가 변하고 영상이 전부 화면에 들어 있으면서 재생이 안되고 있다면 재생하도록 함

  void onTogglePause() {
    if (videoPlayerController.value.isPlaying) {
      videoPlayerController.pause();
      animationController.reverse();
    } else {
      videoPlayerController.play();
      animationController.forward();
    }
    setState(() {
      isPaused = !isPaused;
    });
  }

  void _onCommentsTap(BuildContext context) async {
    if (videoPlayerController.value.isPlaying) {
      onTogglePause();
    } //댓글 버튼을 누르면 pause가 되는 함수
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const VideoComments(),
    );
    print('closed'); //await로 인해 댓글창을 닫아야 작동됨
    onTogglePause();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("${widget.index}"),
      onVisibilityChanged: onVisibilityChanged,
      child: Stack(
        children: [
          Positioned.fill(
            child: videoPlayerController.value.isInitialized
                ? VideoPlayer(videoPlayerController)
                : Container(
                    color: Colors.black,
                  ),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: onTogglePause,
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: Center(
                child: AnimatedBuilder(
                  animation: animationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: animationController.value,
                      child: child,
                    );
                  },
                  child: AnimatedOpacity(
                    opacity: isPaused ? 1 : 0,
                    duration: animationDuration,
                    child: const FaIcon(
                      FontAwesomeIcons.play,
                      color: Colors.white,
                      size: Sizes.size52,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "@지율댄스",
                  style: TextStyle(
                    fontSize: Sizes.size20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.v10,
                const Text(
                  "지율이가 여름성경학교에서 찬양춤 보여줬다",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    color: Colors.white,
                  ),
                ),
                Gaps.v10,
                SizedBox(
                  width: 300,
                  child: _isMoreTagsShowed
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              _tagString,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: Sizes.size16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              onTap: _onSeeMoreClick,
                              child: const Text(
                                "Folded",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Sizes.size16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        )
                      : Row(
                          children: [
                            Flexible(
                              child: Text(
                                _tagString,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: Sizes.size16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: _onSeeMoreClick,
                              child: const Text(
                                "See more",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Sizes.size16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                ),
                Gaps.v10,
                Row(
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.music,
                      size: 16,
                      color: Colors.white,
                    ),
                    Gaps.h8,
                    SizedBox(
                      width: 200,
                      height: 16,
                      child: Marquee(
                          text:
                              "This text is to long to be shown in just one line",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: Sizes.size16,
                          )),
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 10,
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  foregroundImage: NetworkImage(
                      "https://avatars.githubusercontent.com/u/47652911"),
                  child: Text("나율"),
                ),
                Gaps.v24,
                const VideoButton(
                    icon: FontAwesomeIcons.solidHeart, text: "100M"),
                Gaps.v24,
                GestureDetector(
                    onTap: () => _onCommentsTap(context),
                    child: const VideoButton(
                        icon: FontAwesomeIcons.solidComment, text: "33K")),
                Gaps.v24,
                const VideoButton(icon: FontAwesomeIcons.share, text: "Share"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
