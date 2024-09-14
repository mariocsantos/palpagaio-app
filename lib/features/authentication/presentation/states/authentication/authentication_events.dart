abstract class AuthenticationEvent {}

class AppStarted extends AuthenticationEvent {}

class SignInWithGoogle extends AuthenticationEvent {}

class SignOut extends AuthenticationEvent {}
