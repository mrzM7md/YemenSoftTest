import 'package:get_it/get_it.dart';
import 'package:yemen_soft_test/features/business/app_logic/app_logic.dart';
import 'package:yemen_soft_test/features/business/app_methods/app_methods.dart';

final sl = GetIt.instance;

class SetupServiceLocator {
  void init() {
    sl.registerLazySingleton(() => AppLogic());
    sl.registerLazySingleton(() => AppMethods(
      baseAppLogic: sl<AppLogic>()
    ));
  }
}
