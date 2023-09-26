import 'package:flutter/material.dart';

class TweenBuilderPage extends StatefulWidget {
  const TweenBuilderPage({super.key});

  @override
  State<TweenBuilderPage> createState() => _TweenBuilderPageState();
}

class _TweenBuilderPageState extends State<TweenBuilderPage> {
  double _opacity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tween Builder')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: _opacity),
              duration: const Duration(seconds: 1),
              builder: (context, value, child) => Opacity(
                opacity: value,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(value * 40),
                    color: Colors.indigo,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => setState(() {
              _opacity = _opacity == 0 ? 1 : 0;
            }),
            child: const Text('Animate'),
          )
        ],
      ),
    );
  }
}
