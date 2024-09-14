import 'package:palpagaio/features/authentication/data/firebase_authentication_repository.dart';
import 'package:palpagaio/features/authentication/presentation/screens/sign_in_screen.dart';
import 'package:palpagaio/features/authentication/presentation/states/authentication/authentication.dart';
import 'package:palpagaio/features/home/presentation/screens/home_screen.dart';
import 'package:palpagaio/features/study_session/data/study_session_repository.dart';
import 'package:palpagaio/features/study_session/presentation/screens/study_session_completed_screen.dart';
import 'package:palpagaio/features/study_session/presentation/screens/study_session_screen.dart';
import 'package:palpagaio/features/study_session/presentation/state/study_session/study_session.dart';
import 'package:palpagaio/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'firebase_options.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(
        firebaseAuthenticationRepository: FirebaseAuthenticationRepository(),
      )..add(
          AppStarted(),
        ),
      child: MaterialApp(
        initialRoute: '/',
        theme: themeData,
        routes: {
          '/': (context) => const App(),
          '/session': (context) => BlocProvider(
                create: (context) => StudySessionBloc(
                  studySessionRepository: StudySessionRepository(),
                ),
                child: const StudySessionScreen(),
              ),
          '/session/completed': (context) =>
              const StudySessionCompletedScreen(),
        },
      ),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (!state.isAuthenticated) {
          return const SignInScreen();
        } else {
          return const HomeScreen();
        }
      },
    );
  }
}
