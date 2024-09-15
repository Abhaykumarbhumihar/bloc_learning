// lib/presentation/signin/bloc/signin_state.dart
part of 'signin_bloc.dart';

final class SigninState extends Equatable {
  final String email;
  final String password;
  final bool isAuthenticated;
  final bool isLoading; // For handling loading state
  final String? errorMessage; // For handling error messages

  SigninState({
    this.email = '',
    this.password = '',
    this.isAuthenticated = false,
    this.isLoading = false,
    this.errorMessage,
  });

  SigninState copyWith({
    String? email,
    String? password,
    bool? isAuthenticated,
    bool? isLoading,
    String? errorMessage,
  }) {
    return SigninState(
      email: email ?? this.email,
      password: password ?? this.password,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [email, password, isAuthenticated, isLoading, errorMessage];
}

