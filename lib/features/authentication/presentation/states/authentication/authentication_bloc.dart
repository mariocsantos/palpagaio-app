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
    final isAuthenticated = _repository.isAuthenticated();
    emit(AuthenticationState(isAuthenticated: isAuthenticated));
  }

  _onSignInWithGoogle(
    SignInWithGoogle event,
    Emitter<AuthenticationState> emit,
  ) async {
    final crendential = await _repository.signInWithGoogle();

    if (crendential?.user?.email != null) {
      emit(AuthenticationState(isAuthenticated: true));
    } else {
      emit(AuthenticationState(isAuthenticated: false));
    }
  }

  _signOut(
    SignOut event,
    Emitter<AuthenticationState> emit,
  ) async {
    await _repository.signOut();
    emit(AuthenticationState(isAuthenticated: false));
  }
}
