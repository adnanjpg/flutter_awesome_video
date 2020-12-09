import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player_controls/bloc/next_video/next_video_bloc.dart';
import 'package:video_player_controls/bloc/show_controls/showcontrols_bloc.dart';
import 'package:video_player_controls/src/buttons/cover.dart';
import 'package:video_player_controls/video_player_controls.dart';

class NextButton extends StatelessWidget {
  const NextButton(this._controller);
  final Controller _controller;
  @override
  Widget build(BuildContext context) {
    final bool _visible =
        _controller.showSkipButtons && _controller.hasNextVideo();
    return Cover(
      key: UniqueKey(),
      icon: _controller.isRtl
          ? Icons.skip_previous_outlined
          : Icons.skip_next_outlined,
      iconSize: _visible ? 40 : 0,
      onTap: () {
        if (_visible) {
          BlocProvider.of<ShowcontrolsBloc>(context)
              .add(ShowcontrolsEventStart());
          BlocProvider.of<NextVideoBloc>(context).add(NextVideoEventLoad());
        }
      },
    );
  }
}
