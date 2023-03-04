import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("All activity"),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 0,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size12,
              ),
              child: Text(
                "New",
                style: TextStyle(
                  fontSize: Sizes.size14,
                  color: Colors.grey.shade500,
                ),
              ),
            ),
            Gaps.v14,
            Dismissible(
              key: const Key("x"),
              background: Container(
                alignment: Alignment.centerLeft,
                color: Colors.green,
                child: const Padding(
                  padding: EdgeInsets.only(
                    left: Sizes.size10,
                  ),
                  child: FaIcon(
                    FontAwesomeIcons.checkDouble,
                    color: Colors.white,
                    size: Sizes.size32,
                  ),
                ),
              ),
              secondaryBackground: Container(
                alignment: Alignment.centerRight,
                color: Colors.red,
                child: const Padding(
                  padding: EdgeInsets.only(
                    right: Sizes.size10,
                  ),
                  child: FaIcon(
                    FontAwesomeIcons.trashCan,
                    color: Colors.white,
                    size: Sizes.size32,
                  ),
                ),
              ),
              child: ListTile(
                leading: Container(
                  width: Sizes.size52,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade400,
                      width: Sizes.size1,
                    ),
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Center(
                    child: FaIcon(
                      FontAwesomeIcons.bell,
                      color: Colors.black,
                    ),
                  ),
                ),
                title: RichText(
                  text: const TextSpan(
                    text: "Account updates: ",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: Sizes.size16,
                    ),
                    children: [
                      TextSpan(
                        text: "Upload longer videos ",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: "1h",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                trailing: const FaIcon(
                  FontAwesomeIcons.chevronRight,
                  size: Sizes.size14,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ));
  }
}
