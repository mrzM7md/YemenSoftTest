import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:yemen_soft_test/features/login/data/models/user_login_model.dart';

import '../login_methods/base_login_methods.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.baseLoginMethods}) : super(LoginInitial());

  final BaseLoginMethods baseLoginMethods;

  static LoginCubit get(context) => BlocProvider.of(context);

  Future<void> login({required UserLoginModel user}) async {
    emit(SignInAccountState(isSuccess: false, isLoaded: false, message: ""));
    final result = await baseLoginMethods.login(user: user);
    result.fold((l) => emit(
        SignInAccountState(message: l.message, isLoaded: true, isSuccess: false)
    ), (r) {
      baseLoginMethods.baseLoginLogic.storeDeliverInfoOnCache(deliveryName: r.data.deliveryName ?? "--", deliveryUsername: user.deliveryNo ?? "--") ;
      emit(
          SignInAccountState(message: r.message, isLoaded: true, isSuccess: true)
      );
    }
    );
  }
}