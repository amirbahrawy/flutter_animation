import 'package:flutter/material.dart';
import 'package:flutter_animation/implicit_animation/animated_opacity.dart';

import 'animation_basics.dart';
import 'implicit_animation/animated_align.dart';
import 'implicit_animation/animated_container.dart';
import 'implicit_animation/animated_physical_model.dart';
import 'implicit_animation/animated_position.dart';
import 'implicit_animation/animated_position_direction.dart';
import 'implicit_animation/animated_text_style.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animations',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: Scaffold(
          appBar: AppBar(title: const Text('Animations')),
          body: Builder(builder: (context) {
            return Center(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(16.0),
                children: [
                  _buildItem(
                      context, 'Animation Basics', const AnimationBasicsPage()),
                  _buildItem(
                      context, 'Animated Align', const AnimatedAlignPage()),
                  _buildItem(context, 'Animated Container',
                      const AnimatedContainerPage()),
                  _buildItem(context, 'Animated Text Style',
                      const AnimatedTextStylePage()),
                  _buildItem(
                      context, "Animated Opacity", const AnimatedOpacityPage()),
                  _buildItem(context, "Animated Physical Model",
                      const AnimatedPhysicalModelPage()),
                  _buildItem(context, "Animated Position",
                      const AnimatedPositionPage()),
                  _buildItem(context, "Animated Position DirectionPage",
                      const AnimatedPositionDirectionPage())
                ],
              ),
            );
          })),
    );
  }

  Widget _buildItem(
    BuildContext context,
    String s,
    Widget next,
  ) {
    return ElevatedButton(
      child: Text(s),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => next,
          ),
        );
      },
    );
  }
}
