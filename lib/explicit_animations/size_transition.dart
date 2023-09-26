import 'package:flutter/material.dart';

class SizeTransitionPage extends StatefulWidget {
  const SizeTransitionPage({super.key});

  @override
  State<SizeTransitionPage> createState() => _SizeTransitionPageState();
}

class _SizeTransitionPageState extends State<SizeTransitionPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceInOut,
      ),
    );
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Size Transition')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            _controller.reset();
            _controller.forward();
          },
          child: Container(
            width: 200,
            height: 200,
            color: Colors.indigo,
            child: Center(
              child: SizeTransition(
                sizeFactor: _animation,
                child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.blueGrey,
                    child: Image.asset('assets/images/dog.png')),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
