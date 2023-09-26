import 'package:flutter/material.dart';

class AnimatedAlignPage extends StatefulWidget {
  const AnimatedAlignPage({super.key});

  @override
  State<AnimatedAlignPage> createState() => _AnimatedAlignPageState();
}

class _AnimatedAlignPageState extends State<AnimatedAlignPage> {
  int _jerryAlign = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animation Align')),
      body: Stack(children: [
        AnimatedAlign(
          alignment: _getNextAlignment(_jerryAlign),
          duration: const Duration(milliseconds: 400),
          child: SizedBox(
            height: 100,
            width: 100,
            child: Image.asset(
              'assets/images/jerry.png',
            ),
          ),
        ),
        AnimatedAlign(
          alignment: _getNextAlignment(_jerryAlign - 1),
          duration: const Duration(milliseconds: 400),
          child: SizedBox(
            height: 100,
            width: 100,
            child: Image.asset('assets/images/tom.png'),
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: () {
          _jerryAlign += 1;
          setState(() {});
        },
      ),
    );
  }

  Alignment _getNextAlignment(int jerryAlign) {
    switch (jerryAlign % 9) {
      case 1:
        return Alignment.topCenter;
      case 2:
        return Alignment.topRight;
      case 3:
        return Alignment.centerLeft;
      case 4:
        return Alignment.center;
      case 5:
        return Alignment.centerRight;
      case 6:
        return Alignment.bottomLeft;
      case 7:
        return Alignment.bottomCenter;
      case 8:
        return Alignment.bottomRight;
      default:
        return Alignment.topLeft;
    }
  }
}
