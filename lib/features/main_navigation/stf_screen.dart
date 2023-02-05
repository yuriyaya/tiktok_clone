import 'package:flutter/material.dart';

class StfScreen extends StatefulWidget {
  const StfScreen({super.key});

  @override
  State<StfScreen> createState() => _StfScreenState();
}

class _StfScreenState extends State<StfScreen> {
  int _clicks = 0;

  void _inc() {
    setState(() {
      _clicks = _clicks + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("number of clicks"),
          Text("$_clicks"),
          TextButton(
            onPressed: _inc,
            child: const Text("click!"),
          )
        ],
      ),
    );
  }
}
