import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';

import '../../../constants/sizes.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  void _onClosePressed() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.75,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size14),
      ),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.grey.shade50,
          title: const Text("22796 comments"),
          actions: [
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.xmark),
              onPressed: _onClosePressed,
            ),
          ],
        ),
        body: Stack(children: [
          ListView.separated(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size10,
              horizontal: Sizes.size16,
            ),
            separatorBuilder: (context, index) => Gaps.v20,
            itemCount: 10,
            itemBuilder: (context, index) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  foregroundImage: NetworkImage(
                      "https://avatars.githubusercontent.com/u/19943852?v=4"),
                  child: Text("yu"),
                ),
                Gaps.h10,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "yuriya",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      Gaps.v4,
                      const Text(
                          "세찬 파도! 엄청나게 밀려오는 광경이 무섭군요.. 이런이런이런... 조심 조심 또 조심"),
                    ],
                  ),
                ),
                Gaps.h10,
                Column(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.heart,
                      color: Colors.grey.shade500,
                      size: Sizes.size24,
                    ),
                    Gaps.v3,
                    Text(
                      "52.2K",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.bold,
                        fontSize: Sizes.size12,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            width: size.width,
            child: BottomAppBar(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size16,
                  vertical: Sizes.size10,
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.white,
                      child: Text("yu"),
                    ),
                    Gaps.h10,
                    Expanded(
                      child: TextField(
                        cursorColor: Theme.of(context).primaryColor,
                        decoration: InputDecoration(
                          hintText: "Add Comment...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              Sizes.size12,
                            ),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: Sizes.size10,
                            horizontal: Sizes.size12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
