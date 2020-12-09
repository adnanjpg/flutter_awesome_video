import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player_controls/bloc/previous_video/previous_video_bloc.dart';
import 'package:video_player_controls/bloc/show_controls/showcontrols_bloc.dart';
import 'package:video_player_controls/src/buttons/cover.dart';
import 'package:video_player_controls/video_player_controls.dart';

class PreviousButton extends StatelessWidget {
  const PreviousButton(this._controller);
  final Controller _controller;
  @override
  Widget build(BuildContext context) {
    final bool _visible =
        _controller.showSkipButtons && _controller.hasPrevVideo();
    return Cover(
      key: UniqueKey(),
      icon: _controller.isRtl
          ? Icons.skip_next_outlined
          : Icons.skip_previous_outlined,
      iconSize: _visible ? 40 : 0,
      onTap: () {
        if (_visible) {
          BlocProvider.of<ShowcontrolsBloc>(context)
              .add(ShowcontrolsEventStart());
          BlocProvider.of<PreviousVideoBloc>(context)
              .add(PreviousVideoEventLoad());
        }
      },
    );
  }
}
