import 'package:flutter/material.dart';

class AnimatedPositionPage extends StatefulWidget {
  const AnimatedPositionPage({super.key});

  @override
  State<AnimatedPositionPage> createState() => _AnimatedPositionPageState();
}

class _AnimatedPositionPageState extends State<AnimatedPositionPage> {
  bool _startEating = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      appBar: AppBar(title: const Text('Animated Position')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              top: 0,
              left: 0,
              child: SizedBox(
                width: 100,
                height: 100,
                child: Image.asset('assets/images/cheese.png'),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOut,
              top: 0,
              left: _startEating ? width - 150 : 0,
              child: SizedBox(
                width: 100,
                height: 100,
                child: Image.asset('assets/images/jerry.png'),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeInOut,
              top: _startEating ? (height / 2 - 150) : 0,
              left: _startEating ? width / 2 : 0,
              child: SizedBox(
                width: 100,
                height: 100,
                child: Image.asset('assets/images/dog.png'),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              top: _startEating ? height - 300 : 0,
              left: 0,
              child: SizedBox(
                width: 100,
                height: 100,
                child: Image.asset('assets/images/tom.png'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          _startEating = !_startEating;
        }),
        child: Icon(_startEating ? Icons.place : Icons.back_hand),
      ),
    );
  }
}
