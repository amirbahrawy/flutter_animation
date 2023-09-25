import 'package:flutter/material.dart';

class AnimatedPhysicalModelPage extends StatefulWidget {
  const AnimatedPhysicalModelPage({super.key});

  @override
  State<AnimatedPhysicalModelPage> createState() =>
      _AnimatedPhysicalModelPageState();
}

class _AnimatedPhysicalModelPageState extends State<AnimatedPhysicalModelPage> {
  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Animated Physical Model')),
        body: GestureDetector(
          onTap: _toggleElevation,
          child: Center(
            child: AnimatedPhysicalModel(
              duration: const Duration(milliseconds: 500),
              curve: Curves.bounceInOut,
              shape: BoxShape.rectangle,
              elevation: _isPressed ? 55 : 0,
              color: Colors.grey,
              shadowColor: Colors.blueGrey,
              child: SizedBox(
                width: 200,
                height: 200,
                child: Image.asset('assets/images/tom.png'),
              ),
            ),
          ),
        ));
  }

  void _toggleElevation() {
    setState(() {
      _isPressed = !_isPressed;
    });
  }
}
