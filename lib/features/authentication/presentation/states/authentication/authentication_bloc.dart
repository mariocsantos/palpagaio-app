import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palpagaio/features/authentication/data/firebase_authentication_repository.dart';
import 'package:palpagaio/features/authentication/presentation/states/authentication/authentication.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required FirebaseAuthenticationRepository firebaseAuthenticationRepository,
  })  : _repository = firebaseAuthenticationRepository,
        super(const AuthenticationState()) {
    on<AppStarted>(_onAppStarted);
    on<SignInWithGoogle>(_onSignInWithGoogle);
    on<SignOut>(_signOut);
  }

  final FirebaseAuthenticationRepository _repository;

  _onAppStarted(
    AppStarted event,
    Emitter<AuthenticationState> emit,
  ) {
    final user = _repository.getCurrentUser();
    emit(AuthenticationState(
      isAuthenticated: user != null,
      user: user,
    ));
  }

  _onSignInWithGoogle(
    SignInWithGoogle event,
    Emitter<AuthenticationState> emit,
  ) async {
    final credential = await _repository.signInWithGoogle();

    if (credential?.user?.email != null) {
      emit(AuthenticationState(
        isAuthenticated: true,
        user: credential?.user,
      ));
    } else {
      emit(const AuthenticationState(
        isAuthenticated: false,
        user: null,
      ));
    }
  }

  _signOut(
    SignOut event,
    Emitter<AuthenticationState> emit,
  ) async {
    await _repository.signOut();
    emit(const AuthenticationState(
      isAuthenticated: false,
      user: null,
    ));
  }
}
