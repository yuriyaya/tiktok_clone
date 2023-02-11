import 'package:flutter/material.dart';

import '../../constants/sizes.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  int _itemCount = 4;

  List<Color> colorList = [
    Colors.blue,
    Colors.teal,
    Colors.yellow,
    Colors.amber,
  ];

  void _onPageChanged(int page) {
    if (page == _itemCount - 1) {
      setState(() {
        _itemCount = _itemCount + 4;
        colorList.addAll([
          Colors.blue,
          Colors.teal,
          Colors.yellow,
          Colors.amber,
        ]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      onPageChanged: _onPageChanged,
      itemCount: colorList.length,
      itemBuilder: ((context, index) => Container(
            color: colorList[index],
            child: Center(
              child: Text(
                "$index",
                style: const TextStyle(
                  fontSize: Sizes.size40,
                ),
              ),
            ),
          )),
    );
  }
}
