import 'package:flutter/material.dart';

class PageFadeTransition extends PageRouteBuilder {
  final Widget page;
  final Duration duration;

  PageFadeTransition({
    required this.page,
    this.duration = const Duration(milliseconds: 400),
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: duration,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}
