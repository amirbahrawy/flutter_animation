import 'package:flutter/material.dart';
import 'package:flutter_animation/implicit_animations/animated_opacity.dart';
import 'package:flutter_animation/more_animation/custom_painter_animation.dart';
import 'package:flutter_animation/more_animation/lottie_animation.dart';
import 'package:flutter_animation/page_transitions/new_page.dart';
import 'package:flutter_animation/page_transitions/page_fade_transition.dart';

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
import 'page_transitions/page_mix_size_fade_transition.dart';
import 'page_transitions/page_size_transition.dart';
import 'page_transitions/page_scale_transition.dart';
import 'page_transitions/page_slide_transition.dart';

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
                  _buildPageTransitionItem(
                      "Page Fade Transition",
                      () => Navigator.of(context)
                          .push(PageFadeTransition(page: const NewPage()))),
                  _buildPageTransitionItem(
                      "Page Scale Transition",
                      () => Navigator.of(context)
                          .push(PageScaleTransition(page: const NewPage()))),
                  _buildPageTransitionItem(
                      "Page Slide Transition",
                      () => Navigator.of(context)
                          .push(PageSlideTransition(page: const NewPage()))),
                  _buildPageTransitionItem(
                      "Page Size Transition",
                      () => Navigator.of(context)
                          .push(PageSizeTransition(page: const NewPage()))),
                  _buildPageTransitionItem(
                      "Page Mix Size Fade Transition",
                      () => Navigator.of(context).push(
                          PageMixSizeFadeTransition(page: const NewPage()))),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange),
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const CustomPainterPage())),
                    child: const Text("Custom Painter"),
                  ),
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const LottieAnimationPage())),
                    child: const Text("Lottie Animation"),
                  ),
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
  Widget _buildPageTransitionItem(String s, Function() onPressed) =>
      ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
        onPressed: onPressed,
        child: Text(s),
      );
}
