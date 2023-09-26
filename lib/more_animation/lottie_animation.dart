import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

const List<String> _lottieFiles = [
  'assets/lottie/bird.json',
  'assets/lottie/car.json',
  'assets/lottie/tigger.json',
];

class LottieAnimationPage extends StatefulWidget {
  const LottieAnimationPage({super.key});

  @override
  State<LottieAnimationPage> createState() => _LottieAnimationPageState();
}

class _LottieAnimationPageState extends State<LottieAnimationPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lottie Animation')),
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          _currentPage = index;
          setState(() {});
        },
        itemBuilder: (context, index) {
          return Center(
            child: Lottie.asset(
              _lottieFiles[index],
              repeat: true,
              reverse: false,
            ),
          );
        },
        itemCount: _lottieFiles.length,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.bug_report),
            label: 'Bird',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_crash),
            label: 'Car',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.animation_outlined),
            label: 'Tigger',
          ),
        ],
      ),
    );
  }
}
