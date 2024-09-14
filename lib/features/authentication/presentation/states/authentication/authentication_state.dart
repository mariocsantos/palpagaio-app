import 'package:equatable/equatable.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState({this.isAuthenticated = false});

  final bool isAuthenticated;

  @override
  List<Object> get props => [isAuthenticated];

  AuthenticationState copyWith({
    bool? isAuthenticated,
  }) {
    return AuthenticationState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}
