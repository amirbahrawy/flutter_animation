import 'package:flutter/material.dart';

class RotationTransitionPage extends StatefulWidget {
  const RotationTransitionPage({super.key});

  @override
  State<RotationTransitionPage> createState() => _RotationTransitionPageState();
}

class _RotationTransitionPageState extends State<RotationTransitionPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 7),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 7.0).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rotation Transition')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            _controller.reset();
            _controller.forward();
          },
          child: RotationTransition(
            turns: _animation,
            child: Container(
                width: 200,
                height: 200,
                color: Colors.blueGrey,
                child: Image.asset('assets/images/dog.png')),
          ),
        ),
      ),
    );
  }
}
