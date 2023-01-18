import 'package:flutter/material.dart';
import 'package:tiktok_clone/%20constants/gaps.dart';
import 'package:tiktok_clone/%20constants/sizes.dart';

void main() {
  runApp(const TiktokApp());
}

class TiktokApp extends StatelessWidget {
  const TiktokApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiktok Clone',
      theme: ThemeData(
        primaryColor: const Color(0xFFE9435A),
      ),
      home: Padding(
        padding: const EdgeInsets.all(Sizes.size10),
        child: Container(
          child: Row(
            children: const [
              Text("hello"),
              Gaps.h10,
              Text("hello"),
            ],
          ),
        ),
      ),
    );
  }
}
