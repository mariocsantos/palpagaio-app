import 'package:flashlight/features/flashcard/presentation/screens/add_flashcard_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  _goToStudySession(BuildContext context) {
    Navigator.pushNamed(context, '/session');
  }

  _addFlashcard(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const AddFlashcardScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Column(
            children: [
              const SizedBox(height: 52),
              InkWell(
                onTap: () => _goToStudySession(context),
                borderRadius: BorderRadius.circular(12),
                splashColor: Colors.white.withOpacity(0.24),
                highlightColor: Colors.transparent,
                child: Ink(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white.withOpacity(0.54),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment(0.8, 1),
                      colors: [
                        Color(0xFF63f8b5),
                        Color(0xFF7765e3),
                      ],
                    ),
                    // TODO: show shadow on press
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.black.withOpacity(0.16),
                    //     offset: const Offset(0, 2),
                    //     blurRadius: 4,
                    //   ),
                    // ],
                  ),
                  height: 120,
                  child: const Center(
                    child: Text(
                      'Go to study session',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _addFlashcard(context),
        label: const Text('Add cards'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
