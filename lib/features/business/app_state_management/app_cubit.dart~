import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../login_methods/base_login_methods.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.baseLoginMethods}) : super(LoginInitial());

  BaseLoginMethods baseLoginMethods;

  static LoginCubit get(context) => BlocProvider.of(context);

  Future<void> login({required String username, required String password}) async {
    // emit(SignInAccount(isSuccess: false, isLoaded: false, message: ""));
    // final result = await baseLoginMethods.login(username: "$username@gmail.com", password: password);
    // result.fold((l) => emit(
    //     SignInAccount(message: l.message, isLoaded: true, isSuccess: false)
    // ), (r) => emit(
    //     SignInAccount(message: r.message, isLoaded: true, isSuccess: true)
    // ));
  }
}