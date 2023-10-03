import 'package:flutter/material.dart';

class PageScaleTransition extends PageRouteBuilder {
  final Widget page;
  final Duration duration;
  PageScaleTransition({
    required this.page,
    this.duration = const Duration(milliseconds: 300),
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: duration,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            animation = Tween<double>(begin: 0.4, end: 1.0).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeInOut));
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
        );
}
