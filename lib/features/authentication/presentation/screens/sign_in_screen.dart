import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:palpagaio/features/authentication/presentation/states/authentication/authentication_bloc.dart';
import 'package:palpagaio/features/authentication/presentation/states/authentication/authentication_events.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  void _signInWithGoogle(BuildContext context) async {
    final AuthenticationBloc bloc =
        BlocProvider.of<AuthenticationBloc>(context);

    bloc.add(SignInWithGoogle());
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            Column(
              children: [
                const SizedBox(height: 160),
                SvgPicture.asset(
                  'assets/images/logo.svg',
                  width: 140,
                ),
                const SizedBox(height: 24),
                SvgPicture.asset(
                  'assets/images/branding.svg',
                  width: 200,
                ),
              ],
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  foregroundColor: colorScheme.onSurface,
                  overlayColor: colorScheme.onSurface.withOpacity(0.1),
                ),
                label: const Text('Sign in with Google'),
                onPressed: () => _signInWithGoogle(context),
                icon: SvgPicture.asset(
                  'assets/images/google_brand.svg',
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
