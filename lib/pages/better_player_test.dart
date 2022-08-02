import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class MyVideoTest extends StatefulWidget {
  const MyVideoTest({Key? key}) : super(key: key);

  @override
  State<MyVideoTest> createState() => _MyVideoTestState();
}

BetterPlayerController _betterPlayerController = BetterPlayerController(
  const BetterPlayerConfiguration(),
);

class _MyVideoTestState extends State<MyVideoTest> {
  @override
  void initState() {
    super.initState();
    startingVideo();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AspectRatio(
        aspectRatio: 16 / 9,
        child: BetterPlayer(
          controller: _betterPlayerController,
        ),
      ),
    );
  }
}
