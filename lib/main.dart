import 'package:flutter/material.dart';
import 'package:flutter_animation/implicit_animations/animated_opacity.dart';

import 'animation_basics.dart';
import 'explicit_animations/animated_builder.dart';
import 'explicit_animations/fade_transition.dart';
import 'explicit_animations/positioned_transition.dart';
import 'explicit_animations/rotation_transition.dart';
import 'explicit_animations/size_transition.dart';
import 'explicit_animations/tween_builder.dart';
import 'implicit_animations/animated_align.dart';
import 'implicit_animations/animated_container.dart';
import 'implicit_animations/animated_physical_model.dart';
import 'implicit_animations/animated_position.dart';
import 'implicit_animations/animated_position_direction.dart';
import 'implicit_animations/animated_text_style.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animations',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: Scaffold(
          appBar: AppBar(title: const Text('Animations')),
          body: Builder(builder: (context) {
            return Center(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(16.0),
                children: [
                  _buildImplicitItem(
                      context, 'Animation Basics', const AnimationBasicsPage()),
                  _buildImplicitItem(
                      context, 'Animated Align', const AnimatedAlignPage()),
                  _buildImplicitItem(context, 'Animated Container',
                      const AnimatedContainerPage()),
                  _buildImplicitItem(context, 'Animated Text Style',
                      const AnimatedTextStylePage()),
                  _buildImplicitItem(
                      context, "Animated Opacity", const AnimatedOpacityPage()),
                  _buildImplicitItem(context, "Animated Physical Model",
                      const AnimatedPhysicalModelPage()),
                  _buildImplicitItem(context, "Animated Position",
                      const AnimatedPositionPage()),
                  _buildImplicitItem(context, "Animated Position Direction",
                      const AnimatedPositionDirectionPage()),
                  _buildExplicitItem(context, "Positioned Transition",
                      const PositionedTransitionPage()),
                  _buildExplicitItem(
                      context, "Size Transition", const SizeTransitionPage()),
                  _buildExplicitItem(context, "Rotation Transition",
                      const RotationTransitionPage()),
                  _buildExplicitItem(
                      context, "Animated Builder", const AnimatedBuilderPage()),
                  _buildExplicitItem(
                      context, "Fade Transition", const FadeTransitionPage()),
                  _buildExplicitItem(
                      context, "Tween Builder", const TweenBuilderPage()),
                ],
              ),
            );
          })),
    );
  }

  Widget _buildImplicitItem(
    BuildContext context,
    String s,
    Widget next,
  ) =>
      ElevatedButton(
        child: Text(s),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => next)),
      );

  Widget _buildExplicitItem(
    BuildContext context,
    String s,
    Widget next,
  ) =>
      ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
        child: Text(s),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => next)),
      );
}
