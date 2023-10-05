part of 'singin_cubit.dart';

sealed class SinginState {}

final class SinginInitial extends SinginState {}

final class LoginInitial extends SinginState {}

final class SinginLoading extends SinginState {}

final class SinginSuccess extends SinginState {}

final class SinginFalier extends SinginState {
  final String message;

  SinginFalier(this.message);
}

final class SinginFalierfb extends SinginState {
  final String message;

  SinginFalierfb(this.message);
}
