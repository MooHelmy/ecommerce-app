import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'singin_state.dart';

class SinginCubit extends Cubit<SinginState> {
  SinginCubit() : super(SinginInitial());

  singin({required String email, required String password}) async {
    emit(SinginLoading());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SinginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('weakpassword');
      } else if (e.code == 'email-already-in-use') {
        print('email is already use');
      }
      emit(SinginFalierfb(e.toString()));
    } catch (e) {
      print(e);
      emit(SinginFalier(e.toString()));
    }
  }
}
