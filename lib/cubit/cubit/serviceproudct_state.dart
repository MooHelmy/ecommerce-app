part of 'serviceproudct_cubit.dart';

sealed class AddproudctState {}

final class AddproudctInitial extends AddproudctState {}

final class Addproudcsuccess extends AddproudctState {
  List<proudct_model> prodctlist = [];
  Addproudcsuccess({required this.prodctlist});
}

final class Updateproudctsucess extends AddproudctState {}
