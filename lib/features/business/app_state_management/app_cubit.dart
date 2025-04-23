import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../app_methods/base_app_methods.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({required this.baseAppMethods}) : super(AppInitial());

  BaseAppMethods baseAppMethods;

  static AppCubit get(context) => BlocProvider.of(context);

  void loadGlobalAppState(){
    emit(LoadGlobalAppState());
  }
}