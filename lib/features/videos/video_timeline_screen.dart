import 'package:flutter/material.dart';

import '../../constants/sizes.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  int _itemCount = 4;

  final PageController _pageController = PageController();

  List<Color> colorList = [
    Colors.blue,
    Colors.teal,
    Colors.yellow,
    Colors.amber,
  ];

  void _onPageChanged(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(
        milliseconds: 150,
      ),
      curve: Curves.linear,
    );
    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 4;
      colorList.addAll([
        Colors.blue,
        Colors.teal,
        Colors.yellow,
        Colors.amber,
      ]);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
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
