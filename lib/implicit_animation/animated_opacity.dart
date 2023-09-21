import 'package:flutter/material.dart';

class AnimatedOpacityPage extends StatefulWidget {
  const AnimatedOpacityPage({super.key});

  @override
  State<AnimatedOpacityPage> createState() => _AnimatedOpacityPageState();
}

class _AnimatedOpacityPageState extends State<AnimatedOpacityPage> {
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Opacity')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(milliseconds: 500),
              curve: Curves.decelerate,
              child: const Text("Animated Opacity",
                  style: TextStyle(fontSize: 30)),
            ),
            const SizedBox(height: 20),
            AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(milliseconds: 1500),
              curve: Curves.decelerate,
              child: SizedBox(
                height: 100,
                child: Image.asset('assets/images/tom.png'),
              ),
            ),
            const SizedBox(height: 20),
            AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(milliseconds: 2500),
              curve: Curves.decelerate,
              child: SizedBox(
                height: 100,
                child: Image.asset('assets/images/jerry.png'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _setAnimation,
        child:
            Icon(_opacity == 1.0 ? Icons.remove_red_eye : Icons.visibility_off),
      ),
    );
  }

  void _setAnimation() => setState(() {
        _opacity = _opacity == 1.0 ? 0.0 : 1.0;
      });
}
