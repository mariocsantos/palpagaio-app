import 'package:flashlight/features/home/presentation/screens/home_screen.dart';
import 'package:flashlight/features/study_session/data/study_session_repository.dart';
import 'package:flashlight/features/study_session/presentation/screens/study_session_completed_screen.dart';
import 'package:flashlight/features/study_session/presentation/screens/study_session_screen.dart';
import 'package:flashlight/features/study_session/presentation/state/study_session/study_session.dart';
import 'package:flashlight/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      theme: themeData,
      routes: {
        '/': (context) => const HomeScreen(),
        '/session': (context) => BlocProvider(
              create: (context) => StudySessionBloc(
                studySessionRepository: StudySessionRepository(),
              ),
              child: const StudySessionScreen(),
            ),
        '/session/completed': (context) => const StudySessionCompletedScreen(),
      },
    );
  }
}
