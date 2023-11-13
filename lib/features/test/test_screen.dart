import 'dart:ui';

import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> with TickerProviderStateMixin {
  late AnimationController _widthController;
  late Animation<double> _widthAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the width animation controller
    _widthController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Create a Tween for the width animation
    const double initialWidth = 0.0;
    const double finalWidth = 200.0;
    final Tween<double> widthTween = Tween<double>(
      begin: initialWidth,
      end: finalWidth,
    );

    // Attach the width Tween to the width AnimationController
    _widthAnimation = widthTween.animate(_widthController);
  }

  @override
  void dispose() {
    // Dispose the controllers when the widget is disposed
    _widthController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Width Box'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(32),
                ),
                child: SizedBox(
                  width: 300,
                  height: 300,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                        child: Image.asset(
                          'assets/images/background.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Blurred Overlay
                      SizedBox(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 5.0,
                            sigmaY: 5.0,
                          ), // Adjust the blur intensity
                          child: Container(
                            color: Colors.black.withOpacity(
                              0.4,
                            ), // Adjust the opacity as needed
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Toggle the width animation on tap
          if (_widthController.status == AnimationStatus.completed) {
            _widthController.reverse();
          } else {
            _widthController.forward();
          }
        },
      ),
    );
  }
}
