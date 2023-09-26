import 'package:flutter/material.dart';

class PositionedTransitionPage extends StatefulWidget {
  const PositionedTransitionPage({super.key});

  @override
  State<PositionedTransitionPage> createState() =>
      _PositionedTransitionPageState();
}

class _PositionedTransitionPageState extends State<PositionedTransitionPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<RelativeRect> _jerryAnimation;
  late final Animation<RelativeRect> _tomAnimation;
  late final Animation<RelativeRect> _spikeAnimation;
  late final CurvedAnimation _curveAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    _curveAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _jerryAnimation = RelativeRectTween(
      begin: const RelativeRect.fromLTRB(0, 0, 0, 0),
      end: const RelativeRect.fromLTRB(250, 250, 0, 0),
    ).animate(_curveAnimation);
    _tomAnimation = RelativeRectTween(
      begin: const RelativeRect.fromLTRB(0, 0, 0, 0),
      end: const RelativeRect.fromLTRB(150, 150, 0, 0),
    ).animate(_curveAnimation);
    _spikeAnimation = RelativeRectTween(
      begin: const RelativeRect.fromLTRB(0, 0, 0, 0),
      end: const RelativeRect.fromLTRB(50, 50, 0, 0),
    ).animate(_curveAnimation);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Positioned Transition')),
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            PositionedTransition(
              rect: _spikeAnimation,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blueGrey,
                child: Image.asset('assets/images/dog.png'),
              ),
            ),
            PositionedTransition(
              rect: _tomAnimation,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.grey,
                child: Image.asset('assets/images/tom.png'),
              ),
            ),
            PositionedTransition(
              rect: _jerryAnimation,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.orange,
                child: Image.asset('assets/images/jerry.png'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: () {
          if (_controller.status == AnimationStatus.completed)
            _controller.reverse();
          else {
            _controller.reset();
            _controller.forward();
          }
        },
      ),
    );
  }
}
