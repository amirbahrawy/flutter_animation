import 'package:flutter/material.dart';

class PageSlideTransition extends PageRouteBuilder {
  final Widget page;
  final Duration duration;
  PageSlideTransition({
    required this.page,
    this.duration = const Duration(milliseconds: 300),
  }) : super(
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionDuration: duration,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(-1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            });
}
