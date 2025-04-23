part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class SignInAccount extends LoginState {
  final String message;
  final bool isLoaded;
  final bool isSuccess;

  SignInAccount({required this.message, required this.isLoaded, required this.isSuccess});
}

