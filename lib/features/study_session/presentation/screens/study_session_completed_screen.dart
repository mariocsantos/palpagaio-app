import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class StudySessionCompletedScreen extends StatefulWidget {
  const StudySessionCompletedScreen({super.key});

  @override
  State<StudySessionCompletedScreen> createState() =>
      _StudySessionCompletedScreenState();
}

class _StudySessionCompletedScreenState
    extends State<StudySessionCompletedScreen> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
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
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              const Spacer(
                flex: 1,
              ),
              Lottie.asset(
                'assets/animations/celebration.json',
                controller: _controller,
                width: 300,
                onLoaded: (composition) {
                  _controller
                    ..duration = const Duration(milliseconds: 1500)
                    ..forward().whenComplete(
                      () => _controller.stop(),
                    );
                },
              ),
              const SizedBox(height: 36),
              const Text(
                'Congratulations!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                'You have completed the study session.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              const Spacer(
                flex: 2,
              ),
              FilledButton(
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
                child: const Text('Go back home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
