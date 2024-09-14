import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState({
    this.isAuthenticated = false,
    this.user,
  });

  final bool isAuthenticated;
  final User? user;

  @override
  List<Object?> get props => [isAuthenticated, user];

  AuthenticationState copyWith({
    bool? isAuthenticated,
    User? user,
  }) {
    return AuthenticationState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      user: user ?? this.user,
    );
  }
}
