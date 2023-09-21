import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({super.key});

  @override
  State<AnimatedContainerPage> createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 100;
  double _height = 100;
  Color _color = Colors.grey;
  double _radius = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Container')),
      body: Center(
        child: GestureDetector(
          onTap: _setAnimation,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: _color,
              borderRadius: BorderRadius.circular(_radius),
            ),
            alignment: Alignment.center,
            child: Image.asset('assets/images/cheese.png'),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _resetAnimation,
        child: const Icon(Icons.restart_alt_rounded),
      ),
    );
  }

  void _setAnimation() => setState(() {
        _width = 400.0;
        _height = 400.0;
        _color = Colors.orange;
        _radius = 60.0;
      });
  void _resetAnimation() => setState(() {
        _width = 100.0;
        _height = 100.0;
        _color = Colors.grey;
        _radius = 20.0;
      });
}
