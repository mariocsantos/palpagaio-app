import 'package:flashlight/features/home/presentation/screens/home_screen.dart';
import 'package:flashlight/features/study_session/presentation/screens/study_session_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/session': (context) => const StudySessionScreen(),
      },
    );
  }
}
