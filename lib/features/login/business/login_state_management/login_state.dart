part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class SignInAccountState extends LoginState {
  final String message;
  final bool isLoaded;
  final bool isSuccess;

  SignInAccountState({required this.message, required this.isLoaded, required this.isSuccess});
}

