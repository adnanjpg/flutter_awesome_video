import 'package:flutter/material.dart';
import 'package:video_player_controls/data/controller.dart';
import 'package:video_player_controls/src/buttons/next_button.dart';
import 'package:video_player_controls/src/buttons/play_button.dart';
import 'package:video_player_controls/src/buttons/previous_button.dart';
import 'package:video_player_controls/src/progress/progress_bar.dart';

class PhoneHome extends StatefulWidget {
  final Controller controller;

  const PhoneHome({Key key, this.controller}) : super(key: key);
  @override
  _PhoneHomeState createState() => _PhoneHomeState();
}

class _PhoneHomeState extends State<PhoneHome> {
  Controller _controller;

  @override
  void initState() {
    //
    super.initState();
    _controller = widget.controller;
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: [
        //
        Positioned(
          bottom: 0,
          top: 0,
          left: 0,
          right: 0,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _controller.showSkipButtons == false
                        ? new Container()
                        : new PreviousButton(),
                    new PlayButton(),
                    _controller.showSkipButtons == false
                        ? new Container()
                        : new NextButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: new ProgressBar(controller: _controller),
        )
      ],
    );
  }
}