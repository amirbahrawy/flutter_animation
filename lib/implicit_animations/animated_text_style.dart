import 'package:flutter/material.dart';

class AnimatedTextStylePage extends StatefulWidget {
  const AnimatedTextStylePage({super.key});

  @override
  State<AnimatedTextStylePage> createState() => _AnimatedTextStylePageState();
}

class _AnimatedTextStylePageState extends State<AnimatedTextStylePage> {
  double _size = 20;
  Color _color = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Text Style')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedDefaultTextStyle(
            style: TextStyle(fontSize: _size, color: _color),
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeIn,
            child: const Text("Animated Text Style"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _setAnimation,
                icon: const Icon(Icons.add),
              ),
              IconButton(
                onPressed: _resetAnimation,
                icon: const Icon(Icons.remove),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _setAnimation() => setState(() {
        _size = 40.0;
        _color = Colors.orange;
      });
  void _resetAnimation() => setState(() {
        _size = 20.0;
        _color = Colors.grey;
      });
}
