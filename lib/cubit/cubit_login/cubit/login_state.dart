part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginFalier extends LoginState {
  final String message;

  LoginFalier(this.message);
}

final class LoginFalierfib extends LoginState {
  final String message;

  LoginFalierfib(this.message);
}
