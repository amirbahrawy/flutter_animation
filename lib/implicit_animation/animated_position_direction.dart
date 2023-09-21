import 'package:flutter/material.dart';

class AnimatedPositionDirectionPage extends StatefulWidget {
  const AnimatedPositionDirectionPage({super.key});

  @override
  State<AnimatedPositionDirectionPage> createState() =>
      _AnimatedPositionDirectionPageState();
}

class _AnimatedPositionDirectionPageState
    extends State<AnimatedPositionDirectionPage> {
  double _start = 0;
  double _top = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Position Direction')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            AnimatedPositionedDirectional(
              duration: const Duration(milliseconds: 400),
              top: _top,
              start: _start,
              child: SizedBox(
                width: 100,
                height: 100,
                child: Image.asset('assets/images/jerry.png'),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _moveLeft,
                    child: const Icon(Icons.arrow_circle_left_outlined),
                  ),
                  ElevatedButton(
                    onPressed: _moveRight,
                    child: const Icon(Icons.arrow_circle_right_outlined),
                  ),
                  ElevatedButton(
                    onPressed: _moveUp,
                    child: const Icon(Icons.arrow_circle_up_outlined),
                  ),
                  ElevatedButton(
                    onPressed: _moveDown,
                    child: const Icon(Icons.arrow_circle_down_outlined),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _moveLeft() => setState(() {
        _start = _start - 50;
        if (_start < 0) _start = 0;
      });

  void _moveRight() => setState(() {
        final width = MediaQuery.of(context).size.width;

        _start = _start + 50;
        if (_start > width - 120) _start = width - 120;
      });

  void _moveUp() => setState(() {
        _top = _top - 50;
        if (_top < 0) _top = 0;
      });

  void _moveDown() => setState(() {
        final height = MediaQuery.of(context).size.height;
        _top = _top + 50;
        if (_top > height - 300) _top = height - 300;
      });
}
