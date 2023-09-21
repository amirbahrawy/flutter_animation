import 'package:flutter/material.dart';

class AnimationBasicsPage extends StatefulWidget {
  const AnimationBasicsPage({super.key});

  @override
  State<AnimationBasicsPage> createState() => _AnimationBasicsPageState();
}

class _AnimationBasicsPageState extends State<AnimationBasicsPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _animationColor;
  late Animation<Size?> _animationSize;
  @override
  void initState() {
    super.initState();
    // initialize animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    // initialize tween
    _animationColor = ColorTween(begin: Colors.red, end: Colors.blue)
        .animate(_animationController);
    _animationSize =
        SizeTween(begin: const Size(100, 100), end: const Size(200, 200))
            .animate(CurvedAnimation(
                parent: _animationController, curve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animation Basics')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Container(
                  height: _animationSize.value?.height,
                  width: _animationSize.value?.width,
                  color: _animationColor.value,
                );
              },
            ),
          ),
          // it start automatically without controller or any animation value
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 1),
              duration: const Duration(seconds: 1),
              curve: Curves.easeIn,
              builder: (c, value, d) {
                return Opacity(
                  opacity: value,
                  child: const Text(
                    'Hello World',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                );
              }),
          ElevatedButton(
            onPressed: () {
              // start animation
              _animationController.forward();
            },
            child: const Text('Animate'),
          ),
          //reverse animation
          ElevatedButton(
            onPressed: () {
              _animationController.reverse();
            },
            child: const Text('Reverse'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // dispose animation controller
    _animationController.dispose();
    super.dispose();
  }
}
