import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ControlMaterialVideo extends StatelessWidget {
  const ControlMaterialVideo({Key? key, required this.controller})
      : super(key: key);

  static const List<double> kecepatanVideo = <double>[
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton<double>(
            initialValue: controller.value.playbackSpeed,
            tooltip: 'Playback speed',
            onSelected: (double speed) {
              controller.setPlaybackSpeed(speed);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<double>>[
                for (final double speed in kecepatanVideo)
                  PopupMenuItem<double>(
                    value: speed,
                    child: Text('${speed}x'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // vertical: 12,
                horizontal: 10,
              ),
              child: Container(
                height: 20,
                width: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFB0B9C4),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    '${controller.value.playbackSpeed}x',
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
