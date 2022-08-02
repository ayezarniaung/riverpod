import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyVideoTest extends StatefulWidget {
  const MyVideoTest({Key? key}) : super(key: key);

  @override
  State<MyVideoTest> createState() => _MyVideoTestState();
}

BetterPlayerController _betterPlayerController = BetterPlayerController(
  const BetterPlayerConfiguration(),
);

VideoPlayerController _controller = VideoPlayerController.network(
    'https://player.vimeo.com/external/481990300.m3u8?s=a4f7b1262ef3a9044f09ae2a05115ac68c21233f&oauth2_token_id=1617676357');

class _MyVideoTestState extends State<MyVideoTest> {
  @override
  void initState() {
    _controller = VideoPlayerController.network(
        'https://player.vimeo.com/external/481990300.m3u8?s=a4f7b1262ef3a9044f09ae2a05115ac68c21233f&oauth2_token_id=1617676357')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    super.initState();
    // startingVideo();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  startingVideo() async {
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        "https://player.vimeo.com/external/481990300.m3u8?s=a4f7b1262ef3a9044f09ae2a05115ac68c21233f&oauth2_token_id=1617676357");
    _betterPlayerController = BetterPlayerController(
      const BetterPlayerConfiguration(
        autoPlay: true,
      ),
      betterPlayerDataSource: betterPlayerDataSource,
    );
  }

  Widget buildFullScreen({required Widget child}) {
    final size = _controller.value.size;
    final width = size.width;
    final height = size.height;
    return child;
    // return FittedBox(
    //   fit: BoxFit.cover,
    //   // alignment: Alignment.topCenter,
    //   child: SizedBox(width: width, height: height, child: child),
    // );
  }

  Widget buildVideoPlayer() => buildFullScreen(
        child: AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.isInitialized
            ? Stack(
                children: [
                  buildVideoPlayer(),
                  AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.skip_previous,
                            size: 32,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _controller.value.isPlaying
                                    ? _controller.pause()
                                    : _controller.play();
                              });
                            },
                            child: Icon(
                              _controller.value.isPlaying
                                  ? Icons.pause_circle
                                  : Icons.play_circle,
                              size: 32,
                            ),
                          ),
                          const Icon(
                            Icons.skip_next_sharp,
                            size: 32,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : Container(),
      ),
    );
  }
}
