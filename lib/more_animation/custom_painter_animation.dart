// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomPainterPage extends StatefulWidget {
  const CustomPainterPage({super.key});

  @override
  State<CustomPainterPage> createState() => _CustomPainterPageState();
}

class _CustomPainterPageState extends State<CustomPainterPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _sizeAnimation;
  late final Animation<Color?> _colorAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _sizeAnimation = Tween<double>(begin: 50, end: 150).animate(_controller);
    _colorAnimation = ColorTween(begin: Colors.red, end: Colors.indigo)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Custom Painter'),
        ),
        body: Center(
          child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return CustomPaint(
                  painter: CirclePainter(
                    _sizeAnimation.value,
                    _colorAnimation.value ?? Colors.transparent,
                  ),
                  size: const Size(300, 300),
                );
              }),
        ));
  }
}

class CirclePainter extends CustomPainter {
  final double _size;
  final Color _color;
  CirclePainter(
    this._size,
    this._color,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = _color
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), _size, paint);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) {
    return _size != oldDelegate._size || _color != oldDelegate._color;
  }
}
