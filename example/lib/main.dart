import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player_controls/video_player_controls.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shortcuts(
        shortcuts: {
          LogicalKeySet(LogicalKeyboardKey.select):
              const Intent(ActivateAction.key)
        },
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark(),
            home: new HomePage()));
  }
}

class HomePage extends StatefulWidget {
  HomePage({this.title = 'Video player controls'});

  final String title;

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Controller controller;
  @override
  void initState() {
    super.initState();
    controller = new Controller(
        items: [
          new PlayerItem(
            title: 'video 1',
            url:
                'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
          ),
          new PlayerItem(
            startAt: Duration(seconds: 2),
            title: 'video 2',
            aspectRatio: 16 / 4,
            url:
                'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
          ),
          new PlayerItem(
            title: 'video 3',
            aspectRatio: 16 / 9,
            url:
                'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
          ),
        ],
        progressColors: ProgressColors(playedColor: Colors.redAccent),
        autoPlay: true,
        // index: 2,
        autoInitialize: true,
        // isLooping: false,
        allowedScreenSleep: false,
        // showControls: false,
        // hasSubtitles: true,
        // isLive: false,
        // showSeekButtons: false,
        // showSkipButtons: false,
        // allowFullScreen: false,
        // fullScreenByDefault: true,
        placeholder: new Container(
          color: Colors.grey,
        ),
        isPlaying: (isPlaying) {
          //
          // print(isPlaying);
        },
        onError: (error) {
          //
          // print(error['hasError']);
          // print(error['message']);
        },
        playerItem: (playerItem) {
          // print('Player title: ' + playerItem.title);
          // print('position: ' + playerItem.position.inSeconds.toString());
          // print('Duration: ' + playerItem.duration.inSeconds.toString());
        },
        videosCompleted: (isCompleted) {
          print(isCompleted);
        });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: VideoPlayerControls(
          controller: controller,
        ),
      ),
    );
  }
}
